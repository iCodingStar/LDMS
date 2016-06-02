package cn.cug.laboratory.model.extend;

import cn.cug.laboratory.model.persistent.ProjectOrder;

public class ProjectOrderExtend extends ProjectOrder {
    public ProjectOrderExtend(){}
    public ProjectOrderExtend(String id, String proId, String stuId, Float score) {
        setId(id);
        setProId(proId);
        setStuId(stuId);
        setScore(score);
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    private String teacherName;
    private String proName;
    private String startTime;

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getFiles() {
        return files;
    }

    public void setFiles(String files) {
        this.files = files;
    }

    private String endTime;
    private String files;


    @Override
    public String toString() {
        return "ProjectOrderExtend{" +
                "teacherName='" + teacherName + '\'' +
                ", proName='" + proName + '\'' +
                ",score='"+getScore() + '\'' +
                ",startTime"+getStartTime()+'\''+
                ",endTime"+getEndTime()+'\''+
                "files"+getFiles()+'\''+
                '}';
    }

}