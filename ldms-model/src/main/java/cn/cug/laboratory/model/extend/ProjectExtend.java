package cn.cug.laboratory.model.extend;

import cn.cug.laboratory.model.persistent.Project;

public class ProjectExtend extends Project {
    private String teacherName;
    private String labName;

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getLabName() {
        return labName;
    }

    public void setLabName(String labName) {
        this.labName = labName;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}