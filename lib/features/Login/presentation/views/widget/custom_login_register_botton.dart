import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/ulits/styles.dart';

class CustomLoginWithBotton extends StatelessWidget {
  CustomLoginWithBotton(
      {Key? key,
      required this.imageLink,
      required this.text,
      required this.onPressed})
      : super(key: key);
  final String imageLink, text;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: onPressed,
      child: Container(
        height: 48.h,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.w,
                color: Color(0xFF8E7CFF),
              ),
              borderRadius: BorderRadius.circular(4)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40.h,
                child: Image.asset(imageLink),
              ),
              SizedBox(
                width: 10.h,
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
