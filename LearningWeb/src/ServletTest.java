import Util.FileUpload;
import Util.GetFilePath;
import Util.Message;

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


        response.sendRedirect("test.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Message.alermessage(response,"this is test","test.jsp");
//        response.sendRedirect("test.jsp");
    }
}
