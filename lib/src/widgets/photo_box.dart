import 'package:flutter/material.dart';
import 'package:posts_comments/src/models/models.dart';

class PhotoBox extends StatelessWidget {
  const PhotoBox({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Image.network(
        photo.url!,
        fit: BoxFit.fill,
      ),
    );
  }
}
