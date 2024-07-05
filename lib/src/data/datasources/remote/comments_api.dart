import 'package:dio/dio.dart';
import 'package:posts_comments/src/common/config/api_url.dart';
import 'package:posts_comments/src/models/models.dart';

class CommentsApi {
  final Dio dio;

  CommentsApi(this.dio);

  Future<List<Comment>> getComments() async {
    final response = await dio.get('$baseUrl/$commentsUrl');

    if (response.statusCode == 200) {
      var data = response.data as List;
      return data.map((comments) => Comment.fromMap(comments)).toList();
    } else {
      throw Exception();
    }
  }


}
