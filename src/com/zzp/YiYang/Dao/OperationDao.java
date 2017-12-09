package com.zzp.YiYang.Dao;

import com.zzp.YiYang.DTO.CartDTO;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * 用于管理用户的基本操作
 *
 * @author ho
 * @create 2017-09-27 9:29
 */
public interface OperationDao {
    String addToCart(CartDTO cartDTO);

    /**
     * 若保存图片成功则返回图片地址，否则返回null；
     * @param file
     * @return
     */
    String uploadImg(CommonsMultipartFile file, String name);

    String getDir(String name);



    /**
     * 每收藏一个收藏数+1；需判断是否存在num属性
     * @param iconId
     * @return
     */
    String AddToCollect(int iconId);

    String addToCartFinished(int id);
}
