import 'package:flutter/material.dart';
import 'package:posts_comments/src/models/models.dart';
import 'package:posts_comments/src/widgets/photo_box.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final Photo photo;

  const PostCard({
    super.key,
    required this.post,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PhotoBox(photo: photo),
        const SizedBox(width: 10),
        Expanded(child: Text(post.body ?? '')),
      ],
    );
  }
}
