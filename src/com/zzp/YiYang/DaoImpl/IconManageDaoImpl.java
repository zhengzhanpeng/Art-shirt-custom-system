package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.Dao.IconManageDao;
import com.zzp.YiYang.mapper.IconMapper;
import com.zzp.YiYang.pojo.IconProperty;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-10-08 15:38
 */
public class IconManageDaoImpl implements IconManageDao {
    private IconMapper iconMapper;

    @Resource
    public void setIconMapper(IconMapper iconMapper) {
        this.iconMapper = iconMapper;
    }

    @Override
    public String addIconPro(String value) {

        return null;
    }

    @Override
    public List<IconProperty> getIconPro() {
        return iconMapper.getIconPros();
    }
}
