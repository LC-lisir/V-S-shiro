package com.example;


import com.example.sys.service.WebSockerServer;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@SpringBootApplication
@MapperScan("com.example.*.mapper")
public class SpringbootAdminApplication {

    public static void main(String[] args) {
        ApplicationContext ctx = SpringApplication.run(SpringbootAdminApplication.class, args);

        WebSockerServer webSockerServer = ctx.getBean("WebSocketServer",WebSockerServer.class);
        ExecutorService service = Executors.newCachedThreadPool();
        service.execute(webSockerServer);
        service.shutdown();


//    @Bean
//    public PasswordEncoder passwordEncoder(){
//        return new BCryptPasswordEncoder();
//    }
}
}
