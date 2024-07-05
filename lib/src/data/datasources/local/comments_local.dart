import 'dart:convert';

import 'package:posts_comments/src/common/constants.dart';
import 'package:posts_comments/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentsLocalDataSource {
  final SharedPreferences sharedPreferences;

  CommentsLocalDataSource({required this.sharedPreferences});

  Future<List<Comment>> getCommentsFromCache() async {
    final jsonCommentList =
        sharedPreferences.getStringList(AppConstants.keyCachedComment);

    if (jsonCommentList != null || jsonCommentList!.isNotEmpty) {
      return jsonCommentList
          .map((comment) => Comment.fromJson(json.decode(comment)))
          .toList();
    } else {
      throw Exception();
    }
  }

  Future<void> saveCommentsToCache(List<Comment> comments) async {
    final List<String> jsonCommentList =
        comments.map((comment) => json.encode(comment.toJson())).toList();

    print('jsonCommentList = =================> $jsonCommentList ');

    await sharedPreferences.setStringList(
        AppConstants.keyCachedComment, jsonCommentList);
  }
}
