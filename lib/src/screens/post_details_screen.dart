import 'package:flutter/material.dart';
import 'package:posts_comments/src/common/constants.dart';
import 'package:posts_comments/src/models/models.dart';
import 'package:posts_comments/src/widgets/widgets.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({
    super.key,
    required this.post,
    required this.photo,
  });

  final Post post;
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppConstants.details,
            style: theme.textTheme.titleSmall,
          ),
        ),
      ),
      body: Column(
        children: [
          HeadDetails(post: post, photo: photo),
          const SizedBox(height: 10),
          const Text(AppConstants.news),
          Text(post.body ?? ''),
          const SizedBox(height: 20),
          const Text(AppConstants.comments),
          Expanded(
            child: CommentsList(postId: post.id),
          )
        ],
      ),
    );
  }
}
