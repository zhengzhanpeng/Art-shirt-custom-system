package com.zzp.YiYang.Dao;

import com.zzp.YiYang.DTO.IconDTO;
import com.zzp.YiYang.pojo.Icon;

import java.util.List;

/**
 * @author ho
 * @create 2017-09-27 16:27
 */
public interface IconDao {
    /**
     * 图标界面一次性获取所有图标信息
     * @return
     */
    List<IconDTO> getIcon();

   /**
     * 若需获取全部则可设置page = 0；num 任意
     * @param page 页数
     * @param num 每页包含数目
     * @return
     */
    List<Icon> getRecommendIcon(int page, int num);

    /**
     * 同上
     * @param page
     * @param num
     * @return
     */
    List<Icon> getCollectIcon(int page, int num);

    /**
     * 通过收藏数倒序排序分页
     * @param page
     * @param num
     * @return
     */
    List<Icon> getCollectMaxIcon(int page, int num);

    int getCollectNum();

    int getRecommendNum();

}
