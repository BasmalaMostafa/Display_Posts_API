import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_task1/modules/posts/views/widgets/post_widget.dart';
import 'package:training_task1/shared/Components/constants.dart';

import '../../../core/Error/Failure.dart';
import '../../../shared/Components/components.dart';
import '../manager/Cubit/posts_cubit.dart';
import '../manager/Cubit/posts_states.dart';


class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>PostsCubit(PostsInitialState)..getPosts(),
      child: Scaffold(
        appBar: myAppBar(text: 'Popular Posts'),
        body: Container(
          color: greyLight,
          child: BlocBuilder<PostsCubit, PostsStates>(
            builder: (context, state) {
              //List users = PostsCubit.get(context).users;

              if (state is GetPostsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetPostsSuccessState) {
                if(state.posts.isEmpty){
                  return Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text('NO POSTS YET!',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.teal),),
                    ),
                  );
                }else{
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.posts.length,
                      itemBuilder: (BuildContext context, int index) =>
                          post(state.posts[index]),
                      separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        height: 15,
                      ),
                    ),
                  );
                }
              } else if (state is GetPostsErrorState) {
                if(state.error is DioException){
                  String error=(ServerFailure.fromDioException(state.error as DioException)).toString();
                  return Container(
                    color: Colors.white,
                    child: Center(
                        child:
                        Text(error,
                          style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30) ,)
                    ),
                  );
                }else{
                  String error=(ServerFailure(errMessage: state.error.toString())).toString();
                  return  Container(
                    color: Colors.white,
                    child: Center(
                        child:
                        Text(error,
                          style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30) ,)
                    ),
                  );
                }
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}




