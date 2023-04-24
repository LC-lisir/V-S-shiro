package com.example.sys.controller;

import com.example.common.vo.Result;
import com.example.sys.entity.SessionList;
import com.example.sys.entity.User;
import com.example.sys.mapper.SeesionListMapper;
import com.example.sys.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class SessionController {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private SeesionListMapper seesionListMapper;

    /**
     * 已建立会话
     */
    @GetMapping("/sessionList/already")
    public Result<?> sessionListAlready(@RequestParam Integer id){
        List<SessionList> sessionLists = seesionListMapper.selectByUserId(id);
        return  Result.success(sessionLists);
    }

    // 可建立会话的用户
    @GetMapping("/sessionList/not")
    public Result<?> sessionListNot(@RequestParam Integer id){
        List<Integer> list = seesionListMapper.selectUserIdByUserId(id);
        list.add(id);
        List<User> cloudList = userMapper.getCloudList(list);
        return Result.success(cloudList);
    }

    // 创建会话
    @GetMapping("/createSession")
    public Result<?> createSession(@RequestParam Integer id,@RequestParam Integer toUserId,@RequestParam String toUserName){
        SessionList sessionList = new SessionList();
        sessionList.setUserId(id);
        sessionList.setUnReadCount(0);
        sessionList.setListName(toUserName);
        sessionList.setToUserId(toUserId);
        seesionListMapper.insert(sessionList);
        // 判断对方和我建立会话没有？ 没有也要建立
        Integer integer = seesionListMapper.selectIdByUser(toUserId, id);
        if (integer == null || integer <= 0){
            User user = userMapper.selectByPrimaryKey(id);
            sessionList.setUserId(toUserId);
            sessionList.setToUserId(id);
            sessionList.setListName(user.getUsername());
            seesionListMapper.insert(sessionList);
        }
        return Result.success();
    }

    // 删除会话
    @GetMapping("/delSession")
    public Result<?> delSession(@RequestParam Integer sessionId){
        seesionListMapper.deleteByPrimaryKey(sessionId);
        return Result.success();
    }

}
