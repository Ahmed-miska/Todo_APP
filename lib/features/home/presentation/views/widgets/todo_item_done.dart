import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/ulits/styles.dart';

class TodoItemDone extends StatelessWidget {
  const TodoItemDone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 72.h,
        width: 327.w,
        decoration: BoxDecoration(
          color: Color(0xff363636),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10.h,
            ),
            Icon(
              Icons.circle_outlined,
              size: 16.r,
            ),
            SizedBox(
              width: 12.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      'Do Math Homework',
                      style: Styles.textStyle16,
                    ),
                    SizedBox(
                      width: 140.h,
                    ),
                  ],
                ),
                Container(
                  width: 280.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today At 16:45',
                        style: Styles.textStyle16.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
