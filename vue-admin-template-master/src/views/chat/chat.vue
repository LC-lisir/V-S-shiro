<template>
  <div class="main">
<!--    <div class="main_up">-->
<!--      <div v-if="curUserName == ''">-->
<!--        <el-button @click="openDialog('登录')">登录</el-button>-->
<!--        <el-button @click="openDialog('注册')">注册</el-button>-->
<!--      </div>-->
<!--      <div v-else>-->
<!--        {{this.curUserName}}-->
<!--        <el-button type="info" @click="loginOut">退出登录</el-button>-->
<!--      </div>-->
<!--    </div>-->
<!--    -->
    <div class="main_down">
      <div class="left">
        <div class="left_up">
          <div class="label_title">
            已建立会话
          </div>
          <div :class="curSessionId == item.id ? 'box_select' : 'box'" v-for="item in sessionList_already" :key="item.id">
            <div class="box_left"  @click="startSession(item.id)">
              {{item.listName}}
            </div>
            <div class="right_left">
              <div class="right_left_count">
                {{item.unReadCount}}
              </div>
              <div class="right_left_del">
                <i class="el-icon-close" @click="delSession(item.id)"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="left_down">
          <div class="label_title">
            可建立会话
          </div>
          <div v-for="item in sessionList_not" :key="item.id" class="box" @click="createSession(item.id, item.username)">
            <div class="box_left">
              {{item.username}}
            </div>
          </div>
        </div>

      </div>
      <div class="right">
        <div class="up" ref="element" id="msg_end">
          <div v-for="(item,i) in list" :key="i" :class="item.fromUserId === curUserId ? 'msg_right' : 'msg_left'">
            <div class="msg_right_up">
              {{item.fromUserName}}
            </div>
            <div :class="item.fromUserId === curUserId ? 'msg_right_down' : 'msg_left_down'">
              {{item.content}}
            </div>
          </div>

        </div>
        <div class="down">
          <el-input
            style="top: -20px;"
            type="textarea"
            :rows="9"
            placeholder="请输入内容，回车发送！"
            @keyup.enter.native = "sendMsg"
            v-model="textarea">
          </el-input>

