package StudentServlst.Student;

import DAO.CourseDAO;
import DAO.RelationDAO;
import Page.CoursePage;
import Page.RelationPage;

import java.util.ArrayList;

/**
 * Created by 16689 on 2017/7/1.
 */
public class SuggestCourse {
    private CoursePage learningcoursePage;//课程
    private ArrayList<CoursePage> suggestcourse;//该课程的建议课程
    static private ArrayList<CoursePage> choosedcourse;//已知学习序列，固定的序列
    private int suggestcount;//该建议课程的个数

    public void setSuggestcourse(ArrayList<CoursePage> suggestcourse) {
        this.suggestcourse = suggestcourse;
    }



    public SuggestCourse(CoursePage learningcoursePage, ArrayList<CoursePage> choosedcourse) {
        this.learningcoursePage = learningcoursePage;
        this.choosedcourse = choosedcourse;
        setSuggestcourse();  //获得课程的前置节点
        fliter();


    }

    public CoursePage getLearningcoursePage() {
        return learningcoursePage;
    }

    public void setLearningcoursePage(CoursePage learningcoursePage) {
        this.learningcoursePage = learningcoursePage;
    }

    public ArrayList<CoursePage> getSuggestcourse() {
        return suggestcourse;
    }

    public void setSuggestcourse() {//获得课程的前节点
        RelationDAO relationDAO = new RelationDAO();
        suggestcourse = new ArrayList<>();
        ArrayList<RelationPage> relationPages = (ArrayList<RelationPage>) relationDAO.GetAllByColumn("courseid", learningcoursePage.getId());
        CourseDAO courseDAO = new CourseDAO();
        for (int i = 0; i < relationPages.size(); i++) {
            CoursePage coursePage = courseDAO.GetById(relationPages.get(i).getFrontcourseid());
            suggestcourse.add(coursePage);
        }
        setSuggestcount(suggestcourse.size());

    }

    public int getSuggestcount() {
        return suggestcount;
    }

    public void setSuggestcount(int suggestcount) {
        this.suggestcount = suggestcount;
    }


    public void fliter() { //过滤掉已经选择的课程
     //   ArrayList<CoursePage> record = new ArrayList<>();
        int len=suggestcount;
        for (int i = 0; i < len; i++) {


            for (int j = 0; j < choosedcourse.size(); j++) {
                if (suggestcourse.get(i).getId().equals(choosedcourse.get(j).getId())) {
                   suggestcourse.remove(i);
                   len--;
                   i--;
                   break;
                }

            }


        }
//        for (int i=0;i<record.size();i++)
//        {
//            suggestcourse.remove(i);//剔除掉建议课程中的已选课程
//        }
//        suggestcourse.removeAll(record);
        suggestcount=suggestcourse.size();
    }
}
