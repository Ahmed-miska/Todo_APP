import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomPasswordTextField extends StatefulWidget {
  CustomPasswordTextField({Key? key, required this.controller})
      : super(key: key);
  TextEditingController controller;
  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: passwordVisible,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password incorrect';
        } else {}
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
        ),
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
        hintText: '************',
        hintStyle: TextStyle(
          color: Color(0xFF4B4747),
        ),
      ),
    );
  }
}
