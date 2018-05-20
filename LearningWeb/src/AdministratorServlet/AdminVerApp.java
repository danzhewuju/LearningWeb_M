package AdministratorServlet;

import DAO.CourseDAO;
import DAO.RelationDAO;
import Database.AddCourseDao;
import Page.Course;
import Page.CoursePage;
import Page.RelationPage;
import Util.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by Administrator on 2017/6/27.
 */
@WebServlet(name = "AdminVerApp", value = "/AdminVerApp")
public class AdminVerApp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        int n;
        n = Integer.valueOf(request.getParameter("ID"));
        String type = request.getParameter("type");
        boolean success = false;
        AddCourseDao dao = new AddCourseDao();
        ArrayList<Course> list = (ArrayList<Course>) request.getSession().getAttribute("teacoulist");

        if (list == null) {
            list = new ArrayList<Course>();

        } else {
            Course c = (Course) list.get(n);
            request.getSession().setAttribute("Teacou", c);
            if (type.equals("1")) {
                success = dao.updateCourse(c, "通过审核");
                if (!success) {
                    out.print("<script language='javascript'>alert('操作失败！');"
                            + "window.location.href='Administrator/Admin-Verify.jsp';</script>");
                } else {
                    out.print("<script language='javascript'>alert('通过审核！');"
                            + "window.location.href='Administrator/Admin-CouAdd.jsp';</script>");

                    /*相关数据需要写入数据库*/
                    String uuid = UUID.randomUUID().toString().replace("-", "");
                    CourseDAO courseDAO = new CourseDAO();
                    CoursePage coursePage = new CoursePage();
                    coursePage.setPicture("../img/WX20170624-040847.png");//默认照片
                    coursePage.setIntroduction("暂时没有介绍");
                    coursePage.setKind("其他");
                    coursePage.setName(c.getCoursename());
                    coursePage.setTeacherid(c.getTeacherid());
                    coursePage.setId(uuid);
                    boolean flag = courseDAO.Add(coursePage);

                    /*上面将代码存入数据库*/
                    if (flag) {
                        if (c.getPrecourse1() != null) {
                            RelationDAO relationDAO = new RelationDAO();
                            RelationPage relationPage = new RelationPage();
                            relationPage.setCourseid(uuid);
                            relationPage.setFrontcourseid(c.getPrecourse1());
                            relationDAO.Add(relationPage);
                        }
                        if (c.getPrecourse2() != null) {
                            RelationDAO relationDAO = new RelationDAO();
                            RelationPage relationPage = new RelationPage();
                            relationPage.setCourseid(uuid);
                            relationPage.setFrontcourseid(c.getPrecourse2());
                            relationDAO.Add(relationPage);
                        }
                        if (c.getPrecourse3() != null) {
                            RelationDAO relationDAO = new RelationDAO();
                            RelationPage relationPage = new RelationPage();
                            relationPage.setCourseid(uuid);
                            relationPage.setFrontcourseid(c.getPrecourse3());
                            relationDAO.Add(relationPage);
                        }
                        if (c.getPrecourse4() != null) {
                            RelationDAO relationDAO = new RelationDAO();
                            RelationPage relationPage = new RelationPage();
                            relationPage.setCourseid(uuid);
                            relationPage.setFrontcourseid(c.getPrecourse4());
                        }

                    } else {
                        Message.alermessage(response, "数据库写回失败！", "Administrator/Admin-Verify.jsp");
                    }


                }


            } else {
                success = dao.updateCourse(c,"申请未通过");
                if (!success) {
                    out.print("<script language='javascript'>alert('操作失败！');"
                            + "window.location.href='Admin-Verify.jsp';</script>");
                } else {
                    Message.alermessage(response,"未通过审核","Administrator/Admin-Verify.jsp");
//                    out.print("<script language='javascript'>alert('未通过审核！');"
//                            + "window.location.href='Admin-Verify.jsp';</script>");
                }
            }
        }
    }
}