package cn.cug.laboratory.utils;

/**
 * Created by PP on 2016/5/20.
 * String加1工具类
 */
public class DBUtils {
    /**
     * 对以整数结尾的字符串进行+1,结尾的整数大小不能超过Long的数据范围(8个字节)
     * @param s1
     * @return
     */
    //"static" is necessary.
    public static String StringAddOne(String s1) {
        String[] strs = s1.split("[^0-9]");//根据不是数字的字符拆分字符串
        String numStr = strs[strs.length-1];//取出最后一组数字
        if(numStr != null && numStr.length()>0){//如果最后一组没有数字(也就是不以数字结尾)，抛NumberFormatException异常
            int n = numStr.length();//取出字符串的长度
            long num = Long.parseLong(numStr)+1;//将该数字加一
            String added = String.valueOf(num);
            n = Math.min(n, added.length());
            //拼接字符串
            return s1.subSequence(0, s1.length()-n)+added;
        }else{
            throw new NumberFormatException();
        }
    }

//    public static void main(String [] args){
//        System.out.println(StringAddOne("2013100"));
//    }

};

