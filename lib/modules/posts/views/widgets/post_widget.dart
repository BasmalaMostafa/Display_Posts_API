import 'package:flutter/material.dart';

import '../../../../shared/Components/components.dart';
import '../../../../shared/Components/constants.dart';

Widget post(post){
  return Container(
    decoration: BoxDecoration(
      color: MyColors().white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: EdgeInsets.all(Dimensions().bodyPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${post.title}',style: TextStyle(fontWeight: FontWeight.w900,
              fontSize: FontSizes().title,
              color: MyColors().blue),),
          separate(),
          Text('${post.body}',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: FontSizes().body)
          ),
          //const SizedBox(height:10),
          // Row(
          //   children: [
          //     const Text('Written By : ',style: TextStyle(fontWeight: FontWeight.bold)),
          //     Text('${users[post.userId-1]['name']}',
          //         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: MyColors().myTeal))
          //   ],
          // )
        ],
      ),
    ),
  );
}