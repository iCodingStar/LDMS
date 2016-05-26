package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.ProjectOrderMapper;
import cn.cug.laboratory.model.persistent.ProjectOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectOrderExtendMapper extends ProjectOrderMapper{
    /**
     *
     * @return
     * 返回最后插入的已预约的实验ID
     */
    String selectLastId();

    /**
     *
     * @param stuId
     * @param startSite
     * @param pageNum
     * @return
     * 根据学生id和分页条件返回已预约的实验
     */
    List<ProjectOrder> selectByStuId(@Param("stuId") String stuId, @Param("startSite") int startSite, @Param("pageNum") int pageNum);

    /**
     *
     * @param stuId
     * @return
     * 查询某个学生预约过的实验
     */
    int selectCountByStuId(@Param("stuId") String stuId);
}