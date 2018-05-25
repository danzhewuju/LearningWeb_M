import DAO.*;
import Entity.LearnEntity;
import Page.ChatPage;
import Page.CoursePage;
import Page.RelationPage;
import Page.TeacherPage;
import Util.GetFilePath;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.UUID;


/**
 * Created by ycbhci on 2017/6/26.
 */
public class Main {


    public static void main(final String[] args) throws Exception {

//        String uuid = UUID.randomUUID().toString().replace("-", "");
//        System.out.println(uuid);
//

        ChatDao chatDao = new ChatDao();
        ArrayList<ChatPage> chatPages = (ArrayList<ChatPage>) chatDao.GetAll();
System.out.println(chatPages.size());

    }
}