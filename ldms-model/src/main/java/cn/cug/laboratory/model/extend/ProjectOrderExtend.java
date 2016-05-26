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

}