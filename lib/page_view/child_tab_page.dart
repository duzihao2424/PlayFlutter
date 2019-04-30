import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:wan_flutter/model/child_tab_model.dart';
import 'package:wan_flutter/provide/child_tab_provide.dart';
import 'base_webview.dart';

class ChildTabPage extends StatefulWidget {
  int id;

  ChildTabPage(this.id);

  @override
  _ChildTabPageState createState() => _ChildTabPageState();
}

class _ChildTabPageState extends State<ChildTabPage>
    with AutomaticKeepAliveClientMixin {

  List<ChildTabModelDatas> list = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          list = Provide.value<ChildTabProvide>(context).list;
          return ListView.builder(
            itemBuilder: (context, index) {
              return _item(list[index]);
            },
            itemCount: list.length,
          );
        } else {
          return Text('加载中...');
        }
      },
      future: getData(),
    );
  }

  Future getData() async {
    await Provide.value<ChildTabProvide>(context).getDataList(widget.id, 0);
    return 'end';
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _item(ChildTabModelDatas data) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return BaseWebView(title: data.title,url: data.link,);
        }));
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text('${data.author}'),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Text('${data.niceDate}')),
                  flex: 1,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                '${data.title}',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28), color: Colors.black),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent[200],
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: Text(
                      '${data.chapterName}',
                      style: TextStyle(color: Colors.white),
                    )),
                Expanded(child: Container(alignment:Alignment.centerRight,child: IconButton(icon: Icon(Icons.favorite_border), onPressed: () {})),flex: 1,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
