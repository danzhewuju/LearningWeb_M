package Util;

public class GetFilePath {

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
