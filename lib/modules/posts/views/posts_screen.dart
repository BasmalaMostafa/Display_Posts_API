import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
      child: BlocConsumer<PostsCubit,PostsStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          List posts = PostsCubit.get(context).posts;
          List users = PostsCubit.get(context).users;

          return Scaffold(
            appBar: myAppBar(
                text: 'Popular Posts'
            ),
            body:ConditionalBuilder(
              condition: (state is !GetPostsLoadingState && users.isNotEmpty),
              builder: (BuildContext context) =>Container(
                color: greyLight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount:posts.length,
                    itemBuilder: (BuildContext context,int index) => post(posts[index],users),
                    separatorBuilder: (BuildContext context, int index) =>const SizedBox(height: 15,),
                  ),
                ),
              ),
              fallback: (BuildContext context) =>  Center(child: CircularProgressIndicator(
                backgroundColor: greyLight,
                valueColor: AlwaysStoppedAnimation<Color>(
                  myOrange
                ),),),
            ) ,
          );
        },
      ),
    );
  }
}















