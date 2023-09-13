import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/ulits/styles.dart';

GestureDetector categoryItem(
    {required Color color, required Icon icon, required String text,required void Function()? onTap }) {
  return GestureDetector(
    onTap: () {
      
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 55.h,
          width: 45.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
          child: icon,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: Styles.textStyle12,
        )
      ],
    ),
  );
}
