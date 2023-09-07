import 'package:flutter/material.dart';

import 'constants.dart';

Widget separate() =>Padding(
  padding: const EdgeInsets.symmetric(vertical: 10.0),
  child: Container(
    height: 1,
    width: double.infinity,
    color: grey,
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
  backgroundColor: myOrange,
);