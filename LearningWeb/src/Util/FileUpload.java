package Util;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

public class FileUpload {
    private String path; //系统的存储路径,相当于web的路径 eg: data/PDF   ;
    private HttpServletRequest request;//request 请求
    private String rpath;   //网站的相对目录
    private String rfile;
    private DiskFileItemFactory factory;
    private ServletFileUpload upload;
    private List<FileItem> items;
    private HashMap hashMap;   //利用map在进行存储，是的在实现的方法上和request.getparameter()相似

    public FileUpload(String path, HttpServletRequest request, String rfile) {
        this.path = GetFilePath.getFilePath(path);
        this.request = request;
        this.rfile = "/" + rfile;
    }

    public String getPath() {
        return path;
    }


    public void setPath(String path) {
        this.path = path;
    }


    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public String getRpath() {
        return rpath;
    }

    public void setRpath(String rpath) {
        this.rpath = rpath;
    }

    public void setRpath(String spath, String filename) {

        this.rpath = spath + "/" + filename;
    }


    public ServletFileUpload getUpload() {
        return upload;
    }

    public void setUpload(ServletFileUpload upload) {
        this.upload = upload;
    }

    public List<FileItem> getItems() {
        return items;
    }

    public void setItems(List<FileItem> items) {
        this.items = items;
    }

    public HashMap getHashMap() {
        return hashMap;
    }


    public void upload() {

        factory = new DiskFileItemFactory();
        upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");
        factory.setSizeThreshold(1024 * 1024 * 100);
//        File linshi = new File("C:\\Programming\\JavaWeb\\LearningWorking\\web\\data");
        upload.setSizeMax(1024 * 1024 * 1024);
        hashMap = new HashMap();

        try {
            items = upload.parseRequest(request);
            for (FileItem item : items) {
                // 若是一个一般的表单域, 打印信息
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = null;
                    try {
                        value = item.getString("utf-8");
                        hashMap.put(name, value);
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }

//                    System.out.print(name + ": " + value);
                } else {
                    String uuid = UUID.randomUUID().toString().replace("-", "");//设置uuid统一标识符
                    String fileName = item.getName();
                   //设置uuid路径名称，文件上传重名问题解决
                    String tem1[] = fileName.split("\\.");
                    String tem ="";
                    int i=0;
                    for (i=0;i<tem1.length-1;i++)
                    {
                        tem+=tem1[i];
                    }
                    tem+="_"+uuid+"."+tem1[i];
                    fileName = tem;

                    //long sizeInBytes = item.getSize();
                    //System.out.println(fileName);
                    // System.out.println(sizeInBytes);

                    InputStream in = null;
                    try {
                        in = item.getInputStream();
                        byte[] buffer = new byte[1024 * 1024];
                        int len = 0;
                        setRpath(rfile, fileName);//设置相对路径
                        fileName = path + "/" + fileName;//文件最终上传的位置

//                        System.out.println(fileName);
                        OutputStream out = new FileOutputStream(fileName);

                        while ((len = in.read(buffer)) != -1) {
                            out.write(buffer, 0, len);
                        }

                        out.close();
                        in.close();

                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                }

            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }


    }


}
