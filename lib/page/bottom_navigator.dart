// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:firstflutter/json/root_app_json.dart';
import 'package:firstflutter/main.dart';
import 'package:firstflutter/screen/homeScreen/home_screen.dart';
import 'package:firstflutter/screen/login_screen.dart';
import 'package:firstflutter/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetFooter extends StatefulWidget {
  final List<Map<String, String>> itemsBottom;
  const GetFooter({Key? key, required this.itemsBottom}) : super(key: key);

  @override
  State<GetFooter> createState() => _GetFooterState();
}

class _GetFooterState extends State<GetFooter> {
  int activeTab = 0;
  handleOnTap(int index, String name) {
    setState(() {
      activeTab = index;
    });
    logger.i('name: $name');
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.black87,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(itemsBottom.length, (index) {
            return GestureDetector(
              onTap: () {
                handleOnTap(index, itemsBottom[index]["text"]!);
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    itemsBottom[index]["icon"]!,
                    width: 24,
                    height: 24,
                    color: activeTab == index ? Colors.white : Colors.white30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    itemsBottom[index]["text"]!,
                    style: TextStyle(
                      color: activeTab == index ? Colors.white : Colors.white30,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
