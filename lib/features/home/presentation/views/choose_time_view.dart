import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:todo/core/ulits/styles.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/category_items.dart';

class TimeView extends StatefulWidget {
  const TimeView({Key? key}) : super(key: key);

  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  var hour = 0;
  var minute = 0;
  var timeformat = "AM";
  TimeItem timeItem = TimeItem();
  DateItem dateItem = DateItem();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
        ),
        child: Container(
          height: 200.h,
          child: Column(
            children: [
              Text(
                'Choose Time',
                style: Styles.textStyle16,
              ),
              Divider(
                thickness: 2,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Color(0xff272727),
                    ),
                    child: NumberPicker(
                      minValue: 0,
                      maxValue: 12,
                      value: hour,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 25.w,
                      itemHeight: 20.h,
                      textStyle: TextStyle(
                        color: Colors.white.withOpacity(.1),
                        fontSize: 10.sp,
                      ),
                      selectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                      onChanged: (int value) {
                        setState(() {
                          hour = value;
                          timeItem.hour = value.toString();
                        });
                      },
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Text(
                    ':',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 60.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Color(0xff272727),
                    ),
                    child: NumberPicker(
                      minValue: 0,
                      maxValue: 60,
                      value: minute,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 25.w,
                      itemHeight: 20.h,
                      textStyle: TextStyle(
                        color: Colors.white.withOpacity(.1),
                        fontSize: 10.sp,
                      ),
                      selectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                      onChanged: (int value) {
                        setState(() {
                          minute = value;
                          timeItem.minute = value.toString();
                        });
                      },
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Container(
                    height: 60.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Color(0xff272727),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeformat = "AM";
                              timeItem.m = "AM";
                            });
                          },
                          child: Text(
                            'AM',
                            style: TextStyle(
                              fontSize: timeformat == "AM" ? 14.sp : 10.sp,
                              color: timeformat == "AM"
                                  ? Colors.white
                                  : Colors.white.withOpacity(.1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              timeformat = "PM";
                              timeItem.m = "PM";
                            });
                          },
                          child: Text(
                            'PM',
                            style: TextStyle(
                              fontSize: timeformat == "PM" ? 14.sp : 10.sp,
                              color: timeformat == "PM"
                                  ? Colors.white
                                  : Colors.white.withOpacity(.1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size(107.w, 35.h),
                    ),
                    onPressed: () {
                      Navigator.pop(context, dateItem);
                    },
                    child: Text(
                      'Cancel',
                      style: Styles.textStyle16.copyWith(
                        color: Color(0xff8687E7),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff8687E7),
                      fixedSize: Size(107.w, 35.h),
                    ),
                    onPressed: () async {
                      // print(timeItem.hour);
                      // print(timeItem.minute);
                      // print(timeItem.m);
                      Navigator.pop(context, timeItem);
                      setState(() {});
                    },
                    child: Text(
                      'Save',
                      style: Styles.textStyle16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
