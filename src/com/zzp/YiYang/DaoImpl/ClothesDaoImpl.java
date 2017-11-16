package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.DTO.BuyAtOnceDTO;
import com.zzp.YiYang.DTO.CartDTO;
import com.zzp.YiYang.DTO.ClothesDTO;
import com.zzp.YiYang.DTO.GetGoodsDTO;
import com.zzp.YiYang.Dao.ClothesDao;
import com.zzp.YiYang.mapper.ClothesMapper;
import com.zzp.YiYang.mapper.GoodsMapper;
import com.zzp.YiYang.pojo.Clothes;
import com.zzp.YiYang.pojo.Icon;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ho
 * @create 2017-10-23 15:02
 */
@Service
public class ClothesDaoImpl implements ClothesDao {
    private ClothesMapper clothesMapper;
    private GoodsMapper goodsMapper;

    @Resource
    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    @Resource
    public void setClothesMapper(ClothesMapper clothesMapper) {
        this.clothesMapper = clothesMapper;
    }

    @Override
    public List<GetGoodsDTO> getClothes() {
        List list = goodsMapper.getGoods();
        return list;
    }

    @Override
    public List<Icon> getCollect(int page, int num) {
        return null;
    }

    @Override
    public int getCollectNum() {
        return 0;
    }

    @Override
    public List<ClothesDTO> getRecommendClothes() {
        List<ClothesDTO> list = clothesMapper.getRecoClothes();
        return list;
    }

    @Override
    public String addNewToCart(CartDTO cartDTO, CommonsMultipartFile file) {
        return null;
    }

    @Override
    public String createOrderAndUploadImg(CommonsMultipartFile file, BuyAtOnceDTO buyAtOnceDTO) {
        return null;
    }
}
