// ignore_for_file: sized_box_for_whitespace, file_names

import 'package:firstflutter/json/home_json.dart';
import 'package:firstflutter/screen/helper/ellipsisText.dart';
import 'package:flutter/material.dart';

class CommingSoon extends StatefulWidget {
  const CommingSoon({super.key});

  @override
  State<CommingSoon> createState() => _CommingSoonState();
}

class _CommingSoonState extends State<CommingSoon> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: List.generate(mylist.length, (index) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 12),
                    width: 110,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            image: AssetImage(mylist[index]['img']),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 110,
                    child: Text(
                      mylist[index]['name'],
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: 110,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ellipsisText(mylist[index]['genre'], 11),
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            Icons.brightness_1,
                            size: 5,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          mylist[index]['times'],
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
