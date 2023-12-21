// ignore_for_file: deprecated_member_use

import 'package:firstflutter/json/chip_suggest.dart';
import 'package:firstflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScrollChip extends StatefulWidget {
  const ScrollChip({super.key});

  @override
  State<ScrollChip> createState() => _ScrollChipState();
}

class _ScrollChipState extends State<ScrollChip> {
  List<bool> isSelected =
      List.generate(chipSuggestJson.length, (index) => false);

  _handleButtonClick(int index) {
    setState(() {
      isSelected = List.generate(chipSuggestJson.length, (index) => false);
      isSelected[index] = true;
      logger.i('Password Entered: ${chipSuggestJson[index]['title']}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(chipSuggestJson.length, (index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: isSelected[index] ? Colors.white : Colors.black,
                onPrimary: isSelected[index] ? Colors.black : Colors.white24,
                side: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              onPressed: () {
                _handleButtonClick(index);
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    chipSuggestJson[index]["img"],
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    chipSuggestJson[index]['title'],
                    style: TextStyle(
                      color: isSelected[index] ? Colors.black : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        })),
      ),
    );
  }
}
