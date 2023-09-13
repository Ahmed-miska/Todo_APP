import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/ulits/styles.dart';

// ignore: must_be_immutable
class CustomUserNameTextField extends StatelessWidget {
  CustomUserNameTextField({
   required this.controller,
    Key? key,
  }) : super(key: key);
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: Color(0xff979797),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff979797),
          ),
        ),
        hintText: 'Enter your Username',
        hintStyle: Styles.textStyle16.copyWith(
          color: Color(0xFF4B4747),
        ),
      ),
    );
  }
}
