package AdministratorServlet;

import DAO.AdministratorDAO;
import DAO.TeacherDAO;
import Database.AddCourseDao;
import Page.AdministratorPage;
import Page.TeacherPage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/6/25.
 */
@WebServlet(name = "CheckLoginServlet", value = "/CheckLoginServlet")
public class CheckLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String kind = request.getParameter("kind");

        String username = request.getParameter("myusername").trim();
        String password = request.getParameter("mypassword").trim();


        if (kind != null) {
            if (kind.equals("admin")) {
                AddCourseDao dao = new AddCourseDao();
                boolean success = false;
                AdministratorDAO administratorDAO = new AdministratorDAO();
                AdministratorPage administratorPage = administratorDAO.GetByColumn("username", username);
                if (administratorPage != null && administratorPage.getPassword().equals(password)) {
                    success = administratorPage.getPassword().equals(password);
                }
//            success=dao.JudgeAdmin(username, password);判断有误
                if (!success) {
                    out.print("<script language='javascript'>alert('管理员账号或密码不正确，请重试！');"
                            + "window.location.href='login_ad.jsp';</script>");
                } else {
                    response.sendRedirect("Administrator/AdminHeadPage.jsp");
                }
            } else {
                TeacherDAO td = new TeacherDAO();
                List<TeacherPage> tplist = new ArrayList<>();
                tplist = td.GetAllByColumn("username", username);
                TeacherPage tp = new TeacherPage();
                boolean key = false;
                for (int i = 0; i < tplist.size(); i++) {
                    if (tplist.get(i).getPassword().equals(password)) {
                        tp = tplist.get(i);
                        key=true;
                        break;
                    }
                }
                if (tp != null && key) {
                    request.getSession().setAttribute("teacher", tp);
                    response.sendRedirect("teacher/T-homepage.jsp");
                } else {
                    out.print("<script language='javascript'>alert('老师账号或密码不正确，请重试！');"
                            + "window.location.href='login_ad.jsp';</script>");

                }
            }

        } else {
            out.print("<script language='javascript'>alert('请选择你的登录身份');"
                    + "window.location.href='login_ad.jsp';</script>");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
