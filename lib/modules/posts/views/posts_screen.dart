import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_task1/modules/posts/Repos/posts_api_impl.dart';
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
      create: (BuildContext context) =>PostsCubit(PostsInitialState,PostsAPI())..fetchPosts(),
      child: Scaffold(
        appBar: myAppBar(text: Strings().appBar),
        body: RefreshIndicator(
          onRefresh: () async{
            return await PostsCubit.get(context).fetchPosts();
          },
          child: Container(
            color: MyColors().greyLight,
            child: BlocBuilder<PostsCubit, PostsStates>(
              builder: (context, state) {
                //List users = PostsCubit.get(context).users;

                if (state is PostsLoadingState) {
                  return Container(
                    color: MyColors().white,
                    child: Center(child: CircularProgressIndicator(
                      backgroundColor: MyColors().grey,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          MyColors().myTeal
                      ),
                    )),
                  );
                } else if (state is PostsSuccessState) {
                  if(state.posts.isEmpty){
                    return Container(
                      color:MyColors().white,
                      child: Center(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height*(Dimensions().emptyHeightPadding),
                          ),
                          child: Column(
                            children:  [
                              const Image(image: AssetImage('assets/images/noposts.jpg')),
                              Text(Strings().empty,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSizes().emptyErr,
                                    color: MyColors().myBlack),),
                            ],
                          ),
                        ),
                      ),
                    );
                  }else{
                    return Padding(
                      padding: EdgeInsets.all(Dimensions().bodyPadding),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.posts.length,
                        itemBuilder: (BuildContext context, int index) =>
                            post(state.posts[index]),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: SizeBox().separator,
                        ),
                      ),
                    );
                  }
                } else if (state is PostsErrorState) {
                  return Container(
                    color: MyColors().white,
                    child: Center(
                        child:
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:Dimensions().bodyPadding,
                              vertical: MediaQuery.of(context).size.height*(Dimensions().errHeightPadding)
                          ),
                          child: Column(
                            children: [
                              const Image(image: AssetImage('assets/images/error.jpg')),
                              Text(state.error,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSizes().emptyErr,
                                    color: MyColors().myBlack),),
                            ],
                          ),
                        )
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}




