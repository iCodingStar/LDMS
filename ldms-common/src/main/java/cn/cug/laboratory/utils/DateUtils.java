package cn.cug.laboratory.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Created by HXY on 2016/5/29.
 */
public class DateUtils {
    public static void main(String[] args) throws ParseException {
        String strd = "Mon Dec 31 00:00:00 CST 2012";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date date = df.parse(format(strd));
        System.out.println(date);

        java.sql.Date datet=new java.sql.Date((df.parse(format(strd))).getTime());
        Date d=datet;
        System.out.println(d.toString());
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
