package com.zzp.YiYang.mapper;

import com.zzp.YiYang.pojo.Icon;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ho
 * @create 2017-09-30 16:37
 */
public interface IconMapper {
    List<Icon> getRecommendIcon();

    /**
     * 添加某图标的number属性
     * @param iconId
     * @param propertyId
     * @return
     */
    int insertCollectNumber(@Param("iconId") int iconId, @Param("propertyId") int propertyId);

    int getInfoId(@Param("iconId") int iconId, @Param("propertyId") int propertyId);

    int addCollectNumber(@Param("iconId") int iconId, @Param("propertyId") int propertyId,
                         @Param("value") String value,
                         @Param("newValue") String newValue);

    String getCollectNumber(@Param("iconId") int iconId, @Param("propertyId") int propertyId);
}
