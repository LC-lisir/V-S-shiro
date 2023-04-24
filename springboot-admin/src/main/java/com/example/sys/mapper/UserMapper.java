package com.example.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.sys.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author lisir
 * @since 2023-03-03
 */
@Repository
public interface UserMapper extends BaseMapper<User> {
     List<String> getRoleNameByUserId(Integer userId);

    List<User> getCloudList(List<Integer> list);

    User selectByPrimaryKey(Integer id);
}
