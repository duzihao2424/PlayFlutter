import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:wan_flutter/model/know_model.dart';
import 'package:wan_flutter/provide/knowladge_provide.dart';
import 'child_tab_page.dart';

class KnowTopPage extends StatelessWidget {
  String message;
  List<Tab> tList = [];

  KnowTopPage(this.message);

  @override
  Widget build(BuildContext context) {
    var list = List<int>();

    ///字符串解码
    jsonDecode(message).forEach(list.add);
    final String value = Utf8Decoder().convert(list);
    Map<String, dynamic> map = json.decode(value);

    List<Children> cList = [];
    cList.clear();
    cList = Provide.value<KnowladgeProvide>(context).cList;
    tList.clear();

    for (int i = 0; i < cList.length; i++) {
      tList.add(Tab(
        text: cList[i].name,
      ));
    }

    if(cList.length >1){
      return DefaultTabController(
          length: cList.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text('${map['title']}'),
              bottom: TabBar(
                tabs: tList,
                isScrollable: true,
                labelColor: Color(0xff333333),
                labelStyle: TextStyle(
                  fontSize: 15.0,
                ),
                unselectedLabelColor: Color(0xffffffff),
                unselectedLabelStyle: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
            body: TabBarView(children: _childPage(cList)),
          ));
    }else{
      return Scaffold(
        appBar: AppBar(
          title: Text('${map['title']}'),
        ),
        body: ChildTabPage(cList[0].id)
      );
    }


  }


  List<Widget> _childPage(List<Children> cList){
    List<Widget> list = [];
    for(Children children in  cList){
      var childPage = ChildTabPage(children.id);
      list.add(childPage);
    }

    return list;
  }
}
