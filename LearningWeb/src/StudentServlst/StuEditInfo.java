package StudentServlst;

import DAO.StudentDAO;
import Page.StudentPage;
import Util.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.IOException;
import java.sql.Date;


/**
 * Created by ycbhci on 2017/6/27.
 */
@WebServlet(name = "StuEditInfo", value = "/StuEditInfo")
public class StuEditInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        StudentPage studentPage = (StudentPage) request.getSession().getAttribute("studentpage");
        String name, gendar, status, grade, email, major;
        String birthday;

        name = request.getParameter("name");
        birthday = request.getParameter("birthday");
        Date dbirthday = Date.valueOf(birthday);
        gendar = studentPage.getGendar();    //性别默认不可更改，以后可以提供更改
        status = request.getParameter("status");
        email = request.getParameter("email");
        grade = request.getParameter("grade");
        major = request.getParameter("major");

        String path = studentPage.getPicture();
        StudentPage studentPage1 = new StudentPage();
        studentPage1.setId(studentPage.getId());
        studentPage1.setUsername(studentPage.getUsername());
        studentPage1.setPassword(studentPage.getPassword());
        studentPage1.setPicture(path);
        studentPage1.setGrade(grade);
        studentPage1.setMajor(major);
        studentPage1.setGendar(gendar);
        studentPage1.setEmail(email);
        studentPage1.setBirthday(dbirthday);
        studentPage1.setName(name);
        studentPage1.setStatus(status);
        StudentDAO studentDAO = new StudentDAO();
       boolean success= studentDAO.Update(studentPage1);
       if(success)
       {
           request.getSession().setAttribute("studentpage", studentPage1);
           Message.alermessage(response,"修改成功！","Student/StuBaseInfo.jsp");
       }
       else
       {
           Message.alermessage(response,"修改失败！","Student/StuBaseInfo.jsp");
       }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
