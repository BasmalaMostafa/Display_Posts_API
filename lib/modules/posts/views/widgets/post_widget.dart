import 'package:flutter/material.dart';

import '../../../../shared/Components/components.dart';
import '../../../../shared/Components/constants.dart';

Widget post(post,users){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${post.title}',style: TextStyle(fontWeight: FontWeight.w900,
              fontSize: 20,
              color: blue),),
          separate(),
          Text('${post.body}',
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)
          ),
          const SizedBox(height:10),
          Row(
            children: [
              const Text('Written By : ',style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${users[post.userId-1]['name']}',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: myOrange))
            ],
          )
        ],
      ),
    ),
  );
}