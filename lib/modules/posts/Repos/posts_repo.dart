import 'package:dartz/dartz.dart';
import 'package:training_task1/modules/posts/models/post_model.dart';

import '../../../core/Error/Failure.dart';

abstract class PostsRepo{
  Future<Either<Failure,List<PostModel>>> getAllPosts();
}