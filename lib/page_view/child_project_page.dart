import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:wan_flutter/model/project_list_model.dart';
import 'package:wan_flutter/provide/project_provide.dart';

import 'base_webview.dart';

class ChildProjectPage extends StatefulWidget {
  int typeId;

  ChildProjectPage(this.typeId);

  @override
  _ChildProjectPageState createState() => _ChildProjectPageState();
}

class _ChildProjectPageState extends State<ChildProjectPage>
    with AutomaticKeepAliveClientMixin {
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: FutureBuilder(
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            var data = Provide.value<ProjectProvide>(context).childProjectList;
            return EasyRefresh(
              refreshHeader: MaterialHeader(
                key: _headerKey,
              ),
              refreshFooter: ClassicsFooter(
                  key: _footerKey,
                  loadText: '上拉加载',
                  loadReadyText: '松手加载',
                  loadingText: '加载中',
                  loadedText: '加载完成',
                  noMoreText: '',
                  bgColor: Colors.orange),
              loadMore: () async {
                page++;
                _getProjectListData(context, widget.typeId, page);
              },
              onRefresh: () {
                page = 0;
                _getProjectListData(context, widget.typeId, page);
              },
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return _listItem(context, data.data.datas[index]);
                },
                itemCount: data.data.datas.length,
              ),
            );
          } else {
            return Center(
              child: Text('加载中'),
            );
          }
        },
        future: _getProjectListData(context, widget.typeId, page),
      ),
    );
  }

  Widget _listItem(context, Dtats datas) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BaseWebView(
            title: datas.title,
            url: datas.link,
          );
        }));
      },
      child: Container(
        width: double.infinity,
        height: ScreenUtil().setHeight(300),
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
        child: Row(
          children: <Widget>[
            Image.network(
              datas.envelopePic,
              height: ScreenUtil().setHeight(260),
            ),
            Expanded(
              child: Container(
                width: ScreenUtil().setWidth(600),
                margin: const EdgeInsets.only(left: 25),
                child: Column(
                  children: <Widget>[
                    Text(
                      datas.title,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(23),
                          color: Colors.black),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        datas.desc,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(datas.author)),
                            flex: 1,
                          ),
                          Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(datas.niceDate)),
                            flex: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _getProjectListData(context, int id, int page) async {
    await Provide.value<ProjectProvide>(context).getListData(id, page);
    return '加载完成';
  }

  @protected
  bool get wantKeepAlive => true;
}
