import 'package:flutter/material.dart';
import '../Home.dart';
import '../login/Login.dart';
import '../login/ForgetPassword.dart';
import '../pages/LOLAccount.dart';

// 配置路由
final routes = {
  '/': (context) => LoginPage(),
  '/HomePage': (context) => HomePage(),
  '/ForgetPasswordPage': (context) => ForgetPasswordPage(),
  '/LOLAccountPage': (context) => LOLAccountPage(),
};

// 实现namedRouter 传参
Function onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
