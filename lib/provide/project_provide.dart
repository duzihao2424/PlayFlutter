import 'package:flutter/material.dart';
import 'package:wan_flutter/model/project_top_nav.dart';
import 'package:wan_flutter/model/project_list_model.dart';
import 'package:wan_flutter/service/service_method.dart';
import 'package:wan_flutter/service/service_url.dart';

class ProjectProvide with ChangeNotifier {
  ProjectTopNav projectTopNav = null;
  ChildProjectList childProjectList = null;

  int typeId = 0;

  getTopData() async{
    await getCustom(ProjectTop()).then((val){
      projectTopNav = ProjectTopNav.fromJson(val);
      notifyListeners();
    });
  }

  getListData(int id,int page) async{
    await getProjectList(id,page).then((val){
      childProjectList = ChildProjectList.fromJson(val);
      notifyListeners();
    });
  }

}