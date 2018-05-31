package StudentServlst;

import DAO.ChatDao;
import Page.ChatPage;
import Page.CoursePage;
import Page.StudentPage;
import StudentServlst.Student.Chat;
import StudentServlst.Student.Course;
import Util.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * 聊天内容的数据处理
 * */
@WebServlet(name = "StuBroChat", value = "/StuBroChat")
public class StuBroChat extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        StudentPage studentPage = (StudentPage) request.getSession().getAttribute("studentpage");
        Chat chat = (Chat) request.getSession().getAttribute("chat");

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
        String time = dateFormat.format(date);
        String status = "新";

        ChatDao chatDao = new ChatDao();
        ChatPage chatPage = new ChatPage();

        chatPage.setStudentid(studentPage.getId());
        chatPage.setCourseid(chat.getCoursePage().getId());
        chatPage.setStatus(status);
        chatPage.setTime(time);
        chatPage.setTitle(title);
        chatPage.setContent(content);

        boolean success = chatDao.Add(chatPage);
        if (success) {
            chat = new Chat(studentPage, chat.getCoursePage());               //生成贴吧的数据生成处理
            request.getSession().setAttribute("chat", chat);
            Message.alermessage(response, "发表成功", "Student/StuBroChat.jsp");
        } else {
            Message.alermessage(response, "系统故障", "Student/StuBroChat.jsp");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        StudentPage studentPage = (StudentPage) request.getSession().getAttribute("studentpage");
        Course course = (Course) request.getSession().getAttribute("course");
        int index = Integer.valueOf(request.getParameter("index"));
        String kind = request.getParameter("kind");
        CoursePage coursePage = null;
        if (kind.equals("main")) {
            coursePage = course.getChoosedcourses().get(index);
        } else {
            coursePage = course.getCanchoosecourses().get(index);
        }

        Chat chat = new Chat(studentPage, coursePage);               //生成贴吧的数据生成处理
        request.getSession().setAttribute("chat", chat);
        response.sendRedirect("Student/StuBroChat.jsp");
    }
}
