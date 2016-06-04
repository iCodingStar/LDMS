package cn.cug.laboratory.model.persistent;

import lombok.Data;

@Data
public class Lab {
    private String id;//实验编号

    private String name;//实验名称

    private Integer size;//实验容量

    private String openWay;//实验开放方式

    private String manager;

    private String useWay;
}