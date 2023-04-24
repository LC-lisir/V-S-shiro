package com.example.sys.service;

import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.util.concurrent.GlobalEventExecutor;
import org.springframework.stereotype.Component;

@Component
@ChannelHandler.Sharable
public class ChatChannelHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {
    public static ChannelGroup channelGroup;

    static {
        channelGroup = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
    }

    //客户端与服务器建立连接的时候触发，
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        System.out.println("与客户端建立连接，通道开启！");
        //添加到channelGroup通道组
        channelGroup.add(ctx.channel());
    }

    //客户端与服务器关闭连接的时候触发，
    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        System.out.println("与客户端断开连接，通道关闭！");
        channelGroup.remove(ctx.channel());
    }

    //服务器接受客户端的数据信息，
    @Override
    protected void channelRead0(ChannelHandlerContext ctx, TextWebSocketFrame msg) {
        System.out.println("服务器收到的数据：" + msg.text());
        String message = "服务器收到:"+ msg.text();
        channelGroup.writeAndFlush(new TextWebSocketFrame(message));
        //sendMessage(ctx);
        sendAllMessage();
    }

    //给固定的人发消息
    private void sendMessage(ChannelHandlerContext ctx) {
        String message = "你好，" + ctx.channel().localAddress() + " 给固定的人发消息";
        ctx.channel().writeAndFlush(new TextWebSocketFrame(message));
    }

    //发送群消息,此时其他客户端也能收到群消息
    private void sendAllMessage() {
//        String message = "服务器收到:"+;
//        channelGroup.writeAndFlush(new TextWebSocketFrame(message));
    }
}
