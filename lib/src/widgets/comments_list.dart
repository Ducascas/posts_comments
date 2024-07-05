import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_comments/src/blocs/blocs.dart';

import 'comment_card.dart';

class CommentsList extends StatefulWidget {
  const CommentsList({super.key, this.postId});

  final int? postId;

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  @override
  void initState() {
    super.initState();
    context.read<CommentsBloc>().add(LoadCommentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final commentsBloc = context.read<CommentsBloc>();

    return BlocBuilder<CommentsBloc, CommentsState>(
      bloc: commentsBloc,
      builder: (context, state) {
        if (state is CommentsError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is CommentsLoaded) {
          final listComment = state.comments
              .where((comment) => comment.postId == widget.postId)
              .toList();

          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: listComment.length,
            separatorBuilder: (context, _) => const Divider(height: 20),
            itemBuilder: (context, index) =>
                CommentCard(comment: listComment[index]),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
