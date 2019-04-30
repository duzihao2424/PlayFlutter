import 'dio_config.dart';
import 'dart:io';
import 'dart:async';
import 'service_url.dart';
import 'package:dio/dio.dart';

//获取首页banner接口
Future getBannerData() async{
  try{
    Response response;
    response = await dioWan().get(serviceBanner());
    if(response.statusCode == 200 ){
      return response.data;
    }
  }catch(e){
    print(e);
  }
  
  
}

//获取首页文章列表接口
Future getArticleData(int page) async {
  try{
    Response response;
    response = await dioWan().get(serviceArticle(page));
    if(response.statusCode == 200){
      return response.data;
    }
  }catch(e){
    print(e);
  }
}

//获取导航数据接口
  Future getNavData() async {
    try {
      Response response;
      response = await dioWan().get(serviceNavList());
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print(e);
    }
  }

    Future getCustom(String url) async {
      try {
        Response response;
        response = await dioWan().get(url);
        if (response.statusCode == 200) {
          return response.data;
        }
      } catch (e) {
        print(e);
      }
    }


Future getProjectList(int id,int page) async {
  try {
    Response response;
    response = await dioWan().get(serviceProjectList(id,page));
    if (response.statusCode == 200) {
      return response.data;
    }
  } catch (e) {
    print(e);
  }
}

Future getKnowladgeList(int id,int page) async {
  try {
    Response response;
    response = await dioWan().get(serviceKnowladgeList(id,page));
    if (response.statusCode == 200) {
      print('getKnowladgeList = ${response.data}');
      return response.data;
    }
  } catch (e) {
    print(e);
  }
}

