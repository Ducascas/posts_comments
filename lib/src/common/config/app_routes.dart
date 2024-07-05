import 'package:flutter/material.dart';
import 'package:posts_comments/src/models/models.dart';
import 'package:posts_comments/src/screens/screens.dart';

class AppRoutes {
  static navigateToDetails(BuildContext context, Post post, Photo photo) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PostDetailsScreen(post: post, photo: photo),
      ),
    );
  }
}
