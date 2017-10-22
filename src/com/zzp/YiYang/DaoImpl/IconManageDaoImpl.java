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
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
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
    public synchronized String saveIcon(AddIconDTO saveIcon) {
        iconMapper.updateIcon(saveIcon);
        Integer iconId = recommendIconMapper.getReco(saveIcon.getId());
        if (iconId == null && saveIcon.getReco()) { //判断是否应该添加或删除reco
            recommendIconMapper.addReco(saveIcon.getId());
        } else if(iconId != null && !saveIcon.getReco()) {
            recommendIconMapper.deleteReco(iconId);
        }
        int info;
        int[] arr = saveIcon.getTypes();
        List<Integer> properties = iconMapper.getIconPropertyByIcon(saveIcon.getId());
        for(int i = 0; i < arr.length; i++) { //判断arr中是否包含properties中不存在的元素，并添加指定列
            if (!properties.contains(arr[i])) {
                iconMapper.addType(saveIcon.getId(), arr[i]);
            }
        }
        boolean result;
        for(int i = 0; i < properties.size(); i++) { //判断properties中是否包含arr中不存在的元素，并删除指定行
            result = false;
            for(int j = 0; j < arr.length; j++) {
                if (arr[j] == properties.get(i)) {
                    result = true;
                    break;
                }
            }
            if (!result) {
                iconMapper.removeType(saveIcon.getId(), properties.get(i));
            }
        }
        return "1";
    }

    @Override
    public String deleteIcon(int iconId) {
        int result = iconMapper.deleteIcon(iconId);
        if(result == 0)
            return MessageUtil.ICON_NOT_EXIST;
        return "1";
    }

    @Override
    public String getIcons() {
        List<GetIconDTO> list = iconMapper.getIcons();
        String typesStr;
        List<IconProperty> proList;
        IconProperty iconProperty;
        for (GetIconDTO g : list) {
            typesStr = "";
            proList = null;
            proList = g.getTypes();
            if (g.isReco()) {
                g.setRecoStr("是");
            } else {
                g.setRecoStr("否");
            }
            for(int i = 0; i < proList.size(); i++) {
                iconProperty = proList.get(i);
                if (i != 0) {
                    typesStr += "、";
                }
                typesStr += iconProperty.getName();
            }
            g.setTypesStr(typesStr);
        }
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
