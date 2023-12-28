// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_null_comparison, unnecessary_string_interpolations

import 'package:firstflutter/controllers/users_controllers.dart';
import 'package:firstflutter/json/movie_genre.dart';
import 'package:firstflutter/main.dart';
import 'package:firstflutter/models/users.dart';
import 'package:firstflutter/screen/helper/button/button.dart';
import 'package:firstflutter/screen/homeScreen/CommingSoon.dart';
import 'package:flutter/material.dart';

class DetailMovies extends StatefulWidget {
  final int userId;

  const DetailMovies({Key? key, required this.userId}) : super(key: key);

  @override
  State<DetailMovies> createState() => _DetailMoviesState();
}

class _DetailMoviesState extends State<DetailMovies> {
  bool _isLoading = false;
  final usersController = UsersController();
  late Users user;
  Future<void> fetchDataById() async {
    setState(() {
      _isLoading = true;
    });

    try {
      Users users = await usersController.getUsersById(widget.userId);
      if (users != null) {
        setState(() {
          user = users;
        });
      }
    } catch (e) {
      logger.i("[ERR] fetchDataById ${e.toString()}");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataById();
  }

  handlePlay() {
    logger.i("played");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 480,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/banner.webp"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 480,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 480,
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            "assets/images/title_img.webp",
                            width: 300,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(genreFilms.length, (index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color.fromARGB(255, 67, 69, 71),
                                        Color.fromARGB(255, 87, 87, 88)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  child: Text(
                                    genreFilms[index]["name"],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(
                                  Icons.playlist_add_check_outlined,
                                  size: 30),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                            const Text(
                              "My list",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Button(
                              buttonText: "Play",
                              svgAssetPath: "assets/svg/play.svg",
                              onPressed: handlePlay,
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.info_outline, size: 28),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                            const Text(
                              "Info",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My list",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: CommingSoon(),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: !_isLoading
                            ? Container(
                                padding: const EdgeInsets.only(bottom: 7),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Column(
                                    children: [
                                      Image.network("${user.image}"),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 7),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${user.title}",
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
                                          "${user.publishedAt}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 7, right: 7, bottom: 7),
                                        child: Text(
                                          "${user.content}",
                                          style: const TextStyle(
                                              color: Colors.white60),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 4,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 7),
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            Button(
                                              buttonText: "Play",
                                              svgAssetPath:
                                                  "assets/svg/play.svg",
                                              onPressed: handlePlay,
                                              backgroundColor: Colors.white,
                                            ),
                                            const SizedBox(width: 10),
                                            Button(
                                              buttonText: "List",
                                              svgAssetPath:
                                                  "assets/svg/list.svg",
                                              onPressed: handlePlay,
                                              backgroundColor: Colors.white12,
                                              textColor: Colors.white,
                                              iconColor: Colors.white,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            "assets/images/logo.ico",
                            width: 35,
                            fit: BoxFit.cover,
                          )),
                      Row(
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.collections_bookmark_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          IconButton(
                              icon: Image.asset("assets/images/profile.jpeg",
                                  width: 26, height: 26, fit: BoxFit.cover),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "TV Shows",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Movies",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 24,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
