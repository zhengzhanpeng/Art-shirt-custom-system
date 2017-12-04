package com.zzp.YiYang.mapper;

import com.zzp.YiYang.pojo.SendAddress;
import org.apache.ibatis.annotations.Param;

/**
 * @author ho
 * @create 2017-10-02 10:48
 */
public interface SendAddressMapper {
    int insert(SendAddress sendAddress);
    int delete(@Param("id") int id, @Param("userName") String userName);
}
