// ignore_for_file: deprecated_member_use

import 'package:firstflutter/json/root_app_json.dart';
import 'package:firstflutter/page/bottom_navigator.dart';
import 'package:firstflutter/screen/homeScreen/CommingSoon.dart';
import 'package:firstflutter/screen/homeScreen/TheTopChoice.dart';
import 'package:firstflutter/screen/homeScreen/ScrollChip.dart';
import 'package:firstflutter/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static const routerName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        automaticallyImplyLeading: false,
        title: const Text(
          'New & Hot',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/svg/cast.svg',
              color: Colors.white,
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/svg/search.svg',
              color: Colors.white,
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ScrollChip(),
                CommingSoon(),
                TheTopChoice(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const GetFooter(itemsBottom: itemsBottom),
    );
  }
}
