import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(

      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Image.asset('default_touxiang.png'),
          TextField(keyboardType: TextInputType.text,decoration: InputDecoration(
            labelText: '用户名',
          ),autofocus: true,),
          TextField(keyboardType: TextInputType.text,decoration: InputDecoration(
            labelText: '用户名',
          ),autofocus: false,)
        ],
      ),


    );
  }
}
