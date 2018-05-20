import DAO.CourseDAO;
import DAO.TeacherDAO;
import Entity.LearnEntity;
import Page.CoursePage;
import Page.TeacherPage;
import Util.GetFilePath;
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

        String uuid = UUID.randomUUID().toString().replace("-","");
        System.out.println(uuid);
    }
}