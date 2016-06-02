package cn.cug.laboratory.model.persistent;

public class Student {
    private String id;

    private String name;

    private String major;

    private Integer classId;

    private String academy;

    private String sex;

    public Student(){}
    public Student(String id, String name, String major, Integer classId, String academy, String sex) {
        this.id = id;
        this.name = name;
        this.major = major;
        this.classId = classId;
        this.academy = academy;
        this.sex = sex;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getAcademy() {
        return academy;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", major='" + major + '\'' +
                ", classId=" + classId +
                ", academy='" + academy + '\'' +
                ", sex='" + sex + '\'' +
                '}';
    }

    public void setAcademy(String academy) {
        this.academy = academy == null ? null : academy.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }


}