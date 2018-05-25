package StudentServlst;

import Page.StudentPage;
import StudentServlst.Student.ProgressStuCou;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "StuCheckScore",value = "/StuCheckScore")
public class StuCheckScore extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentPage studentPage= (StudentPage) request.getSession().getAttribute("studentpage");
        ProgressStuCou progressStuCou=new ProgressStuCou(studentPage);
        request.getSession().setAttribute("progressstucou",progressStuCou);
        response.sendRedirect("Student/CheckScore.jsp");

    }
}
