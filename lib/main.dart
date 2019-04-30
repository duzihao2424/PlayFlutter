import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provide/provide.dart';
import 'package:wan_flutter/provide/knowladge_provide.dart';
import 'package:wan_flutter/provide/child_tab_provide.dart';
import 'package:wan_flutter/provide/project_provide.dart';
import 'package:wan_flutter/routers/application.dart';
import 'package:wan_flutter/routers/routes.dart';

import 'bottom_navigator.dart';
import 'page_view/login_page.dart';


void main() {
  var projectProvide = ProjectProvide();
  var knowladgeProvide = KnowladgeProvide();
  var childTabProvide = ChildTabProvide();
  var provides = Providers();
  provides..provide(Provider<ProjectProvide>.value(projectProvide))
  ..provide(Provider<KnowladgeProvide>.value(knowladgeProvide))
  ..provide(Provider<ChildTabProvide>.value(childTabProvide));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])//强制竖屏
      .then((_) {
   return runApp(ProviderNode(child: MyApp(), providers: provides));
  });

}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      final router = Router();
      Routes.configRoutes(router);
      Application.router = router;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.orange,
        accentColor: Colors.orange,
      ),
      home: LoginPage(),
    );
  }
}
