import 'package:firstflutter/screeen/login_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // authen
  LoginScreen.routerName: (ctx) => const LoginScreen(),
};
