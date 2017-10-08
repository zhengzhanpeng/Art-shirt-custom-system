package com.zzp.YiYang.Dao;

import com.zzp.YiYang.pojo.IconProperty;

import java.util.List;

/**
 * @author ho
 * @create 2017-10-08 16:24
 */
public interface IconPropertyDao {
    List<IconProperty> getIconPro();

    String deleteIconPro(int iconProId);

    String saveIconPro(IconProperty iconProperty);
}
