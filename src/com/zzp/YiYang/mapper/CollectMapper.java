package com.zzp.YiYang.mapper;

import com.zzp.YiYang.pojo.Collect;
import com.zzp.YiYang.pojo.Icon;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-03 16:51
 */
public interface CollectMapper {
    int insert(Collect collect);

    /**
     * 用于检验要插入的collect是否已存在
     * @param collect
     * @return
     */
    int isExistCollect(Collect collect);

    /**
     * 返回用户收藏的图标信息
     * @param userName
     * @param offset
     * @param num
     * @return
     */
    List<Icon> getCollectIcon(@Param("userName") String userName, @Param("offset") int offset, @Param("num") int num);

    /**
     * 获取用户收藏图标的数量
     * @param userName
     * @return
     */
    int getCollectNum(String userName);

    /**
     * 获取收藏量最多的图标
     * @param offset
     * @param num
     * @return
     */
    List<Icon> getCollectMaxIcon(@Param("offset") int offset, @Param("num") int num);
}
