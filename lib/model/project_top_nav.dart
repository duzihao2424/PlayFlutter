import 'dart:convert' show json;

class ProjectTopNav {

  int errorCode;
  String errorMsg;
  List<ProjectTopNavData> data;

  ProjectTopNav.fromParams({this.errorCode, this.errorMsg, this.data});

  factory ProjectTopNav(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ProjectTopNav.fromJson(json.decode(jsonStr)) : new ProjectTopNav.fromJson(jsonStr);

  ProjectTopNav.fromJson(jsonRes) {
    errorCode = jsonRes['errorCode'];
    errorMsg = jsonRes['errorMsg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
      data.add(dataItem == null ? null : new ProjectTopNavData.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"errorCode": $errorCode,"errorMsg": ${errorMsg != null?'${json.encode(errorMsg)}':'null'},"data": $data}';
  }
}

class ProjectTopNavData {

  int courseId;
  int id;
  int order;
  int parentChapterId;
  int visible;
  bool userControlSetTop;
  String name;
  List<dynamic> children;

  ProjectTopNavData.fromParams({this.courseId, this.id, this.order, this.parentChapterId, this.visible, this.userControlSetTop, this.name, this.children});

  ProjectTopNavData.fromJson(jsonRes) {
    courseId = jsonRes['courseId'];
    id = jsonRes['id'];
    order = jsonRes['order'];
    parentChapterId = jsonRes['parentChapterId'];
    visible = jsonRes['visible'];
    userControlSetTop = jsonRes['userControlSetTop'];
    name = jsonRes['name'];
    children = jsonRes['children'] == null ? null : [];

    for (var childrenItem in children == null ? [] : jsonRes['children']){
      children.add(childrenItem);
    }
  }

  @override
  String toString() {
    return '{"courseId": $courseId,"id": $id,"order": $order,"parentChapterId": $parentChapterId,"visible": $visible,"userControlSetTop": $userControlSetTop,"name": ${name != null?'${json.encode(name)}':'null'},"children": $children}';
  }
}

