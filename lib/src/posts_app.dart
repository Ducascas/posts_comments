import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_comments/src/blocs/blocs.dart';
import 'package:posts_comments/src/common/config/config.dart';
import 'package:posts_comments/src/common/theme.dart';
import 'package:posts_comments/src/screens/posts_screen.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(create: (context) => sl<PostsBloc>()),
        BlocProvider<CommentsBloc>(create: (context) => sl<CommentsBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light,
        home: const PostsScreen(),
      ),
    );
  }
}
