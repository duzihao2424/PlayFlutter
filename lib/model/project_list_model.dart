import 'dart:convert' show json;

class ChildProjectList {

  int errorCode;
  String errorMsg;
  ChildProjectListData data;

  ChildProjectList.fromParams({this.errorCode, this.errorMsg, this.data});

  factory ChildProjectList(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ChildProjectList.fromJson(json.decode(jsonStr)) : new ChildProjectList.fromJson(jsonStr);

  ChildProjectList.fromJson(jsonRes) {
    errorCode = jsonRes['errorCode'];
    errorMsg = jsonRes['errorMsg'];
    data = jsonRes['data'] == null ? null : new ChildProjectListData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"errorCode": $errorCode,"errorMsg": ${errorMsg != null?'${json.encode(errorMsg)}':'null'},"data": $data}';
  }
}

class ChildProjectListData {

  int curPage;
  int offset;
  int pageCount;
  int size;
  int total;
  bool over;
  List<Dtats> datas;

  ChildProjectListData.fromParams({this.curPage, this.offset, this.pageCount, this.size, this.total, this.over, this.datas});

  ChildProjectListData.fromJson(jsonRes) {
    curPage = jsonRes['curPage'];
    offset = jsonRes['offset'];
    pageCount = jsonRes['pageCount'];
    size = jsonRes['size'];
    total = jsonRes['total'];
    over = jsonRes['over'];
    datas = jsonRes['datas'] == null ? null : [];

    for (var datasItem in datas == null ? [] : jsonRes['datas']){
      datas.add(datasItem == null ? null : new Dtats.fromJson(datasItem));
    }
  }

  @override
  String toString() {
    return '{"curPage": $curPage,"offset": $offset,"pageCount": $pageCount,"size": $size,"total": $total,"over": $over,"datas": $datas}';
  }
}

class Dtats {

  int chapterId;
  int courseId;
  int id;
  int publishTime;
  int superChapterId;
  int type;
  int userId;
  int visible;
  int zan;
  bool collect;
  bool fresh;
  String apkLink;
  String author;
  String chapterName;
  String desc;
  String envelopePic;
  String link;
  String niceDate;
  String origin;
  String prefix;
  String projectLink;
  String superChapterName;
  String title;
  List<Tags> tags;

  Dtats.fromParams({this.chapterId, this.courseId, this.id, this.publishTime, this.superChapterId, this.type, this.userId, this.visible, this.zan, this.collect, this.fresh, this.apkLink, this.author, this.chapterName, this.desc, this.envelopePic, this.link, this.niceDate, this.origin, this.prefix, this.projectLink, this.superChapterName, this.title, this.tags});

  Dtats.fromJson(jsonRes) {
    chapterId = jsonRes['chapterId'];
    courseId = jsonRes['courseId'];
    id = jsonRes['id'];
    publishTime = jsonRes['publishTime'];
    superChapterId = jsonRes['superChapterId'];
    type = jsonRes['type'];
    userId = jsonRes['userId'];
    visible = jsonRes['visible'];
    zan = jsonRes['zan'];
    collect = jsonRes['collect'];
    fresh = jsonRes['fresh'];
    apkLink = jsonRes['apkLink'];
    author = jsonRes['author'];
    chapterName = jsonRes['chapterName'];
    desc = jsonRes['desc'];
    envelopePic = jsonRes['envelopePic'];
    link = jsonRes['link'];
    niceDate = jsonRes['niceDate'];
    origin = jsonRes['origin'];
    prefix = jsonRes['prefix'];
    projectLink = jsonRes['projectLink'];
    superChapterName = jsonRes['superChapterName'];
    title = jsonRes['title'];
    tags = jsonRes['tags'] == null ? null : [];

    for (var tagsItem in tags == null ? [] : jsonRes['tags']){
      tags.add(tagsItem == null ? null : new Tags.fromJson(tagsItem));
    }
  }

  @override
  String toString() {
    return '{"chapterId": $chapterId,"courseId": $courseId,"id": $id,"publishTime": $publishTime,"superChapterId": $superChapterId,"type": $type,"userId": $userId,"visible": $visible,"zan": $zan,"collect": $collect,"fresh": $fresh,"apkLink": ${apkLink != null?'${json.encode(apkLink)}':'null'},"author": ${author != null?'${json.encode(author)}':'null'},"chapterName": ${chapterName != null?'${json.encode(chapterName)}':'null'},"desc": ${desc != null?'${json.encode(desc)}':'null'},"envelopePic": ${envelopePic != null?'${json.encode(envelopePic)}':'null'},"link": ${link != null?'${json.encode(link)}':'null'},"niceDate": ${niceDate != null?'${json.encode(niceDate)}':'null'},"origin": ${origin != null?'${json.encode(origin)}':'null'},"prefix": ${prefix != null?'${json.encode(prefix)}':'null'},"projectLink": ${projectLink != null?'${json.encode(projectLink)}':'null'},"superChapterName": ${superChapterName != null?'${json.encode(superChapterName)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"tags": $tags}';
  }
}

class Tags {

  String name;
  String url;

  Tags.fromParams({this.name, this.url});

  Tags.fromJson(jsonRes) {
    name = jsonRes['name'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"name": ${name != null?'${json.encode(name)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

