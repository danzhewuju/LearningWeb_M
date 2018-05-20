package Database;

import DAO.AddcourseDAO;
import DAO.CourseDAO;
import DAO.RelationDAO;
import DAO.TeacherDAO;
import Page.*;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Administrator on 2017/6/27.
 */
public class AddCourseDao extends BaseDao{
    public ArrayList<Course> findTeacherCourse(String result){
        AddcourseDAO addcourseDAO=new AddcourseDAO();
        ArrayList<AddcoursePage> addcoursePages= (ArrayList<AddcoursePage>) addcourseDAO.GetAllByColumn("result",result);
        TeacherDAO teacherDAO =new TeacherDAO();
        ArrayList<Course> courses =new ArrayList<>();
        for (AddcoursePage addcoursePage:addcoursePages)
        {
            Course course=new Course();
            TeacherPage teacherPage = teacherDAO.GetById(addcoursePage.getTeacherid());

            course.setCoursename(addcoursePage.getCourse());
            course.setTeacherid(teacherPage.getId());
            course.setTname(teacherPage.getName());
            course.setTusername(teacherPage.getUsername());

            course.setResult(addcoursePage.getResult());
            course.setAddcouid(addcoursePage.getId());
            course.setPrecourse1(addcoursePage.getPrecourseid1());
            course.setPrecourse2(addcoursePage.getPrecourseid2());
            course.setPrecourse3(addcoursePage.getPrecourseid3());
            course.setPrecourse4(addcoursePage.getPrecourseid4());


            courses.add(course);

        }
        return courses;

    }
    public boolean updateTeaCou(String result,Course c){
        String sql="update learningweb.addcourse set result=? where id=?";
        try (
                Connection conn=dataSource.getConnection();
                PreparedStatement pstmt=conn.prepareStatement(sql)){
            pstmt.setString(1, result);
            pstmt.setString(2, c.getAddcouid());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }

    }
    public boolean findExistCourse(String cname,String tid){

//        String sql="SELECT * FROM learningweb.course where name=? and teacherid=?;";
//        try (
//                Connection conn=dataSource.getConnection();
//                PreparedStatement pstmt=conn.prepareStatement(sql)){
//            pstmt.setString(1, cname);
//            pstmt.setString(2, tid);
//            ResultSet rst=pstmt.executeQuery();
//            boolean valid=rst.next();
//            if(valid){
//                return false;
//            }else {
//                return true;
//            }
//
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//            return false;
//        }
      boolean flag=false;
        CourseDAO courseDAO = new CourseDAO();
        List<CoursePage> courses =courseDAO.GetAllByColumn("teacherid",tid);
        if (courses == null || courses.size() == 0)
            flag =false;
        else
        {
            for ( CoursePage item:courses)
            {
                if (cname.equals(item.getName()))
                {
                    flag = true;
                    break;
                }
                flag = false;
            }
        }
        return flag;

    }
    public boolean addCourse(CoursePage c){

//        String sql="INSERT INTO learningweb.course (id,name,teacherid,kind)VALUES(?,?,?,?);";
//        try (
//                Connection conn=dataSource.getConnection();
//                PreparedStatement pstmt=conn.prepareStatement(sql)){
//            pstmt.setString(1,c.getId());
//            pstmt.setString(2,c.getName());
//            pstmt.setString(3, c.getTeacherid());
//            pstmt.setString(4, c.getKind());
//            pstmt.executeUpdate();
//            return true;
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//            return false;
//        }
        boolean flag = false;
        CourseDAO courseDAO =new CourseDAO();
        flag=courseDAO.Add(c);
        return flag;
    }
    public boolean JudgeAdmin(String no,String pswd){

        String sql="SELECT * FROM learningweb.administrator where username=? and password=?;";
        try (
                Connection conn=dataSource.getConnection();
                PreparedStatement pstmt=conn.prepareStatement(sql)){
            pstmt.setString(1,no);
            pstmt.setString(2,pswd);
            ResultSet rst=pstmt.executeQuery();

            boolean valid=rst.next();
            return valid;


        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean updateCourse(Course c,String cno) {
       AddcourseDAO addcourseDAO=new AddcourseDAO();
       AddcoursePage addcoursePage =addcourseDAO.GetById(c.getAddcouid());
       addcoursePage.setResult(cno);
       boolean flag =addcourseDAO.Update(addcoursePage);
       return flag;
    }
    public boolean deleteCourse(String cno){
        String sql="DELETE FROM learningweb.course WHERE id=?;";

        try (
                Connection conn = dataSource.getConnection();
                PreparedStatement pstmt=conn.prepareStatement(sql)){
            pstmt.setString(1,cno);
            int i=pstmt.executeUpdate();
            if(i!=0){
                return true;
            }else{
                return false;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
    }
    public String findmaxid(){

        String maxid = null;
        String sql="SELECT max(id+0) as maxid FROM learningweb.relation ORDER BY CAST(`id` AS DECIMAL);" ;

        try (
                Connection conn=dataSource.getConnection();
                PreparedStatement pstmt=conn.prepareStatement(sql)){
            ResultSet rst=pstmt.executeQuery();
            if(rst.next()){
                maxid=rst.getString("maxid");

            }
            return maxid;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }
    public boolean addprecourseid(String cid,String preid,String id) {
        boolean flag = false;
        RelationDAO relationDAO =new RelationDAO();
        RelationPage relationPage = new RelationPage();
        relationPage.setCourseid(cid);
        relationPage.setFrontcourseid(preid);
        flag=relationDAO.Add(relationPage);
        return flag;

    }
}
