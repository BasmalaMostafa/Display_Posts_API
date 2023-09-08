import 'package:flutter/material.dart';

import 'constants.dart';

Widget separate() =>Padding(
  padding: EdgeInsets.symmetric(vertical: Dimensions().bodyPadding),
  child: Container(
    height: 1,
    width: double.infinity,
    color: MyColors().grey,
  ),
);

myAppBar(
{
  required String text
}
    ) => AppBar(
  leading: IconButton(
    onPressed: () {  },
    icon: const Icon(Icons.arrow_back_ios_sharp),
  ),
  title: Text(text),
  backgroundColor: MyColors().myTeal,
);