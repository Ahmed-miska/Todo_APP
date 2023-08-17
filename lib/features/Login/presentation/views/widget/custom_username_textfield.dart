import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomUserNameTextField extends StatelessWidget {
  const CustomUserNameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
        hintStyle: TextStyle(
          color: Color(0xFF4B4747),
        ),
      ),
    );
  }
}
