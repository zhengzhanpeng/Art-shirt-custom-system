package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.Dao.IconPropertyDao;
import com.zzp.YiYang.mapper.IconMapper;
import com.zzp.YiYang.pojo.IconProperty;
import com.zzp.YiYang.util.MainUtil;
import com.zzp.YiYang.util.MessageUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-10-08 16:32
 */
@Service
public class IconPropertyDaoImpl implements IconPropertyDao {
    private IconMapper iconMapper;

    @Resource
    public void setIconMapper(IconMapper iconMapper) {
        this.iconMapper = iconMapper;
    }

    @Override
    public String getIconPros() {
        List list = iconMapper.getIconPros();
        String result = MainUtil.getJsonToTable(list);
        System.out.println("result: " + result);
        return result;
    }

    @Override
    public String deleteIconPro(int iconProId) {
        if (iconProId == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
        iconMapper.deleteIconPro(iconProId);
        return "1";
    }

    @Override
    @Transactional
    public String saveIconPro(IconProperty iconProperty) {
        int result = 0;
        if (iconProperty.getId() == 0) {
            iconMapper.addPro(iconProperty);
        } else {
            iconMapper.setIconPro(iconProperty);
        }
        result = iconProperty.getId();
        return "1-" + result;
    }
}
