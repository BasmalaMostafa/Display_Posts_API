import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_task1/models/post_model.dart';
import 'package:training_task1/modules/posts/manager/Cubit/posts_states.dart';
import 'package:training_task1/shared/network/remote/dio_helper.dart';

class PostsCubit extends Cubit<PostsStates>
{
  PostsCubit(initialState) : super(PostsInitialState());
  
  static List <PostModel>posts =[];
  List users =[];

  static PostsCubit get(context) => BlocProvider.of(context);
  
  void getPosts(){
    emit(GetPostsLoadingState());

    DioHelper.getData(
        url: 'posts').then((value){
         for (var post in value.data) {
           posts.add(PostModel.fromJson(post));
         }
         if (kDebugMode) {
           print(posts);
         }
          emit(GetPostsSuccessState(posts));
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      emit(GetPostsErrorState(error.toString()));
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