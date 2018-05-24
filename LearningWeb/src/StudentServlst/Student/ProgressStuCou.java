package StudentServlst.Student;

import DAO.CourseDAO;
import DAO.ProgressDAO;
import Page.CoursePage;
import Page.ProgressPage;
import Page.StudentPage;

import java.util.ArrayList;
import java.util.HashMap;

/*学生课程相关信息保存*/
public class ProgressStuCou {
    private StudentPage studentPage;//学生的个人信息
    private ArrayList<ProgressCourseChapter> progressCourseChapters;//学生通过了考试，一个课程下的若干个章节

    private ArrayList<CoursePage> coursePages;//学生的已经通过了测试的课程 其数目应该和progressCourseChapters相同
    private int count;//学生通过课程章节的数目


    public ProgressStuCou(StudentPage studentPage) {
        this.studentPage = studentPage;
        setCoursePages();//学生课程的设置
        setProgressCourseChapters();//设置课程关系的对应关系
    }

    public StudentPage getStudentPage() {
        return studentPage;
    }

    public void setStudentPage(StudentPage studentPage) {
        this.studentPage = studentPage;
    }

    public ArrayList<ProgressCourseChapter> getProgressCourseChapters() {
        return progressCourseChapters;
    }

    public void setProgressCourseChapters() {
        progressCourseChapters=new ArrayList<>();
        for (CoursePage c:coursePages
             ) {
            ProgressCourseChapter progressCourseChapter=new ProgressCourseChapter(studentPage,c);
            progressCourseChapters.add(progressCourseChapter);

        }

    }

    public ArrayList<CoursePage> getCoursePages() {
        return coursePages;
    }

    public void setCoursePages() {
        HashMap hashMap=new HashMap();
        coursePages =new ArrayList<>();
        ProgressDAO progressDAO=new ProgressDAO();
        CourseDAO courseDAO=new CourseDAO();
        ArrayList<ProgressPage> progressPages= (ArrayList<ProgressPage>) progressDAO.GetAllByColumn("studentid",studentPage.getId());
        for (ProgressPage p:progressPages
             ) {
            if (hashMap.get(p.getCourseid())==null)
            {
             hashMap.put(p.getCourseid(),true);
             coursePages.add(courseDAO.GetById(p.getCourseid()));
            }
        }
        count=coursePages.size();
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
