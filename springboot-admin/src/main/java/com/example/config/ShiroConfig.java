package com.example.config;

import com.example.realm.UserRealm;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Hashtable;
import java.util.Map;

@Configuration
public class ShiroConfig {

    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier("securityManager") DefaultWebSecurityManager defaultWebSecurityManager) {
        ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
        shiroFilter.setSecurityManager(defaultWebSecurityManager);
        /*
            anon: 无需认证就可以访问
            authc: 必须认证了才能访问
            user: 必须拥有 记住我 功能才能使用
            perms: 拥有对某个资源的访问权限才能做
            role: 拥有对某个角色权限才能访问
        */
//        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();

        Map<String,String> map = new Hashtable<>();
//        map.put("/main","authc");
//        map.put("/main","perms[manage]");
//        map.put("/main","roles[administator]");
        // 大部分角色都是用requireRoles注解的形式
        // 需要相应角色权限的资源
        //设置登录页面
        shiroFilter.setLoginUrl("/login");
        shiroFilter.setFilterChainDefinitionMap(map);
        return shiroFilter;
    }



    @Bean(name = "securityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(@Qualifier("userRealm") UserRealm userRealm) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(userRealm);
        return securityManager;
    }

    @Bean
    public UserRealm userRealm() {
        return new UserRealm();
    }
}
