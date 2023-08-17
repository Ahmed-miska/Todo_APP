import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/ulits/styles.dart';

class CustomLoginWithBotton extends StatelessWidget {
  const CustomLoginWithBotton(
      {Key? key, required this.imageLink, required this.text})
      : super(key: key);
  final String imageLink, text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {},
      child: Container(
        height: 48,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Color(0xFF8E7CFF),
              ),
              borderRadius: BorderRadius.circular(4)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageLink),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
