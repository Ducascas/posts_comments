import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_comments/src/data/repositories/post_repository.dart';
import 'package:posts_comments/src/models/models.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository postRepository;

  PostsBloc(this.postRepository) : super(PostsLoading()) {
    on<LoadPostsEvent>(_loadPosts);
  }

  void _loadPosts(LoadPostsEvent event, Emitter<PostsState> emit) async {    

    emit(PostsLoading());
    try {
      final List<Post> posts = await postRepository.getPosts();
      final List<Photo> photos = await postRepository.getPhotos();

      emit(PostsLoaded(posts, photos));
    } catch (e) {
      emit(PostsError('Error load posts: $e'));
    }
  }
}
