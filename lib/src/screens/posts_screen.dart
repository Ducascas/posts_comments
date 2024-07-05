import 'package:flutter/material.dart';
import 'package:posts_comments/src/common/constants.dart';
import 'package:posts_comments/src/widgets/posts_list.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppConstants.posts,
            style: theme.textTheme.titleSmall,
          ),
        ),
      ),
      body: const PostsList(),
    );
  }
}
