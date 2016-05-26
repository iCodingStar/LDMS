package cn.cug.laboratory.service;

import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.utils.RetuValueClass;

/**
 * Created by PP on 2016/5/22.
 */
public interface ProjectService {
    public Project selectByPrimaryKey(String id);

    /**
     * 通过教师Id选择相应的实验记录，
     * 分页显示
     * @param teaId
     * @param pageNo
     * @param pageNum
     * @return 记录列表，总的记录数
     */
    public RetuValueClass<Project> selectByTeaId(String teaId, int pageNo, int pageNum);

    /**
     *
     * @param name
     * @param pageNo
     * @param pageNum
     * @return
     */
    public RetuValueClass<Project> selectByName(String name, int pageNo, int pageNum);
}
