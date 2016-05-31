package cn.cug.laboratory.model.persistent;

public class ProjectOrder {
    @Override
    public String toString() {
        return "ProjectOrder{" +
                "id='" + id + '\'' +
                ", proId='" + proId + '\'' +
                ", stuId='" + stuId + '\'' +
                ", score=" + score +
                '}';
    }

    private String id;

    private String proId;

    private String stuId;

    private Float score;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId == null ? null : proId.trim();
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId == null ? null : stuId.trim();
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }
}