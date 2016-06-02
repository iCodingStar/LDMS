package cn.cug.laboratory.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Created by HXY on 2016/5/29.
 */
public class DateUtils {
    public static void main(String[] args) throws ParseException {
//        String path=System.getProperty("usr.dir");
//        File file1=new File(path);
//
//        if(!file1.exists())
//            file1.mkdir();
//
//        String filename="a.txt";
//
//        MultipartFile infile=new MultipartFile("E:\\testfile\\testfile.docx");
//        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(file1+filename)));
//        stream.write(infile.getBytes());
    }
    public static String format(String str){
        return String.format("%tF", parse(str, "EEE MMM dd HH:mm:ss zzz yyyy", Locale.US));
    }

    public static Date parse(String str, String pattern, Locale locale) {
        if(str == null || pattern == null) {
            return null;
        }
        try {
            return new SimpleDateFormat(pattern, locale).parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String format(Date date, String pattern, Locale locale) {
        if(date == null || pattern == null) {
            return null;
        }
        return new SimpleDateFormat(pattern, locale).format(date);
    }
}
