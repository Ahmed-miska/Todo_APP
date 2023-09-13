import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/ulits/styles.dart';

// ignore: must_be_immutable
class CustomLoginButton extends StatefulWidget {
  CustomLoginButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.circular = false})
      : super(key: key);
  final String text;
  VoidCallback? onPressed;
  bool circular;

  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xff8875FF),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: widget.circular
              ? CircularProgressIndicator()
              : Text(
                  widget.text,
                  style: Styles.textStyle16.copyWith(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
