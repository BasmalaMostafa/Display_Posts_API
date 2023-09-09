import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:training_task1/modules/posts/Repos/posts_repo.dart';
import 'package:training_task1/modules/posts/models/post_model.dart';

import '../../../core/Error/Failure.dart';
import '../../../shared/network/remote/dio_helper.dart';

class PostsAPI extends PostsRepo {
  @override
  Future<Either<Failure,List<PostModel>>> getAllPosts() async {
    // TODO: implement getAllPosts

    List<PostModel> posts=[];
    late bool flag;
    late ServerFailure failure;

      await DioHelper.getData(
          url: 'posts').then((value) {
        for (var post in value.data) {
          posts.add(PostModel.fromJson(post));
        }
        if (kDebugMode) {
          print(posts);
        }
        flag=true;
        // return right(posts);
      }).catchError((error) {
        if (kDebugMode) {
          print(error.toString());
        }
        if (error is DioException) {
          failure = ServerFailure.fromDioException(error);
        } else {
          failure = ServerFailure(errMessage: error.toString());
        }
        flag=false;
      });

      if(flag==true){
        return right(posts);
      }else{
        return left(failure);
      }
  }
}







