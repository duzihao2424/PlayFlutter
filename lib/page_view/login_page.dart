import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
