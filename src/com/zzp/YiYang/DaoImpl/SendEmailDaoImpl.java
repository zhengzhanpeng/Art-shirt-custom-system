package com.zzp.YiYang.DaoImpl;

import com.zzp.YiYang.Dao.SendEmailDao;
import com.zzp.YiYang.mapper.UserMapper;
import com.zzp.YiYang.util.EmailHelper;

import javax.annotation.Resource;
import java.util.List;
import java.util.concurrent.ExecutorService;

/**
 * @author ho
 * @create 2017-12-10 17:03
 */
public class SendEmailDaoImpl implements SendEmailDao {
    private UserMapper userMapper;
    private ExecutorService executorService;

    @Resource
    public void setExecutorService(ExecutorService executorService) {
        this.executorService = executorService;
    }

    @Resource
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public String sendEmail(String content, String object) {
        List<String> list = userMapper.getMails();
        executorService.execute(() -> {  //快速响应
            for (String e : list) {
                executorService.execute(() -> {
                    EmailHelper.sendEmail(e, object, content);
                });
            }
        });
        return "1";
    }
}
