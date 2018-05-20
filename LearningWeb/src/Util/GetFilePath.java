package Util;

public class GetFilePath {
    /*
    * 获取服务器的某个文件夹得绝对目录，这个文件夹一般是资源文件夹
    * 这个会找到系统的web文件夹，然后通过字符串拼接的方式+rpath从而得到系统资源的绝对文件夹
    * */

    public static String getFilePath(String rpath)
    {
        String path = GetFilePath.class.getResource("").toString();

        if (path != null)
        {
            path = path.substring(5, path.indexOf("WEB-INF") + 8);//如果是windwos将5变成6
            //System.out.println("current path :" + path);
        }
        String path1[]=path.split("WEB-INF");
        String repath = path1[0]+rpath;
        return repath;
    }
}
