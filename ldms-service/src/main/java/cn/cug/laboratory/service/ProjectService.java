package cn.cug.laboratory.service;

import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.utils.RetuValueClass;

import java.util.List;

/**
 * Created by PP on 2016/5/22.
 */
public interface ProjectService {

    /**
     * 通过教师Id选择相应的实验记录，
     * 分页显示
     *
     * @param teaId
     * @param pageNo
     * @param pageNum
     * @return 记录列表，总的记录数
     */
    public RetuValueClass<ProjectExtend> selectByTeaId(String teaId, int pageNo, int pageNum);

    /**
     * @param name
     * @param pageNo
     * @param pageNum
     * @return
     */
    public RetuValueClass<ProjectExtend> selectByName(String name, int pageNo, int pageNum);

    /**
     * @author: shixing
     * @since : 1.0.0
     */
    public List<ProjectExtend> selectByMultipleInfo(ProjectExtend projectExtend);
}
