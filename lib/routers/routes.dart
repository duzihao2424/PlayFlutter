import 'package:fluro/fluro.dart';

import 'router_handle.dart';

class Routes {
  static String root = '/';
  static String knowTopPage = '/knowpage';

  static void configRoutes(Router router) {
    router.notFoundHandler =
        Handler(handlerFunc: (context, Map<String, List<String>> map) {
      print('404 NOT FOUND');
    });
    router.define(knowTopPage, handler: knowHandler);
  }
}
