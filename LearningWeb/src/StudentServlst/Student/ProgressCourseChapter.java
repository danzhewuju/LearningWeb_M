package StudentServlst.Student;

import DAO.ChapterDAO;
import DAO.ProgressDAO;
import Page.ChapterPage;
import Page.CoursePage;
import Page.ProgressPage;
import Page.StudentPage;

import java.util.ArrayList;

/* 此类用于progress学习进度表中课程与章节的对应关系，某些课程的章节已经通过了测试*/
public class ProgressCourseChapter {
    private StudentPage studentPage;
    private CoursePage coursePage;
    ArrayList<ChapterPage> chapterPages;//每个课程所对应的章节信息
    ArrayList<String> scores;//每个章节对应的分数
    private int count;//本课程下章节的学习分数

    public ProgressCourseChapter(StudentPage studentPage,CoursePage coursePage) {
        this.studentPage = studentPage;
        this.coursePage=coursePage;

        setChapterPages();//相关章节的信息保存

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

    public ArrayList<ChapterPage> getChapterPages() {
        return chapterPages;
    }

    public void setChapterPages() {
        ProgressDAO progressDAO=new ProgressDAO();
        scores=new ArrayList<>();
        chapterPages=new ArrayList<>();
        ChapterDAO chapterDAO=new ChapterDAO();
        ArrayList<ProgressPage> progressPages= (ArrayList<ProgressPage>) progressDAO.GetAllByColumn("studentid",studentPage.getId(),"courseid",coursePage.getId());
        for (ProgressPage p:progressPages) {
           ChapterPage chapterPage= chapterDAO.GetById(p.getChapterid());
           scores.add(p.getExamscore());//存储学生每个章节的考试结果
           chapterPages.add(chapterPage);//存储每个章节的信息

        }
        count=chapterPages.size();
    }

    public ArrayList<String> getScores() {
        return scores;
    }

    public void setScores(ArrayList<String> scores) {
        this.scores = scores;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
