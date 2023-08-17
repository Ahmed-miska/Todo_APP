import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/ulits/styles.dart';

class CustomNextBotton extends StatelessWidget {
  const CustomNextBotton({
    Key? key,
    required this.onpressed,
    required this.text,
    required this.width,
  }) : super(key: key);

  final void Function()? onpressed;
  final String text;
  final double width;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Container(
        height: 48,
        width: width,
        decoration: BoxDecoration(
          color: Color(0xff8875FF),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
