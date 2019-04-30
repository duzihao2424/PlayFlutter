const baseUrl = "http://www.wanandroid.com/";

//首页banner
String serviceBanner(){
  return "banner/json";
}

//首页文章列表
String serviceArticle(int page){
  return 'article/list/$page/json';
}

//首页导航列表
String serviceNavList(){
  return 'navi/json';
}

//项目分类
String ProjectTop(){
  return 'project/tree/json';
}
//项目列表
String serviceProjectList(int id,int page){
  return 'project/list/${page}/json?cid=${id}';
}

//知识体系
String serviceKnowladge(){
  return 'tree/json';
}
//知识体系文章列表
String serviceKnowladgeList(int cId,int page){
  return 'article/list/$page/json?cid=$cId';
}