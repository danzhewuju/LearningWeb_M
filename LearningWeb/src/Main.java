import DAO.ProgressDAO;
import Page.ProgressPage;

import java.util.UUID;


/**
 * Created by ycbhci on 2017/6/26.
 */
public class Main {


    public static void main(final String[] args) throws Exception {

      /* String uuid = UUID.randomUUID().toString().replace("-", "");
       System.out.println(uuid);
       String str= "个人简历.pdf";
       String tem []= str.split("\\.");
       String tem1="";
       int i;
       for ( i=0;i<tem.length-1;i++)
       {
           tem1+=tem[i];

       }
       tem1+="_"+uuid+"."+tem[tem.length-1];
       System.out.println(tem1);*/

//

        /*ChatDao chatDao = new ChatDao();
        ArrayList<ChatPage> chatPages = (ArrayList<ChatPage>) chatDao.GetAllByColumn("student", "1");
        System.out.println(chatPages.size());*/
        /*Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
        String time=dateFormat.format(date);
        System.out.println(time);*/

        String uuid = UUID.randomUUID().toString().replace("-", "");
        System.out.println(uuid);
        ProgressDAO progressDAO = new ProgressDAO();
        ProgressPage progressPage = new ProgressPage();
//        progressPage.setId(uuid);
        progressPage.setStudentid("1");
        progressPage.setCourseid("1");
        progressPage.setChapterid("2");
        progressPage.setExamscore("100");
        progressDAO.Add(progressPage);
    }
}