import 'dart:developer';

import 'package:posts_comments/src/common/config/network_info.dart';
import 'package:posts_comments/src/data/datasources/datasources.dart';
import 'package:posts_comments/src/models/models.dart';
import 'package:rxdart/rxdart.dart';

class PostRepository {
  final PostsApi postsApi;
  final CommentsApi commentsApi;
  final PostsLocalDataSource localPostsDataSource;
  final CommentsLocalDataSource localCommentsDataSource;
  final NetworkInfo networkInfo;

  PostRepository({
    required this.postsApi,
    required this.commentsApi,
    required this.localPostsDataSource,
    required this.localCommentsDataSource,
    required this.networkInfo,
  });

  final BehaviorSubject<List<Post>> _listPosts = BehaviorSubject<List<Post>>();
  final BehaviorSubject<List<Comment>> _listComments =
      BehaviorSubject<List<Comment>>();

  List<Post> get posts => _listPosts.value;

  List<Comment> get comments => _listComments.value;
  final List<Photo> photos = [];

  void dispose() {
    _listPosts.close();
    _listComments.close();
  }

  getPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final listPosts = await postsApi.getPosts();
        localPostsDataSource.savePostsToCache(listPosts);
        _listPosts.add(listPosts);
        return listPosts;
      } catch (error) {
        log('Error loading posts: $error');
        throw Exception();
      }
    } else {
      try {
        final localPosts = await localPostsDataSource.getPostsFromCache();
        return localPosts;
      } catch (error) {
        log('Error loading local posts: $error');
        throw Exception();
      }
    }
  }

  getPhotos() async {
    try {
      final listPhotos = await postsApi.getPhotos();
      return listPhotos;
    } catch (error) {
      log('Error loading listPhotos: $error');
      throw Exception();
    }
  }

  getComments() async {
    if (await networkInfo.isConnected) {
      try {
        final listComments = await commentsApi.getComments();
        localCommentsDataSource.saveCommentsToCache(listComments);
        _listComments.add(listComments);
        return listComments;
      } catch (error) {
        log('Error loading listComments: $error');
        throw Exception();
      }
    } else {
      try {
        final localComments =
            await localCommentsDataSource.getCommentsFromCache();
        return localComments;
      } catch (error) {
        log('Error loading local comments: $error');
        throw Exception();
      }
    }
  }
}
