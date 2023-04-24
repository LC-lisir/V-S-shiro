package com.example.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.sys.entity.SessionList;
import com.example.sys.service.ISessionListService;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Map;
import java.util.function.Function;

/**
 * <p>
 * 会话列表 服务实现类
 * </p>
 *
 * @author lisir
 * @since 2023-04-15
 */
@Service
public class SessionListServiceImpl  implements ISessionListService {

    @Override
    public boolean saveBatch(Collection<SessionList> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<SessionList> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<SessionList> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(SessionList entity) {
        return false;
    }

    @Override
    public SessionList getOne(Wrapper<SessionList> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<SessionList> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<SessionList> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public BaseMapper<SessionList> getBaseMapper() {
        return null;
    }

    @Override
    public Class<SessionList> getEntityClass() {
        return null;
    }
}
