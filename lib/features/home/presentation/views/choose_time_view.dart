import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:todo/core/ulits/styles.dart';

class TimeView extends StatefulWidget {
  const TimeView({Key? key}) : super(key: key);

  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  var hour = 0;
  var minute = 0;
  var timeformat = "AM";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose Time',
                style: Styles.textStyle16,
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 90,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Color(0xff272727),
                    ),
                    child: NumberPicker(
                      minValue: 0,
                      maxValue: 12,
                      value: hour,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 28,
                      itemHeight: 32,
                      textStyle: TextStyle(
                        color: Colors.white.withOpacity(.1),
                        fontSize: 16,
                      ),
                      selectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      onChanged: (int value) {
                        setState(() {
                          hour = value;
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
                    height: 90,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Color(0xff272727),
                    ),
                    child: NumberPicker(
                      minValue: 0,
                      maxValue: 60,
                      value: minute,
                      zeroPad: true,
                      infiniteLoop: true,
                      itemWidth: 28,
                      itemHeight: 32,
                      textStyle: TextStyle(
                        color: Colors.white.withOpacity(.1),
                        fontSize: 16,
                      ),
                      selectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      onChanged: (int value) {
                        setState(() {
                          minute = value;
                        });
                      },
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 70,
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
                              });
                            },
                            child: Text(
                              'AM',
                              style: TextStyle(
                                fontSize: timeformat == "AM" ? 20 : 16,
                                color: timeformat == "AM"
                                    ? Colors.white
                                    : Colors.white.withOpacity(.1),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                timeformat = "PM";
                              });
                            },
                            child: Text(
                              'PM',
                              style: TextStyle(
                                fontSize: timeformat == "PM" ? 20 : 16,
                                color: timeformat == "PM"
                                    ? Colors.white
                                    : Colors.white.withOpacity(.1),
                              ),
                            ),
                          )
                        ]),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * .3, 48),
                    ),
                    onPressed: () {
                      GoRouter.of(context).pop();
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
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * .3, 48),
                    ),
                    onPressed: () async {
                      print(hour);
                      print(minute);
                      print(timeformat);

                      GoRouter.of(context).pop();
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
