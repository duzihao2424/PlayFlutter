import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class BaseWebView extends StatefulWidget {
  String title;
  String url;

  BaseWebView({Key key, this.title, this.url}) :super(key: key);

  @override
  _BaseWebViewState createState() => _BaseWebViewState();
}

class _BaseWebViewState extends State<BaseWebView> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(appBar: AppBar(title: Text(widget.title),),
      url: widget.url,
      withZoom: true,
      hidden: true,
      initialChild: Container(
        child: Center(
          child: Text('加载中...'),
        ),
      ),
    );
  }
}
