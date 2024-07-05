import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_comments/src/blocs/blocs.dart';
import 'package:posts_comments/src/common/config/app_routes.dart';
import 'package:posts_comments/src/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(LoadPostsEvent());
  }

  @override
  void dispose() {
    context.read<PostsBloc>().postRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postsBloc = context.read<PostsBloc>();

    return BlocBuilder<PostsBloc, PostsState>(
      bloc: postsBloc,
      builder: (context, state) {
        if (state is PostsError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is PostsLoaded) {
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemCount: state.posts.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => AppRoutes.navigateToDetails(
                    context, state.posts[index], state.photos[index]),
                child: PostCard(
                  post: state.posts[index],
                  photo: state.photos[index],
                ),
              );
            },
          );
        }
        return Shimmer.fromColors(
          baseColor: Colors.indigo,
          highlightColor: Colors.white12,
          child: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemCount: 6,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return const EmptyLoadRow();
            },
          ),
        );
      },
    );
  }
}
