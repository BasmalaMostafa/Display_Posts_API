import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_task1/modules/posts/views/widgets/post_widget.dart';
import 'package:training_task1/shared/Components/constants.dart';

import '../../../shared/Components/components.dart';
import '../manager/Cubit/posts_cubit.dart';
import '../manager/Cubit/posts_states.dart';


class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>PostsCubit(PostsInitialState)..getPosts()..getUsers(),
      child: Scaffold(
        appBar: myAppBar(text: 'Popular Posts'),
        body: PostsCubit.posts.isEmpty?Container(
          color: greyLight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<PostsCubit, PostsStates>(
              builder: (context, state) {
                List users = PostsCubit.get(context).users;

                if (state is GetPostsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetPostsSuccessState) {
                    return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.posts.length,
                      itemBuilder: (BuildContext context, int index) =>
                          post(state.posts[index],users),
                      separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        height: 15,
                      ),
                    );
                } else if (state is GetPostsErrorState) {
                  return Center(child: Text(state.error));
                } else {
                  return Container();
                }
              },
            ),
          ),
        ):Container(
          color: Colors.white,
          child: const Center(
            child: Text('NO POSTS YET!',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 30,color: Colors.teal),),
          ),
        ),
      ),
    );
  }
}




