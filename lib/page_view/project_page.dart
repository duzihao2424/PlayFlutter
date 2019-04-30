import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:wan_flutter/provide/project_provide.dart';
import 'package:wan_flutter/model/project_top_nav.dart';

import 'child_project_page.dart';


class projectPage extends StatelessWidget{

  var tabs = <Tab>[];
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          int size =
              Provide.value<ProjectProvide>(context).projectTopNav.data.length;

          tabs.clear();
          for (int i = 0; i < size; i++) {
            tabs.add(Tab(
              text: Provide.value<ProjectProvide>(context)
                  .projectTopNav
                  .data[i]
                  .name,
            ));
          }

          return DefaultTabController(length: size, child: Scaffold(
            appBar: AppBar(
              title: Text('项目'),
              bottom: TabBar(
                tabs: tabs,
                //配置控制器
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
            body: TabBarView(
              //配置控制器
                controller: tabController,
                children:_createPages(Provide.value<ProjectProvide>(context).projectTopNav.data)),

          ),);
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('项目'),
            ),
            body: Center(child: Text('加载中...'),),
          );
        }
      },
      future: _getTopData(context),
    );
  }

  Future _getTopData(context) async {
    await Provide.value<ProjectProvide>(context).getTopData();
    return '加载完成';
  }

  List<Widget> _createPages(List<ProjectTopNavData> topNav){
    List<Widget> widgets = List();
    for (ProjectTopNavData project in topNav) {
      var page = ChildProjectPage(project.id);
      widgets.add(page);
    }
    return widgets;
  }
}

















