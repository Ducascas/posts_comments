import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_comments/src/data/repositories/post_repository.dart';
import 'package:posts_comments/src/models/models.dart';

part 'comments_event.dart';

part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final PostRepository postRepository;

  CommentsBloc(this.postRepository) : super(CommentsLoading()) {
    on<LoadCommentsEvent>(_loadComments);
  }

  void _loadComments(
      LoadCommentsEvent event, Emitter<CommentsState> emit) async {
    emit(CommentsLoading());
    try {
      final List<Comment> comments = await postRepository.getComments();

      emit(CommentsLoaded(comments));
    } catch (e) {
      emit(CommentsError('Error load comments: $e'));
    }
  }
}
