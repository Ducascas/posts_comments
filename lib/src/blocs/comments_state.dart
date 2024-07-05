part of 'comments_bloc.dart';

sealed class CommentsState {}

final class CommentsLoading extends CommentsState {}

final class CommentsLoaded extends CommentsState {
  final List<Comment> comments;

  CommentsLoaded(this.comments);
}

final class CommentsError extends CommentsState {
  final String message;

  CommentsError(this.message);
}
