package com.example.sys.controller;

import com.example.common.vo.Result;
import com.example.sys.entity.User;
import com.example.sys.service.impl.UserServiceImpl;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Duration;
import java.util.HashMap;
import java.util.UUID;
@RestController
@RequestMapping("/sys")
public class LoginController {
    @Autowired
    UserServiceImpl userService;
    @Autowired
    private RedisTemplate redisTemplate;
    @PostMapping("/login")
    public Result ajaxLogin(@RequestBody User sysUser) {
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(sysUser.getUsername(), sysUser.getPassword());
        try {
            subject.login(token);
            // 将用户token和角色存入redis并设置redis有效期为30分钟
            User user = userService.findByUsername(token.getUsername());
            String key ="user:"+ UUID.randomUUID();
            HashMap<String,Object> data = new HashMap<>();
            data.put("token",key);
            redisTemplate.opsForValue().set(key, user, Duration.ofMinutes(60L));
            if (data != null) {
                return Result.success(data);
            }
        } catch (IncorrectCredentialsException e) {
            return Result.fail(20002,"密码错误!");
        } catch (LockedAccountException e) {
            return Result.fail("登录失败，该用户已被冻结!");
        } catch (AuthenticationException e) {
            return Result.fail("该用户不存在!");
        } catch (Exception e) {
            System.out.println(("用户登录时发生异常！e={}"+ e));
            return Result.fail();
        }
        return null;
    }

}
