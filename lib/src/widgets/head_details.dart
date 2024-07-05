import 'package:flutter/material.dart';
import 'package:posts_comments/src/models/models.dart';
import 'package:posts_comments/src/widgets/widgets.dart';

class HeadDetails extends StatelessWidget {
  const HeadDetails({super.key, required this.post, required this.photo});

  final Post post;
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 125),
      margin: const EdgeInsets.all(10),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PhotoBox(photo: photo),
          Text(post.title ?? ''),
        ],
      ),
    );
  }
}
