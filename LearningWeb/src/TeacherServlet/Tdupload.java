package TeacherServlet;

import DAO.ChapterDAO;
import DAO.DataDAO;
import DAO.ExamDAO;
import Page.ChapterPage;
import Page.DataPage;
import Page.ExamPage;
import Util.FileUpload;
import Util.GetFilePath;
import Util.Message;

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
import java.util.List;

/**
 * Created by zyl on 2017/7/2.
 */
@WebServlet(name = "Tdupload",value = "/Tdupload")
public class Tdupload extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /* 完成文件的写入*/
        String path ="data";
        FileUpload fileUpload =new FileUpload("data",request,"data");
        fileUpload.upload();

//        文件存入数据库
       DataDAO dataDAO=new DataDAO();
       DataPage dataPage=new DataPage();

        String chapterid = fileUpload.getHashMap().get("chapterid").toString();
        String kind =fileUpload.getHashMap().get("kind").toString();
        String name = fileUpload.getHashMap().get("dname").toString();
        String address = fileUpload.getRpath();

        dataPage.setChapterid(chapterid);
        dataPage.setAddress(address);
        dataPage.setKind(kind);
        dataPage.setName(name);

        boolean success =dataDAO.Add(dataPage);
        if (success)
        {
            Message.alermessage(response,"资料上传成功!","teacher/T-uploadpage2.jsp");
        }
        else
        {
            Message.alermessage(response,"资料上传失败！","teacher/T-uploadpage2.jsp");
        }



/*   重构相关代码*/
//        Part part=request.getPart("myfile");
//        String path1;
//
//        String path=GetFilePath.getFilePath("data");
//        File f=new File(path);
//        if(!f.exists()){
//            f.mkdirs();
//        }
//        if(request.getParameter("kind").equals("PPT"))
//        {
//            path=path+"\\"+request.getParameter("dname")+".pptx";
//            path1="../teacher/T-resource/video/"+request.getParameter("dname")+".html";
//        }
//        else if(request.getParameter("kind").equals("视频"))
//        {
//            path=path+"\\"+request.getParameter("dname")+".mp4";
//            path1="../teacher/T-resource/video/"+request.getParameter("dname")+".mp4";
//        }
//        else{
//            path="#";
//            path1="#";
//        }
//        part.write(path);
//        ServletContext con=this.getServletContext();
//        DataPage dp=new DataPage();
//        String cid=(String)request.getSession().getAttribute("cid");
//        String chapterid=request.getParameter("chapterid");
//        request.getSession().setAttribute("cid", cid);
//        dp.setAddress(path1);
//        dp.setKind(request.getParameter("kind"));
//        dp.setName(request.getParameter("dname"));
//        dp.setChapterid(chapterid);
//        DataDAO dd=new DataDAO();
//
//        if(dd.GetByColumn("chapterid",chapterid)==null){
//        dd.Add(dp);}
//        else{
//            dd.Update(dp);
//        }

        response.sendRedirect("/Tbfupload");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          doPost(request,response);
    }
}
