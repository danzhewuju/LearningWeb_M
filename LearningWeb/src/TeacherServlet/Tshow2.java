package TeacherServlet;

import DAO.ExamDAO;
import Page.ExamPage;
import Util.FileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

/**
 * Created by zyl on 2017/7/1.
 */
@WebServlet(name = "Tshow2",value ="/Tshow2")

public class Tshow2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  {







        String path="C:\\Programming\\JavaWeb\\LearningWeb\\LearningWeb\\web\\data\\examtest";//设置题目的存储路径
        FileUpload fileUpload=new FileUpload(path,request);
        fileUpload.upload();//文件的存储写入

        String chapterid=fileUpload.getHashMap().get("chapterid").toString();
        String answer=fileUpload.getHashMap().get("answer").toString();

        ExamPage examPage=new ExamPage();
        examPage.setChapterid(chapterid);
        examPage.setAddress(fileUpload.getRpath());
        examPage.setAnswer(answer);
        ExamDAO examDAO=new ExamDAO();
        examDAO.Add(examPage);//数据库的写入

//        Part part=request.getPart("myfile");
//        String path1;
//
//        String path="D:\\IJ存储\\Working (1)\\Working\\LearningWeb\\web\\T-resource\\pic";
//        File f=new File(path);
//        if(!f.exists()){
//            f.mkdirs();
//        }
//        path=path+"\\"+request.getParameter("chaptername")+".jpg";
//        path1="../T-resource/pic/"+request.getParameter("chaptername")+".jpg";
//        part.write(path);
//        ServletContext con=this.getServletContext();
//
//        ExamPage ep=new ExamPage();
//        ep.setAddress(path1);
//        ep.setAnswer(answer);
//        ep.setChapterid(chapterid);
//        ExamDAO ed=new ExamDAO();
//        if(ed.GetByColumn("chapter",chapterid)==null){
//            ed.Add(ep);
//        }else{
//            ed.Update(ep);
//        }

        try {
            response.sendRedirect("../Tshow");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("出现异常!!!");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)  {

    }
}
