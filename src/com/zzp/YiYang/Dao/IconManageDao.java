package com.zzp.YiYang.Dao;

import com.zzp.YiYang.pojo.IconProperty;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-06 16:42
 */
public interface IconManageDao {
    List<IconProperty> getIconPro();

    String addIconPro(String value);
}