<!--           <el-button  @click="sendMsg">发送</el-button>-->
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import axios from 'axios';
import userApi from '@/api/userManage'
import Token from "@/utils/auth"
export default{
  name: 'HelloWorld',
  data(){
    return{
      dialogVisible: false,
      dialogTitle: '',
      loginName: '',
      textarea: "",
      list: [],
      curUserId: "",
      curUserName: "",
      curSessionId: '',
      sessionList_already:[],
      sessionList_not:[],
    }
  },
  created() { // 页面创建生命周期函数
  },
  mounted() {
    this.getLoginName()
  },
  updated(){
    // 解决每次发消息到最后面
    var elmnt = document.getElementById("msg_end");
    elmnt.scrollTop = elmnt.scrollHeight;
  },
  destroyed: function () { // 离开页面生命周期函数
    this.websocketclose();
  },
  methods: {
    initWebSocket: function (userId,sessionId) {
      // WebSocket与普通的请求所用协议有所不同，ws等同于http，wss等同于https
      this.websock = new WebSocket("ws://192.168.1.110:9999/websocket/"+userId+"/"+sessionId);
      this.websock.onopen = this.websocketonopen;
      this.websock.onerror = this.websocketonerror;
      this.websock.onmessage = this.websocketonmessage;
      this.websock.onclose = this.websocketclose;
    },
    websocketonopen: function () {
      console.log("WebSocket连接成功");
    },
    websocketonerror: function (e) {
      console.log("WebSocket连接发生错误",e);
    },
    websocketonmessage: function (e) {
      let data = JSON.parse(e.data);

      if(data instanceof Array){
        // 列表数据
        this.sessionList_already = data
      }else{
        // 消息数据
        this.list.push(data)
        console.log("后端data:")
        console.log(data)
      }
    },
    websocketclose: function (e) {
      if(this.curUserId != null){
        if(this.curSessionId != null){
          this.initWebSocket(this.curUserId, this.curSessionId)
        }else{
          this.initWebSocket(this.curUserId, 99999999)
        }
      }
      console.log("connection closed",e);
      console.log(e);
    },
    //获取登录用户id
getLoginName(){
  let token = this.$store.state.user.token
  userApi.getloginId(token).then(response=>{
    console.log(response);
    this.curUserId = response.data.id
    this.curUserName = response.data.name
    this.getSessionListNot()
    this.sessionListAlready()
    this.startSession(99999999)
  })
},
    // 消息发送
    sendMsg(){
      if(this.curSessionId == ''){
        return this.$message.error("请选择左边的对话框开始聊天!")
      }
      let data = {
        "fromUserId": this.curUserId,
        "fromUserName": this.curUserName,
        "content": this.textarea
      }
      this.list.push(data)
      this.websock.send(this.textarea)
      this.textarea = ''
    },
    // 获取可建立会话列表
    getSessionListNot(){
      let thus = this
      axios.get('http://192.168.1.110:9999/sessionList/not?id=' + this.curUserId)
        .then(function (response) {
          if(response.data.code == -1){
            return thus.$message.error(response.data.errDesc);
          }
          console.log(response.data.data)
          thus.sessionList_not = response.data.data
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    // 获取已存在的会话列表
    sessionListAlready(){
      let thus = this
      axios.get('http://192.168.1.110:9999/sessionList/already?id=' + this.curUserId)
        .then(function (response) {
          if(response.data.code == -1){
            return thus.$message.error(response.data.errDesc);
          }
          thus.sessionList_already = response.data.data
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    // 创建会话
    createSession(toUserId, toUserName){
      let thus = this
      axios.get('http://192.168.1.110:9999/createSession?id=' + this.curUserId + "&toUserId=" + toUserId + "&toUserName=" + toUserName)
        .then(function (response) {
          if(response.data.code == -1){
            return thus.$message.error(response.data.errDesc);
          }
          thus.getSessionListNot()
          thus.sessionListAlready()
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    // 开始会话
    startSession(sessionId){
      console.log(this.websock);
      if(this.websock != undefined){
        this.websock.close()
      }
      this.curSessionId = sessionId
      this.initWebSocket(this.curUserId, sessionId)
      this.msgList(sessionId)
    },
    // 删除会话
    delSession(sessionId){
      let thus = this
      axios.get('http://192.168.1.110:9999/delSession?sessionId=' + sessionId)
        .then(function (response) {
          if(response.data.code == -1){
            return thus.$message.error(response.data.errDesc);
          }
          thus.getSessionListNot()
          thus.sessionListAlready()
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    // 获取消息数据
    msgList(sessionId){
      let thus = this
      axios.get('http://192.168.1.110:9999/msgList?sessionId=' + sessionId)
        .then(function (response) {
          if(response.data.code == -1){
            return thus.$message.error(response.data.errDesc);
          }
          thus.list = response.data.data
          // 从新获取列表
          thus.sessionListAlready()
        })
        .catch(function (error) {
          console.log(error);
        });


    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.main{

  width: 100%;
  /* border: 1px #1890ff solid; */
  margin: 20px auto;
  /*height: 790px;*/
  display: flex;
  justify-content: center;
}
.main_up{
  width: 980px;
  height: 40px;
  /* border:1px red solid; */
}
.main_down{
  width: 981px;
  height: 550px;
  box-shadow: 0px 0px 15px 15px #a0a0a0;
  /*background-color: #99a9bf;*/
  display: flex;
}
.left{
  width: 300px;
  height:100%;
  box-shadow: 7px 0px 7px -7px #5E5E5E;
}
.left_up{
  width: 300px;
  height: 50%;
  overflow-y: auto;
  padding-bottom: 6px;
   border-bottom: 1px red solid;
}
.left_up .box{
  margin-bottom:4px;
}
.label_title{
  width: 282px;
  height: 30px;
  background-color: #acacac;
  font-weight: 600;
  padding: 8px;
}
.left_down{
  width: 300px;
  height: 50%;
  overflow-y: auto;

}
.right{
  width: 670px;
  height: 100%;
  /*padding-top: 20px;*/
  padding-left:15px;
  padding-right:10px;
}
.box{
  width: 250px;
  height: 22px;
  padding: 10px 25px 10px 25px;
  display: flex;
  justify-self: flex-end;
}
.box:hover{
  background-color: gainsboro;
  cursor: pointer;
}
.box_select{
  width: 250px;
  height: 22px;
  padding: 10px 25px 10px 25px;
  display: flex;
  justify-self: flex-end;
  background-color: gainsboro;
}
.box_left{
  width: 230px;
  height: 26px;
  line-height: 10px;
}
.right_left{
  width: 50px;
  height: 22px;
  display: flex;
  justify-content: space-between;
  /* border: 1px red solid; */
}
.right_left_count{
  /* border: 1px blue solid; */
  padding-left: 10px;
  width: 20px;
}
.right_left_del{
  width: 20px;
  padding-left: 10px;
}
.up{
  width: 100%;
  height: 65%;
  overflow-y: scroll;
  overflow-x: hidden;
   padding-bottom: 40px;
  border-bottom: 1px #1890ff solid;
  padding-left: 10px;
  padding-right: 10px;
}
.msg_left{

  /* padding-left: 5px; */
  margin-top: 5px;
  /* border: 1px #1890ff solid; */
}
.msg_left_up{
  height: 25px;
  margin-top: 5px;
}
.msg_left_down{
  border-radius: 10px;
  border-top-left-radius: 0px;
  background-color: #4F7cff;
  color: white;
  display: inline;
  padding: 10px;
  margin-left: 29px;
  line-height: 52px;
}
.msg_right{

  /* padding-right: 20px; */
  margin-top: 5px;
  /* border: 1px #1890ff solid; */
  text-align: right;
}
.msg_right_up{
  margin-right: 20px;
  height: 25px;

}
.msg_right_down{
  border-radius: 10px;
  border-top-right-radius: 0px;
  background-color: #4F7cff;
  color: white;
  display: inline;
  padding: 10px;
  margin-right: 29px;
  line-height: 52px;
}
.down{
  width: 100%;
  height:35%;
  /* border: 1px red solid; */
}
</style>
