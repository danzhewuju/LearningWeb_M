import Util.FileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletTest" ,value = "/ServletTest")
public class ServletTest extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//             String name=request.getParameter("test");
//             System.out.println(name);
        response.setContentType("text/html;charset=UTF-8");
        FileUpload fileUpload=new FileUpload("C:\\Programming\\JavaWeb\\LearningWeb\\LearningWeb\\web\\data\\examtest",request);
        fileUpload.upload();
        System.out.println(fileUpload.getHashMap().get("test").toString());
        System.out.println(fileUpload.getHashMap().get("name").toString());

        response.sendRedirect("test.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
