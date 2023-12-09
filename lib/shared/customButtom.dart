import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:to_do_app/shared/constance.dart';

class customButtom extends StatelessWidget {
   customButtom({Key? key,
    required this.text,
    required this.function,
    required this.width,
     required this.color_buttom,
    //required this.width
  }) : super(key: key);
  final String text;
  final Function()? function;
  final double width;
  final Color color_buttom ;
 // final Double width;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      minWidth: width,
      height: 50,
      color: color_buttom,
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
