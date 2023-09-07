abstract class PostsStates{}

class PostsInitialState extends PostsStates {}

class GetPostsSuccessState extends PostsStates{}

class GetPostsLoadingState extends PostsStates{}

class GetPostsErrorState extends PostsStates {
  late String error;

  GetPostsErrorState(this.error);
}

class GetUsersSuccessState extends PostsStates{}

class GetUsersLoadingState extends PostsStates{}

class GetUsersErrorState extends PostsStates {
  late String error;

  GetUsersErrorState(this.error);
}

