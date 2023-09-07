import 'package:training_task1/models/post_model.dart';

abstract class PostsStates{}

class PostsInitialState extends PostsStates {}

class GetPostsSuccessState extends PostsStates{
  final List<PostModel> posts;

  GetPostsSuccessState(this.posts);
}

class GetPostsLoadingState extends PostsStates{}

class GetPostsErrorState extends PostsStates {
  late String error;

  GetPostsErrorState(this.error);
}

// class GetUsersSuccessState extends PostsStates{}
//
// class GetUsersLoadingState extends PostsStates{}
//
// class GetUsersErrorState extends PostsStates {
//   late String error;
//
//   GetUsersErrorState(this.error);
//}

