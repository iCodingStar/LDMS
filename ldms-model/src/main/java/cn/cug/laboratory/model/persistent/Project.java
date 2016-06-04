package cn.cug.laboratory.model.persistent;

import lombok.Data;

import java.util.Date;

@Data
public class Project {
    private String id;//项目编号

    private String labId;//实验编号

    private String teaId;//教师编号

    private String name;//项目名称

    private Date startTime;//项目开始时间

    private Date endTime;//项目结束时间

    private Integer capacity;

    private Integer leftCapacity;

    private Integer state=0;//项目状态

    private Float credit;

    private Date submitTime;//项目提交时间

    private Date passTime;//项目通过时间

    private String devices;//设备名称

    private String files;//项目文件名称

    private String description;//项目描述

}