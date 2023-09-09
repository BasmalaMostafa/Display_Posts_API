import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_task1/modules/posts/Repos/posts_api_impl.dart';
import 'package:training_task1/modules/posts/Repos/posts_repo.dart';
import 'package:training_task1/modules/posts/manager/Cubit/posts_states.dart';
import 'package:training_task1/shared/network/remote/dio_helper.dart';

import '../../../../core/Error/Failure.dart';
import '../../models/post_model.dart';

class PostsCubit extends Cubit<PostsStates>
{
  PostsCubit(initialState,this.postsRepo) : super(PostsInitialState());
  
  late var posts;
  final PostsRepo postsRepo;
  //List users =[];

  static PostsCubit get(context) => BlocProvider.of(context);
  
  Future<void> fetchPosts() async {
    emit(PostsLoadingState());

    posts= await postsRepo.getAllPosts();

    posts.fold(
          (failure) => emit(PostsErrorState(failure.errMessage)),
          (posts) {
            emit(PostsSuccessState(posts));
      },
    );
  }

  // void getUsers() {
  //   emit(GetUsersLoadingState());
  //
  //   DioHelper.getData(
  //       url: 'users').then((value) {
  //     users = value.data;
  //
  //     emit(GetUsersSuccessState());
  //   }).catchError((error){
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //     emit(GetUsersErrorState(error.toString()));
  //   });
  // }

}