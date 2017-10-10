package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.AddIconDTO;
import com.zzp.YiYang.DTO.GetIconDTO;
import com.zzp.YiYang.Dao.IconManageDao;
import com.zzp.YiYang.mapper.IconMapper;
import com.zzp.YiYang.mapper.RecommendIconMapper;
import com.zzp.YiYang.pojo.Icon;
import com.zzp.YiYang.pojo.IconProperty;
import com.zzp.YiYang.util.MainUtil;
import com.zzp.YiYang.util.MessageUtil;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-10-08 15:38
 */
public class IconManageDaoImpl implements IconManageDao {
    private IconMapper iconMapper;
    private RecommendIconMapper recommendIconMapper;

    @Resource
    public void setRecommendIconMapper(RecommendIconMapper recommendIconMapper) {
        this.recommendIconMapper = recommendIconMapper;
    }

    @Resource
    public void setIconMapper(IconMapper iconMapper) {
        this.iconMapper = iconMapper;
    }

    @Override
    public String getIcons() {
        List<GetIconDTO> list = iconMapper.getIcons();
        String result = MainUtil.getJsonToTable(list);
        return result;
    }

    @Override
    public String addIcon(AddIconDTO addIconDTO) {
        Icon icon = new Icon();
        icon.setName(addIconDTO.getName());
        icon.setDesc1(addIconDTO.getDesc1());
        icon.setImgAddress(addIconDTO.getImgAddress());
        int result = iconMapper.addIcon(icon);
        if (result == 0 || icon.getId() == 0) {
            return MessageUtil.SYSTEM_ERROR;
        }
        if (addIconDTO.getReco()) {
            recommendIconMapper.addReco(icon.getId());
        }
        int[] arr = addIconDTO.getTypes();
        for(int i = 0; i < arr.length; i++) {
            iconMapper.addType(icon.getId(), arr[i]);
        }
        return "1";
    }

    @Override
    public List<IconProperty> getIconPros() {
        return iconMapper.getIconPros();
    }
}
