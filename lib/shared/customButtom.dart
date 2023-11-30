import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:to_do_app/shared/constance.dart';

class customButtom extends StatelessWidget {
  const customButtom({Key? key,
    required this.text,
    required this.function,
    required this.width,
    //required this.width
  }) : super(key: key);
  final String text;
  final Function()? function;
  final double width;
 // final Double width;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: 50,
      color: colorButtom,
      child:
      Text(
        '$text',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 17),
      ),
      onPressed: function,
    );
  }
}
