package cn.cug.laboratory.model.extend;

import cn.cug.laboratory.model.persistent.Student;

public class StudentExtend extends Student {

    private String score;

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public StudentExtend(){}
    public StudentExtend(String id, String name, String major, Integer classId, String academy, String sex) {
        setId(id);
        setName(name);
        setMajor(major);
        setClassId(classId);
        setAcademy(academy);
        setSex(sex);
    }
}