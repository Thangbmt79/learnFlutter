// ignore_for_file: deprecated_member_use

import 'package:firstflutter/screen/homeScreen/Content.dart';
import 'package:firstflutter/screen/homeScreen/ScrollChip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
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
        // automaticallyImplyLeading: false,
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
            onPressed: () {},
          ),
        ],
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(14.0, 0, 14.0, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ScrollChip(),
          ContentHome(),
        ]),
      )),
    );
  }
}
