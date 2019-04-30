import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:wan_flutter/page_view/know_top_page.dart';

Handler knowHandler = new Handler(
  handlerFunc: (context,Map<String,List<String>> map){
      String message = map['message'].first;
      return KnowTopPage(message);
},
);