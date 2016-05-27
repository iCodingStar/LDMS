package cn.cug.laboratory.model.extend;

import cn.cug.laboratory.model.persistent.Project;

public class ProjectExtend extends Project {
    private Integer startSite = 0;
    private Integer pageNum = 5;
    private String teacherName;

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public Integer getStartSite() {
        return startSite;
    }

    public void setStartSite(Integer startSite) {
        this.startSite = startSite;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }
}