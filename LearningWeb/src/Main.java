import DAO.TeacherDAO;
import Entity.LearnEntity;
import Page.TeacherPage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.Random;
import java.util.UUID;


/**
 * Created by ycbhci on 2017/6/26.
 */
public class Main {


    public static void main(final String[] args) throws Exception {

        TeacherDAO teacherDAO =new TeacherDAO();
        TeacherPage teacherPage = teacherDAO.GetById("1");
        System.out.println(teacherPage.getName());
        teacherPage.setName("王子健");
        teacherDAO.Update(teacherPage);


    }
}