import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wan_flutter/service/service_method.dart';
import 'package:wan_flutter/model/navi_list_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'base_webview.dart';

class navigationPage extends StatefulWidget {
  @override
  _navigationPageState createState() => _navigationPageState();
}

class _navigationPageState extends State<navigationPage> with AutomaticKeepAliveClientMixin{
 List<NaviData> list = [];
 List<Widget> listWidget = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('导航'),),
      body: ListView.builder(itemBuilder: (context,index){
        return item(list[index]);
      },
      itemCount: list.length,)
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData(){
    getNavData().then((val){
      NaviListModel nm = NaviListModel.fromJson(val);
      setState(() {
        list.addAll(nm.data);

      });
    });
  }

  Widget item(NaviData data){
    return Container(
      child: Column(
        children: <Widget>[
          Container(child:  Text(data.name,style: TextStyle(fontSize: ScreenUtil().setSp(25)),),
          margin: const EdgeInsets.only(top: 10),),

          _rightList(data.articles),
        ],
      ),
    );
  }

  Widget _rightList(List<Articles> articles){
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 2.0,
        children:_rightItem(articles),
      ),
    );
  }

  List<Widget> _rightItem(List<Articles> articles){
    return  listWidget = articles.map((val){
      return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return BaseWebView(title:val.title,url:val.link);
          }));
        },
        child: Chip(backgroundColor:Color.fromARGB(255, getRandomNum(), getRandomNum(), getRandomNum()),label: Text(val.title,style: TextStyle(color: Colors.white),)),
      );
    }).toList();
  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  int getRandomNum(){
    var random = Random();
    int i = random.nextInt(255);
    return i;
  }
}
