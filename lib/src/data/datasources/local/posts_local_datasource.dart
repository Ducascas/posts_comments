import 'dart:convert';

import 'package:posts_comments/src/common/constants.dart';
import 'package:posts_comments/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostsLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostsLocalDataSource({required this.sharedPreferences});

  Future<List<Post>> getPostsFromCache() async {
    final jsonPostList =
        sharedPreferences.getStringList(AppConstants.keyCachedPost);

    if (jsonPostList != null || jsonPostList!.isNotEmpty) {
      return jsonPostList
          .map((post) => Post.fromJson(json.decode(post)))
          .toList();
    } else {
      throw Exception();
    }
  }

  Future<void> savePostsToCache(List<Post> posts) async {
    final List<String> jsonPostList =
        posts.map((post) => json.encode(post.toJson())).toList();

    print('jsonPostList = =================> $jsonPostList ');

    await sharedPreferences.setStringList(
        AppConstants.keyCachedPost, jsonPostList);
  }
}

