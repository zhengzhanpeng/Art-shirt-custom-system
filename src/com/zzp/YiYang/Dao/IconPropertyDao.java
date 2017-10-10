package com.zzp.YiYang.Dao;

import com.zzp.YiYang.pojo.IconProperty;

/**
 * @author ho
 * @create 2017-10-08 16:24
 */
public interface IconPropertyDao {
    String getIconPros();

    String deleteIconPro(int iconProId);

    String saveIconPro(IconProperty iconProperty);
}
