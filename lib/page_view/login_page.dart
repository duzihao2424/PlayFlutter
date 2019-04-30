import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        height: double.infinity,
        child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.topRight,
                child: IconButton(icon: Icon(Icons.close),onPressed: (){
                  Navigator.pop(context);
                },),
              ),


              Container(margin: const EdgeInsets.only(top: 20),child: Image.asset('images/waiting.gif'),width: ScreenUtil().setWidth(300),),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextField(keyboardType: TextInputType.text,decoration: InputDecoration(
                  labelText: '用户名',
                ),autofocus: true,),
              ),
              TextField(keyboardType: TextInputType.text,decoration: InputDecoration(
                labelText: '请输入密码',
              ),autofocus: false,),
              Container(
                color: Colors.orange,
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 12,bottom: 12),
                margin: const EdgeInsets.only(top: 50),
                child: InkWell(
                child: Text('登录',style: TextStyle(color: Colors.white,fontSize:ScreenUtil().setSp(32) ),),),
              ),


              Container(margin:const EdgeInsets.only(top: 20),child: InkWell(onTap:(){

              },child: Text('没有账号?，去注册',style: TextStyle(color: Colors.black54,fontSize: ScreenUtil().setSp(32)),)))

            ],
          ),

      ),


    );
  }
}
