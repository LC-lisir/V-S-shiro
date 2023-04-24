<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="12" :offset="6">
        <div class="main">
          <el-row>
            <el-button type="primary" @click="conectWebSocket()">建立连接</el-button>
            <el-button type="danger">断开连接</el-button>
          </el-row>

          <el-row>
            <el-input
              placeholder="请输入要发送的消息"
              prefix-icon="el-icon-s-promotion"
              v-model="messageValue"
              style="width:50%"
            ></el-input>
            <el-button type="primary" @click="sendMessage()">发送</el-button>
          </el-row>
          <div class="message">
            <p v-for="(item, index) in messageList" :key="index" class="show">
              {{ item }}
            </p>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      name: "", // 昵称
      websocket: null, // WebSocket对象
      aisle: "", // 对方频道号
      messageList: [], // 消息列表
      messageValue: "" // 消息内容
    }
  },
  methods: {

      conectWebSocket: function() {
        console.log("建立连接");
            this.websocket = new WebSocket("ws://localhost:8889/ws")
          //连接发生错误的回调方法
          this.websocket.onerror = function() {

          };
          //连接成功建立的回调方法
          this.websocket.onopen = function() {
              alert("连接成功！")
          };
          //接收到消息的回调方法
          var that = this;
          this.websocket.onmessage = function(e) {
            console.log(e.data)
            that.messageList.push(e.data);
            that.messageList.forEach();
          };
          //连接关闭的回调方法
          this.websocket.onclose = function() {};
          //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
          window.onbeforeunload = function() {
            this.websocket.close();
          };
        },

    // 发送消息
    sendMessage: function() {
      var socketMsg = this.messageValue ;
      this.websocket.send(JSON.stringify(socketMsg));
    },
    showInfo: function() {

    }

  },






}
</script>

<style scoped>
.main {
  position: relative;
  top: 20px;
}
.message {
  position: relative;
  overflow:auto;
  top: 20px;
  width: 100%;
  height: 400px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);
  padding: 5px;
}
</style>
