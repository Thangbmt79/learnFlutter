import 'package:firstflutter/screen/homeScreen/home_screen.dart';
import 'package:firstflutter/screen/login_screen.dart';
import 'package:firstflutter/screen/register_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // authen
  LoginScreen.routerName: (ctx) => const LoginScreen(),
  RegisterScreen.routerName: (ctx) => const RegisterScreen(),
  HomeScreen.routerName: (ctx) => const HomeScreen(),
};
