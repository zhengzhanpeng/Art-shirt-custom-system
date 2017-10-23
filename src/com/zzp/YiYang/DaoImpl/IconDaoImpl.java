package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.IconDTO;
import com.zzp.YiYang.Dao.IconDao;
import com.zzp.YiYang.mapper.IconMapper;
import com.zzp.YiYang.pojo.Icon;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-10-04 18:58
 */
public class IconDaoImpl implements IconDao {
    private IconMapper iconMapper;

    @Resource
    public void setIconMapper(IconMapper iconMapper) {
        this.iconMapper = iconMapper;
    }

    @Override
    public List<IconDTO> getIcon() {
        return null;
    }

    @Override
    public List<Icon> getRecommendIcon(int page, int num) {
        List<Icon> list = iconMapper.getRecommendIcon();
        return list;
    }

    @Override
    public List<Icon> getCollectIcon(int page, int num) {
        return null;
    }

    @Override
    public List<Icon> getCollectMaxIcon(int page, int num) {
        return null;
    }

    @Override
    public int getCollectNum() {
        return 0;
    }

    @Override
    public int getRecommendNum() {
        return 0;
    }
}
