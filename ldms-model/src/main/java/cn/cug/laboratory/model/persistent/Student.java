package cn.cug.laboratory.model.persistent;

import lombok.Data;

@Data
public class Student {
    private String id;

    private String name;

    private String major;

    private Integer classId;

    private String academy;

    private String sex;
}