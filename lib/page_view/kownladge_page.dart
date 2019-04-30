import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:wan_flutter/model/know_model.dart';
import 'package:wan_flutter/provide/knowladge_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_flutter/routers/application.dart';
import 'dart:convert';

class knowladgePage extends StatelessWidget {
  List<Widget> listWidget = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('知识体系'),
      ),
      body: FutureBuilder(
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return Container(
              child: Provide<KnowladgeProvide>(builder: (context, child, val) {
                List<KnowModelData> list =
                    Provide.value<KnowladgeProvide>(context).list;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return _listItem(context,list[index]);
                  },
                  itemCount: list.length,
                );
              }),
            );
          } else {
            return Text('加载中');
          }
        },
        future: _getData(context),
      ),
    );
  }

  Widget _listItem(context,KnowModelData data) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
      decoration: BoxDecoration(border: Border(
          bottom: BorderSide(color: Colors.black12,width: 1))),
      alignment: Alignment.centerLeft,
      width: ScreenUtil().setWidth(750),
      child: InkWell(
        onTap: (){
          Provide.value<KnowladgeProvide>(context).getChildrenList(data.children);
          Map map = {
          "id":data.id, "title":data.name
          };
          String message = json.encode(map);
          var intent = jsonEncode(Utf8Encoder().convert(message));
          Application.router.navigateTo(context, '/knowpage?message=$intent');
        },
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(652),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${data.name}',style: TextStyle(fontSize: ScreenUtil().setSp(30),color: Colors.black),),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 2.0,
                      children: _itemWarp(data.children),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Icon(Icons.navigate_next),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _itemWarp(List<Children> list) {
    return listWidget = list.map((val) {
      return Container(
        child: Text(val.name),
      );
    }).toList();
  }

  Future _getData(context) async {
    await Provide.value<KnowladgeProvide>(context).getKnowkladgeData();
    return 'end';
  }
}
