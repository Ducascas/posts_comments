import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_comments/src/blocs/blocs.dart';
import 'package:posts_comments/src/common/config/network_info.dart';
import 'package:posts_comments/src/data/datasources/datasources.dart';
import 'package:posts_comments/src/data/repositories/post_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => PostsBloc(sl<PostRepository>()));
  sl.registerFactory(() => CommentsBloc(sl<PostRepository>()));

  //Repository
  sl.registerLazySingleton<PostRepository>(
    () => PostRepository(
      postsApi: sl(),
      commentsApi: sl(),
      localPostsDataSource: sl(),
      localCommentsDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Datasource
  sl.registerLazySingleton<PostsApi>(() => PostsApi(sl()));
  sl.registerLazySingleton<CommentsApi>(() => CommentsApi(sl()));

  sl.registerLazySingleton<PostsLocalDataSource>(
      () => PostsLocalDataSource(sharedPreferences: sl()));
  sl.registerLazySingleton<CommentsLocalDataSource>(
      () => CommentsLocalDataSource(sharedPreferences: sl()));

  // Common
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
