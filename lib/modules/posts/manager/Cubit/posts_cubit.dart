import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_task1/models/post_model.dart';
import 'package:training_task1/modules/posts/manager/Cubit/posts_states.dart';
import 'package:training_task1/shared/network/remote/dio_helper.dart';

import '../../../../core/Error/Failure.dart';

class PostsCubit extends Cubit<PostsStates>
{
  PostsCubit(initialState) : super(PostsInitialState());
  
  static List <PostModel>posts =[];
  List users =[];

  static PostsCubit get(context) => BlocProvider.of(context);
  
  Future<void> getPosts() async {
    emit(PostsLoadingState());

    await DioHelper.getData(
        url: 'posts').then((value){
         for (var post in value.data) {
           posts.add(PostModel.fromJson(post));
         }
         if (kDebugMode) {
           print(posts);
         }
          emit(PostsSuccessState(posts));
    }).catchError((error){

      if (kDebugMode) {
        print(error.toString());
      }
      ServerFailure failure;
      if(error is DioException){
        failure= ServerFailure.fromDioException(error);
      }else{
        failure= ServerFailure(errMessage: error.toString());

      }

      emit(PostsErrorState(failure.errMessage));
    });
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