import 'package:flutter/material.dart';
import 'package:wan_flutter/model/know_model.dart';
import 'package:wan_flutter/service/service_method.dart';
import 'package:wan_flutter/service/service_url.dart';

class KnowladgeProvide with ChangeNotifier{

  List<KnowModelData> list = [];
  List<Children> cList = [];
  KnowModel knowModel;


  getKnowkladgeData() async{
    await getCustom(serviceKnowladge()).then((val){

      knowModel = KnowModel.fromJson(val);
      list.clear();
      list.addAll(knowModel.data);
      notifyListeners();
    });

  }

  getChildrenList(List<Children> cList){
    this.cList.clear();
    this.cList = cList;
    notifyListeners();
  }

}