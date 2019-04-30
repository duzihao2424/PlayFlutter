import 'package:flutter/material.dart';
import 'package:wan_flutter/model/child_tab_model.dart';
import 'package:wan_flutter/service/service_method.dart';
import 'package:wan_flutter/service/service_url.dart';
import 'dart:convert';

class ChildTabProvide with ChangeNotifier{
  ChildTabModel childTabModel = null;
  List<ChildTabModelDatas> list = [];
  getDataList(int id,int page) async {
      await getKnowladgeList(id, page).then((val){
      childTabModel = ChildTabModel.fromJson(val);
      list.clear();
      list.addAll(childTabModel.data.datas);
      notifyListeners();
    });

  }



}