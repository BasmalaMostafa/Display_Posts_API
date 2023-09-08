import 'package:training_task1/models/post_model.dart';

abstract class PostsStates{}

class PostsInitialState extends PostsStates {}

class PostsSuccessState extends PostsStates{
  final List<PostModel> posts;

  PostsSuccessState(this.posts);
}

class PostsLoadingState extends PostsStates{}

class PostsErrorState extends PostsStates {
  late String error;

  PostsErrorState(this.error);
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

