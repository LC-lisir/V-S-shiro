package com.example.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.sys.entity.MsgInfo;
import com.example.sys.service.IMsgInfoService;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Map;
import java.util.function.Function;

/**
 * <p>
 * 消息表 服务实现类
 * </p>
 *
 * @author lisir
 * @since 2023-04-15
 */
@Service
public class MsgInfoServiceImpl  implements IMsgInfoService {

    @Override
    public boolean saveBatch(Collection<MsgInfo> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<MsgInfo> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<MsgInfo> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(MsgInfo entity) {
        return false;
    }

    @Override
    public MsgInfo getOne(Wrapper<MsgInfo> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<MsgInfo> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<MsgInfo> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public BaseMapper<MsgInfo> getBaseMapper() {
        return null;
    }

    @Override
    public Class<MsgInfo> getEntityClass() {
        return null;
    }
}
