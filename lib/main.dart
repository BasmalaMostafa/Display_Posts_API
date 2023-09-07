import 'package:flutter/material.dart';
import 'package:training_task1/shared/network/remote/dio_helper.dart';

import 'modules/posts/views/posts_screen.dart';



void main() {
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostsScreen(),
    );
  }
}


