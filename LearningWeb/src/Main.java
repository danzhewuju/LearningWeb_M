import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by ycbhci on 2017/6/26.
 */
public class Main {


    public static void main(final String[] args) throws Exception {

//        String uuid = UUID.randomUUID().toString().replace("-", "");
//        System.out.println(uuid);
//

        /*ChatDao chatDao = new ChatDao();
        ArrayList<ChatPage> chatPages = (ArrayList<ChatPage>) chatDao.GetAllByColumn("student", "1");
        System.out.println(chatPages.size());*/
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
        String time=dateFormat.format(date);
        System.out.println(time);

    }
}