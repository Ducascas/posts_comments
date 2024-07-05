import 'package:dio/dio.dart';
import 'package:posts_comments/src/common/config/api_url.dart';
import 'package:posts_comments/src/models/models.dart';

class PostsApi {
  final Dio dio;

  PostsApi(this.dio);

  Future<List<Post>> getPosts() async {
    final response = await dio.get('$baseUrl/$postsUrl');

    if (response.statusCode == 200) {
      var data = response.data as List;
      return data.map((posts) => Post.fromMap(posts)).toList();
    } else {
      throw Exception();
    }
  }

  Future<List<Photo>> getPhotos() async {
    final response = await dio.get('$baseUrl/$photosUrl');

    if (response.statusCode == 200) {
      var data = response.data as List;
      return data.map((photo) => Photo.fromMap(photo)).toList();
    } else {
      throw Exception();
    }
  }

  Future<List<Photo>> getComments() async {
    final response = await dio.get('$baseUrl/$photosUrl');

    if (response.statusCode == 200) {
      var data = response.data as List;
      return data.map((photo) => Photo.fromMap(photo)).toList();
    } else {
      throw Exception();
    }
  }
}
