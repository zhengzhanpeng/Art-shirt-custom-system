package com.zzp.YiYang.mapper;

import com.zzp.YiYang.pojo.Icon;
import com.zzp.YiYang.pojo.IconProperty;
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

    int addCollectNumber(@Param("iconId") int iconId, @Param("value") int value);

    int getCollectNumber(int iconId);

    List<IconProperty> getIconPros();

    int addPro(IconProperty iconProperty);

    int deleteIconPro(int iconProId);

    IconProperty getIconPro(int iconProId);

    int setIconPro(IconProperty iconProperty);
}
