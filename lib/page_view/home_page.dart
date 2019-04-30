import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wan_flutter/model/banner_model.dart';
import 'package:wan_flutter/model/home_list_model.dart';
import 'package:wan_flutter/service/service_method.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'base_webview.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage>
    with AutomaticKeepAliveClientMixin {
  bool isShowOrHide = true;
  List<HomeListDatas> aList = [];
  int page = 0;
  bool isLoad = true;
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    // TODO: implement initState
    getArticeData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页'),),
      body: EasyRefresh(
        refreshHeader: MaterialHeader(key: _headerKey,
        ),
        refreshFooter: ClassicsFooter(
            key: _footerKey,
            loadText: '上拉加载',
            loadReadyText: '松手加载',
            loadingText: '加载中',
            loadedText: '加载完成',
            noMoreText: isLoadMore(),
            bgColor: Colors.orange),
        loadMore: () {
          getArticeData();
        },
        onRefresh: ()  {
          aList.clear();
          page = 0;
          getArticeData();
        },
        child: ListView(
            children: <Widget>[
        Column(
        children: <Widget>[
            bannerDate(),
            _homeList(aList),
        ],
      ),
      ],
    ),),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void getArticeData() async{
    await getArticleData(page).then((val) {
      HomeList hl = HomeList.fromJson(val);
      setState(() {
        if(hl.data.datas == null){
          isLoad = false;
        }else{
          isLoad = true;
          aList.addAll(hl.data.datas);
          page++;
        }

      });
    });
  }


  String isLoadMore(){
    if(isLoad == false){
      return '没有更多了~';
    }else{
      return '加载完成';
    }
  }


  Widget _item(HomeListDatas data) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BaseWebView(
            title: data.title,
            url: data.link,
          );
        }));
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        data.author,
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ),
                    flex: 1),
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      data.niceDate,
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  _imgVisiable(data.envelopePic),
                  Column(
                    children: <Widget>[
                      _titleWidget(data.envelopePic, data.title),
                      _itemBottom(data),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imgVisiable(String url) {
    if (url == null || url == '') {
      return Container();
    } else {
      return Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
          child: Image.network(
            url,
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setHeight(120),
            fit: BoxFit.cover,
          ));
    }
  }

  Widget _titleWidget(String url, String text) {
    if (url == null || url == '') {
      return Container(
        width: ScreenUtil().setWidth(700),
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:
          TextStyle(fontSize: ScreenUtil().setSp(28), color: Colors.black),
        ),
      );
    } else {
      return Container(
        width: ScreenUtil().setWidth(490),
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:
          TextStyle(fontSize: ScreenUtil().setSp(28), color: Colors.black),
        ),
      );
    }
  }

  Widget _itemBottom(data){
    return Container(
      width: data.envelopePic == null || data.envelopePic == ''?ScreenUtil().setWidth(700):ScreenUtil().setWidth(480),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              data.chapterName,
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[200],
                borderRadius:
                BorderRadius.all(Radius.circular(3))),),
          Expanded(
            child: Container(
              child:
              IconButton(icon: Icon(Icons.favorite_border)),
              alignment: Alignment.centerRight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeList(List<HomeListDatas> list) {
    return SingleChildScrollView(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _item(list[index]);
        },
        separatorBuilder: (context, index) {
          return SingleChildScrollView(
              child: Container(height: 1.0, color: Colors.grey));
        },
        itemCount: list.length,
        physics: ScrollPhysics(),
      ),
    );
  }
}

//首页banner
class bannerDate extends StatefulWidget {
  @override
  _bannerDateState createState() => _bannerDateState();
}

class _bannerDateState extends State<bannerDate> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          WanBanner b = WanBanner.fromJson(snapshot.data);
          List<Data> bList = b.data;
          return _bannerWidget(
            bList,
          );
        } else {
          return Center(
            child: Text('加载中...'),
          );
        }
      },
      future: getBannerData(),
    );
  }

  Widget _bannerWidget(List<Data> bList) {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: Swiper(
        itemCount: bList.length,
        autoplay: true,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.black54,
              activeColor: Colors.white,
            )),
        itemBuilder: (context, index) {
          return Image.network(
            bList[index].imagePath,
            fit: BoxFit.fill,
          );
        },
        onTap: (index) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BaseWebView(
              title: bList[index].title,
              url: bList[index].url,
            );
          }));
        },
      ),
    );
  }


}
