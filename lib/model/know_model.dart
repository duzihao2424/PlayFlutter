import 'dart:convert' show json;

class KnowModel {

  int errorCode;
  String errorMsg;
  List<KnowModelData> data;

  KnowModel.fromParams({this.errorCode, this.errorMsg, this.data});

  factory KnowModel(jsonStr) => jsonStr == null ? null : jsonStr is String ? new KnowModel.fromJson(json.decode(jsonStr)) : new KnowModel.fromJson(jsonStr);

  KnowModel.fromJson(jsonRes) {
    errorCode = jsonRes['errorCode'];
    errorMsg = jsonRes['errorMsg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
      data.add(dataItem == null ? null : new KnowModelData.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"errorCode": $errorCode,"errorMsg": ${errorMsg != null?'${json.encode(errorMsg)}':'null'},"data": $data}';
  }
}

class KnowModelData {

  int courseId;
  int id;
  int order;
  int parentChapterId;
  int visible;
  bool userControlSetTop;
  String name;
  List<Children> children;

  KnowModelData.fromParams({this.courseId, this.id, this.order, this.parentChapterId, this.visible, this.userControlSetTop, this.name, this.children});

  KnowModelData.fromJson(jsonRes) {
    courseId = jsonRes['courseId'];
    id = jsonRes['id'];
    order = jsonRes['order'];
    parentChapterId = jsonRes['parentChapterId'];
    visible = jsonRes['visible'];
    userControlSetTop = jsonRes['userControlSetTop'];
    name = jsonRes['name'];
    children = jsonRes['children'] == null ? null : [];

    for (var childrenItem in children == null ? [] : jsonRes['children']){
      children.add(childrenItem == null ? null : new Children.fromJson(childrenItem));
    }
  }

  @override
  String toString() {
    return '{"courseId": $courseId,"id": $id,"order": $order,"parentChapterId": $parentChapterId,"visible": $visible,"userControlSetTop": $userControlSetTop,"name": ${name != null?'${json.encode(name)}':'null'},"children": $children}';
  }
}

class Children {

  int courseId;
  int id;
  int order;
  int parentChapterId;
  int visible;
  bool userControlSetTop;
  String name;
  List<dynamic> children;

  Children.fromParams({this.courseId, this.id, this.order, this.parentChapterId, this.visible, this.userControlSetTop, this.name, this.children});

  Children.fromJson(jsonRes) {
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

