import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/app_router.dart';
import 'package:todo/core/ulits/styles.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kEditTaskView);
      },
      child: Container(
        height: 72.h,
        width: 327.w,
        decoration: BoxDecoration(
            color: Color(0xff363636), borderRadius: BorderRadius.circular(6.r)),
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
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xff809CFF),
                                borderRadius: BorderRadius.circular(6.r)),
                            child: Padding(
                              padding: EdgeInsets.all(5.r),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.school_outlined),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text('University'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(
                                color: Color(0xff809CFF),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.r),
                              child: Row(
                                children: [
                                  Icon(Icons.flag_outlined),
                                  Text('1'),
                                ],
                              ),
                            ),
                          ),
                        ],
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
