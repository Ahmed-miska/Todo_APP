import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo/core/ulits/styles.dart';

class TodoItem extends StatefulWidget {
  TodoItem(
      {Key? key,
      this.onTap,
      required this.title,
      required this.desc,
      required this.prNum,
      required this.catColor,
      required this.catIcon,
      required this.catText,
      required this.time})
      : super(key: key);
  String title;
  String desc;
  Color catColor;
  String catText;
  Icon catIcon;
  String prNum;
  String time;
  void Function()? onTap;
  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
                    Container(
                      constraints: BoxConstraints(maxWidth: 100.w),
                      child: Text(
                        widget.title,
                        style: Styles.textStyle16,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
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
                        widget.time,
                        style: Styles.textStyle16.copyWith(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: widget.catColor,
                                borderRadius: BorderRadius.circular(6.r)),
                            child: Padding(
                              padding: EdgeInsets.all(5.r),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  widget.catIcon,
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    widget.catText,
                                    style: TextStyle(color: Colors.black54),
                                  ),
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
                                  Text(widget.prNum),
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
