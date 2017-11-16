package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.IconDTO;
import com.zzp.YiYang.Dao.IconDao;
import com.zzp.YiYang.mapper.CollectMapper;
import com.zzp.YiYang.mapper.IconMapper;
import com.zzp.YiYang.mapper.RecommendIconMapper;
import com.zzp.YiYang.pojo.Icon;
import com.zzp.YiYang.util.MainUtil;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-10-04 18:58
 */
public class IconDaoImpl implements IconDao {
    private IconMapper iconMapper;
    private CollectMapper collectMapper;
    private RecommendIconMapper recommendIconMapper;

    @Resource
    public void setRecommendIconMapper(RecommendIconMapper recommendIconMapper) {
        this.recommendIconMapper = recommendIconMapper;
    }

    @Resource
    public void setCollectMapper(CollectMapper collectMapper) {
        this.collectMapper = collectMapper;
    }

    @Resource
    public void setIconMapper(IconMapper iconMapper) {
        this.iconMapper = iconMapper;
    }

    @Override
    public List<IconDTO> getIcon() {
        List list = iconMapper.getIcons();
        return list;
    }

    @Override
    public String getRecommendIcon(int page, int num) {
        List<Icon> list = recommendIconMapper.getRecommendIcon(page * num, num);
        int total = recommendIconMapper.getRecommendNum();
        return MainUtil.getJsonToPage(list, total);
    }

    @Override
    public String getCollectIcon(int page, int num) {

        String userName = MainUtil.getUserName();
        List<Icon> list = collectMapper.getCollectIcon(userName, page * num, num);
        int total = collectMapper.getCollectNum(userName);
        return MainUtil.getJsonToPage(list, total);
    }

    @Override
    public String getCollectMaxIcon(int page, int num) {
        List<Icon> list = collectMapper.getCollectMaxIcon(page * num, num);
        int total = iconMapper.getIconNum();
        String result = MainUtil.getJsonToPage(list, total);
        return result;
    }

    @Override
    public int getCollectNum() {
        String userName = MainUtil.getUserName();
        int num = collectMapper.getCollectNum(userName);
        return num;
    }

    @Override
    public int getRecommendNum() {
        return 0;
    }
}
