import 'package:dio/dio.dart';
import 'package:firstflutter/main.dart';
import 'package:firstflutter/models/movies.dart';
import 'package:firstflutter/models/users.dart';

class UsersController {
  Dio dio;
  UsersController() : dio = Dio();

  // Future<List<Users>> getMovies() async {
  //   try {
  //     final res = await dio.get('https://jsonplaceholder.org/posts');
  //     final List<dynamic> results = res.data;

  //     List<Users> users =
  //         results.map((result) => Users.fromJson(result)).toList();

  //     return users;
  //   } catch (e) {
  //     throw Exception('Error: $e');
  //   }
  // }
  Future<List<Autogenerated>> getMovies() async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDg3ZjRjYTEyMzg3MTczMGI1ZDc4MjU4MzUzZGI5YiIsInN1YiI6IjY1OGQ1NzQ5NTVjMWY0NjMxMTM5ODgwMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hgYXmJ6kmKLMRCHJVlpxbMR8-ERfNjk-5GSI3mn-DWc';

      final response = await dio.get(
          'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
      logger.f(
          "🚀 ~ file: users_controllers.dart:29 ~ UsersController ~ Future<List<Autogenerated>>getMovies ~ response: ${response.data}");

      final List<dynamic> results = response.data['results'];

      List<Autogenerated> users =
          results.map((result) => Autogenerated.fromJson(result)).toList();

      return users;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Users> getUsersById(int id) async {
    try {
      final res = await dio.get('https://jsonplaceholder.org/posts/$id');
      final Map<String, dynamic> result = res.data;

      Users user = Users.fromJson(result);

      return user;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

final usersController = UsersController();
