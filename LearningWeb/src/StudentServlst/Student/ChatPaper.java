package StudentServlst.Student;

import DAO.CourseDAO;
import DAO.StudentDAO;
import DAO.TeacherDAO;
import Page.ChatPage;
import Page.CoursePage;
import Page.StudentPage;
import Page.TeacherPage;

import java.util.ArrayList;

public class ChatPaper {
    private CoursePage coursePage;//关于的课程相关信息
    private TeacherPage teacherPage;//教授该课程的教师的信息
    private StudentPage studentPage;//该问题的学生
    private String titles;//贴吧的题目
    private String id;//贴吧的id
    private String content;//论文的内容
    private String time;//发帖时间
    private String status;//状态

    public ChatPaper(ChatPage chatPage) {
        id=chatPage.getId();
        content=chatPage.getContent();
        time=chatPage.getTime();
        status=chatPage.getStatus();
        titles=chatPage.getTitle();

        setStudentPage(chatPage);     //学生的相关信
        setCoursePage(chatPage);      //设置课程的相关信息
        setTeacherPage();             //设置老师相关信息

    }

    public CoursePage getCoursePage() {
        return coursePage;
    }

    public void setCoursePage(ChatPage chatPage) {
        CourseDAO courseDAO=new CourseDAO();
        coursePage =courseDAO.GetById(chatPage.getCourseid());

    }

    public String getTitles() {
        return titles;
    }

    public void setTitles(String titles) {
        this.titles = titles;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public TeacherPage getTeacherPage() {
        return teacherPage;
    }

    public void setTeacherPage() {
        TeacherDAO teacherDAO = new TeacherDAO();
        teacherPage=teacherDAO.GetById(coursePage.getTeacherid());
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public StudentPage getStudentPage() {
        return studentPage;
    }

    public void setStudentPage(ChatPage chatPage) {
        StudentDAO studentDAO=new StudentDAO();
        studentPage=studentDAO.GetById(chatPage.getStudentid());
    }
}
