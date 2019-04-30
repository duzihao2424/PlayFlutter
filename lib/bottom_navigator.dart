import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'page_view/home_page.dart';
import 'page_view/project_page.dart';
import 'page_view/navigation_page.dart';
import 'page_view/kownladge_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bottomNavitor extends StatefulWidget {
  @override
  _bottomNavitorState createState() => _bottomNavitorState();
}

class _bottomNavitorState extends State<bottomNavitor> {
  List<BottomNavigationBarItem> _bList = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.book),title: Text('知识体系')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.up_arrow),title: Text('导航')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.folder),title: Text('项目')),
  ];
  List<Widget> _pageList = [
    homePage(),
    knowladgePage(),
    navigationPage(),
    projectPage(),
  ];


  int _current = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: _bList,
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        setState(() {
          _current  = index;
        });
      },
      currentIndex: _current,),
      body: IndexedStack(children: _pageList,index: _current,),
    );
  }
}





























