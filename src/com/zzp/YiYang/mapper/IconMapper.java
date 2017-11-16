package com.zzp.YiYang.mapper;

import com.zzp.YiYang.DTO.AddIconDTO;
import com.zzp.YiYang.DTO.GetIconDTO;
import com.zzp.YiYang.pojo.Icon;
import com.zzp.YiYang.pojo.IconProperty;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ho
 * @create 2017-09-30 16:37
 */
public interface IconMapper {


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

    int addIcon(Icon icon);

    int addType(@Param("iconId") int iconId, @Param("proId") int proId);

    /**
     * 移除指定ICON的property
     * @param iconId
     * @param proId
     * @return
     */
    int removeType(@Param("iconId") int iconId, @Param("proId") int proId);

    List<GetIconDTO> getIcons();

    int deleteIcon(int iconId);

    int updateIcon(AddIconDTO addIconDTO);

    /**
     * 通过iconId获取所有此Id选中的属性Id
     * @param iconId
     * @return
     */
    List<Integer> getIconPropertyByIcon(int iconId);

    /**
     * 获取Icon的总数量
     * @return
     */
    int getIconNum();

    /**
     * 获取ICON图片地址
     * @param id
     * @return
     */
    String getImgAddress(int id);
}
