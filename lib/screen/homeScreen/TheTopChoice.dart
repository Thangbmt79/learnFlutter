import 'package:firstflutter/json/coming_soon_json.dart';
import 'package:firstflutter/main.dart';
import 'package:firstflutter/screen/helper/button/button.dart';
import 'package:firstflutter/screen/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';

class TheTopChoice extends StatefulWidget {
  const TheTopChoice({super.key});

  @override
  State<TheTopChoice> createState() => _TheTopChoiceState();
}

handlePlay() {
  logger.i("played");
}

handleList(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
  );
}

class _TheTopChoiceState extends State<TheTopChoice> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(comingSoonJson.length, (index) {
            return Container(
              padding: EdgeInsets.only(bottom: 7),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Set the border color
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Column(children: [
                  Image.asset(
                    comingSoonJson[index]['img'],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5, left: 7),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      comingSoonJson[index]['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      comingSoonJson[index]['date'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 7, right: 7, bottom: 7),
                    child: Text(
                      comingSoonJson[index]['description'],
                      style: const TextStyle(color: Colors.white60),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 7),
                    alignment: Alignment.centerLeft,
                    child: const Row(
                      children: [
                        Button(
                          buttonText: "Play",
                          svgAssetPath: "assets/svg/play.svg",
                          onPressed: handlePlay,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Button(
                          buttonText: "Lists",
                          svgAssetPath: "assets/svg/list.svg",
                          onPressed: handlePlay,
                          backgroundColor: Colors.white12,
                          textColor: Colors.white,
                          iconColor: Colors.white,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            );
          }),
        ),
      ),
    );
  }
}
