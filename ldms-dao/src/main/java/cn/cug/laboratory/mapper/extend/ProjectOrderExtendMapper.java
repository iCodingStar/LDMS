package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.ProjectOrderMapper;
import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.extend.ProjectOrderExtend;
import cn.cug.laboratory.model.persistent.ProjectOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectOrderExtendMapper extends ProjectOrderMapper{
    /**
     * 通过学生ID和实验ID获取实验记录的ID
     * @author：PP
     * @return
     */
    String selectProOrderIDByMultiInfo(@Param("stuId") String stuId,@Param("proId") String proId);


    /**
     * @author: PP
     * @function:查询已预约的项目成绩信息
     */
    List<ProjectOrderExtend> pp_selectOrderScore(@Param("startPosition") Integer startPosition,
                                            @Param("offset") Integer offset,
                                            @Param("pe") ProjectOrderExtend projectOrderExtend);

    /**
     * @author: PP
     * @function:查询已预约的项目信息条数
     * @since : 1.0.0
     */
    Integer pp_selectOrderScoreCounts(ProjectOrderExtend projectOrderExtend);

    /**
     * @author: PP
     * @function:查询已预约的项目记录信息
     */
    List<ProjectOrderExtend> pp_selectOrderRecord(@Param("startPosition") Integer startPosition,
                                                 @Param("offset") Integer offset,
                                                 @Param("pe") ProjectOrderExtend projectOrderExtend);

    /**
     * @author: PP
     * @function:查询已预约的项目记录信息条数
     * @since : 1.0.0
     */
    Integer pp_selectOrderRecordCounts(ProjectOrderExtend projectOrderExtend);



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