package com.zzp.YiYang.Dao;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * 用于管理用户的基本操作
 *
 * @author ho
 * @create 2017-09-27 9:29
 */
public interface OperationDao {
    String addToCar(int goodsId, String imgAddress);

    boolean uploadImg(CommonsMultipartFile file);

    /**
     * 自定义的商品添加购物车方式。
     * @param goodsId
     * @param file
     * @return
     */
    String addNewToCar(int goodsId, CommonsMultipartFile file);

    /**
     * 每收藏一个收藏数+1；需判断是否存在num属性
     * @param iconId
     * @return
     */
    String AddToCollect(int iconId);
}
