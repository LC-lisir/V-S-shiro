package com.example.utils;

import com.example.sys.service.ChatChannelHandler;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.stream.ChunkedWriteHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@ChannelHandler.Sharable
public class NettyChannelInitializer extends ChannelInitializer<SocketChannel> {

    @Autowired
    private ChatChannelHandler chatChannelHandler;

    @Override
    protected void initChannel(SocketChannel channel) throws Exception {
        //获取管道
        ChannelPipeline pipeline = channel.pipeline();
        //添加http编解码器
        pipeline.addLast(new HttpServerCodec());
        //对写大数据流进行支持
        pipeline.addLast(new ChunkedWriteHandler());
        //对httpMessage进行聚合处理
        pipeline.addLast(new HttpObjectAggregator(1024 * 64));
        //处理握手动作
        pipeline.addLast(new WebSocketServerProtocolHandler("/ws"));

        pipeline.addLast(chatChannelHandler);
    }
}
