import 'package:flutter/material.dart';
import 'package:to_do_app/shared/constance.dart';

class customTextField extends StatelessWidget {
  const customTextField({
    Key? key,
    this.validate,
    required this.controller,
    required this.hintText,
    required this.type,
    this.onChange,
    this.onsubmmited,
    required this.action,
    this.suffixIcon,
    required this.obscureText,
  }) : super(key: key);

  final String? Function(String?)? validate;
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText ;
  final TextInputType type;
  final TextInputAction action;
  final Function(String?)? onChange;
  final Function(String?)? onsubmmited;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.height;
    return Container(
      color: colorBackGround,
      height: mediaQuery*.073,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        validator: validate,
        textInputAction: action,
        controller: controller,
        decoration: InputDecoration(
         // focusColor: Colors.yellow,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5)
          ),

          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(5)
          ),
        ),
        keyboardType:type,

        obscureText:obscureText ,
        onFieldSubmitted: onsubmmited,
        onChanged: onChange,
      ),
    );
  }
}
