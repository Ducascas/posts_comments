part of 'posts_bloc.dart';

sealed class PostsEvent {
  const PostsEvent();
}

class LoadPostsEvent extends PostsEvent {}
