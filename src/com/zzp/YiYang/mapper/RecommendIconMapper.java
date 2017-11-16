package com.zzp.YiYang.mapper;

import com.zzp.YiYang.pojo.Icon;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-09 21:15
 */
public interface RecommendIconMapper {
    int addReco(int iconId);

    int deleteReco(int iconId);

    Integer getReco(int iconId);

    /**
     * 获取所有推荐的图标信息
     * @return
     */
    List<Icon> getRecommendIcon(@Param("offset") int offset, @Param("num") int num);

    int getRecommendNum();
}
