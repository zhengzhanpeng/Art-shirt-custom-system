package com.zzp.YiYang.Dao;

import com.zzp.YiYang.DTO.AddIconDTO;
import com.zzp.YiYang.pojo.IconProperty;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-06 16:42
 */
public interface IconManageDao {
    List<IconProperty> getIconPros();

    String getIcons();

    String addIcon(AddIconDTO addIconDTO);
}
