import 'package:flutter/material.dart';
import 'package:posts_comments/src/common/config/di.dart';
import 'package:posts_comments/src/posts_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const PostsApp());
}
