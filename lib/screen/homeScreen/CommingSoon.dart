import 'package:firstflutter/json/home_json.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: List.generate(mylist.length, (index) {
              return Container(
                margin: const EdgeInsets.only(right: 8),
                width: 110,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: AssetImage(mylist[index]['img']),
                        fit: BoxFit.cover)),
              );
            }),
          ),
        ),
      ),
    );
  }
}
