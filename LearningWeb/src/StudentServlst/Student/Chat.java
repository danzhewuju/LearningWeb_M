package StudentServlst.Student;

import DAO.ChatDao;
import Page.ChatPage;
import Page.CoursePage;
import Page.StudentPage;

import java.util.ArrayList;

public class Chat {
    private StudentPage studentPage;      //学生的相关信息，这个学生是确定
    private CoursePage coursePage;       //课程的相关信息，这个课程也要确定
    private ArrayList<ChatPaper> chatPapersBycid;//由cid所分类的问题集合
    private ArrayList<ChatPaper> chatPapersBysid;//由sid所分类的问题集合

    public Chat(StudentPage studentPage, CoursePage coursePage) {
        this.studentPage = studentPage;
        this.coursePage = coursePage;

        setChatPapersBycid(coursePage);
        setChatPapersBysid(studentPage);
    }

    public StudentPage getStudentPage() {
        return studentPage;
    }

    public void setStudentPage(StudentPage studentPage) {
        this.studentPage = studentPage;
    }

    public CoursePage getCoursePage() {
        return coursePage;
    }

    public void setCoursePage(CoursePage coursePage) {
        this.coursePage = coursePage;
    }

    public ArrayList<ChatPaper> getChatPapersBycid() {
        return chatPapersBycid;
    }

    /*生成讨论的问题列表
     * 对于确定的课程的所有的讨论结果
     * */
    public void setChatPapersBycid(CoursePage coursePage) {
        ChatDao chatDao = new ChatDao();
        ArrayList<ChatPage> chatPages = (ArrayList<ChatPage>) chatDao.GetAllByColumn("courseid", coursePage.getId());
        chatPapersBycid = null;
        if (chatPages.size() > 0) {
            chatPapersBycid = new ArrayList<>();
            for (ChatPage chatPage : chatPages) {
                ChatPaper chatPaper = new ChatPaper(chatPage);
                chatPapersBycid.add(chatPaper);
            }
        }

    }

    public ArrayList<ChatPaper> getChatPapersBysid() {
        return chatPapersBysid;
    }

    /*生成学生端的讨论列表*/
    public void setChatPapersBysid(StudentPage studentPage) {
        ChatDao chatDao = new ChatDao();
        ArrayList<ChatPage> chatPages = (ArrayList<ChatPage>) chatDao.GetAllByColumn("studentid", studentPage.getId());
        chatPapersBysid = null;
        if (chatPages.size() > 0) {
            chatPapersBysid = new ArrayList<>();
            for (ChatPage chatPage : chatPages) {
                ChatPaper chatPaper = new ChatPaper(chatPage);
                chatPapersBysid.add(chatPaper);

            }

        }


    }
}
