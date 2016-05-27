package cn.cug.laboratory.utils;

import java.util.List;

/**
 * Created by PP on 2016/5/25.
 * 模板包装类，返回一个List和Int类型
 */
public class RetuValueClass<E> {
    public List<E> retuList;
    int count;

    public RetuValueClass(){}
    public RetuValueClass(List<E> retuList, int count) {
        this.retuList = retuList;
        this.count = count;
    }

    public List<E> getRetuList() {
        return retuList;
    }

    public int getCount() {
        return count;
    }
}
