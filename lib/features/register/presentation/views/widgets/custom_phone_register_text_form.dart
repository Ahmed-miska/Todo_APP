import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/ulits/styles.dart';

class CustomPhoneField extends StatelessWidget {
  CustomPhoneField(
      {Key? key, this.onTap, required this.text, required this.color,required this.controller})
      : super(key: key);
  void Function()? onTap;
  String text;
  bool color;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 340.w,
      decoration: BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter phone Number',
          hintStyle: Styles.textStyle16.copyWith(color: Colors.white54),
          contentPadding: EdgeInsets.symmetric(vertical: 19, horizontal: 15),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text(
              '(+20)',
              style: Styles.textStyle16,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
              child: Text(
                text,
                style: TextStyle(
                  color: color ? Colors.grey : Color(0xff8875FF),
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
