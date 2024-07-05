import 'package:flutter/material.dart';
import 'package:posts_comments/src/common/constants.dart';
import 'package:posts_comments/src/models/models.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${AppConstants.name} ${comment.name?.toUpperCase()}'),
        const Text(AppConstants.comment),
        Text(comment.body.toString()),
      ],
    );
  }
}
