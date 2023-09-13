import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:todo/core/ulits/styles.dart';
import 'package:todo/features/home/presentation/views/widgets/todo_item.dart';
import 'package:todo/features/home/presentation/views/widgets/todo_item_done.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  String text = 'Today';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 13.h,
            ),
            Text(
              'Calendar',
              style: Styles.textStyle20,
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 140.h,
              color: Color(0xff363636),
              child: TableCalendar(
                rowHeight: 45.h,
                daysOfWeekHeight: 20.h,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    today = selectedDay;
                    print(today);
                  });
                },
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime(2020, 1),
                lastDay: DateTime(2030, 1),
                calendarFormat: CalendarFormat.week,
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.white),
                  weekendStyle: TextStyle(color: Colors.red),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.r),
              child: Container(
                height: 80.h,
                color: Color(0xff4C4C4C),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          text = 'Today';
                        });
                      },
                      child: Container(
                        height: 49.h,
                        width: 137.w,
                        decoration: ShapeDecoration(
                          color: text == 'Today'
                              ? Color(0xff8687E7)
                              : Color(0xff4C4C4C),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Center(
                          child: Text(
                            'Today',
                            style: Styles.textStyle16
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          text = 'Completed';
                        });
                      },
                      child: Container(
                        height: 49.h,
                        width: 137.w,
                        decoration: ShapeDecoration(
                          color: text == 'Completed'
                              ? Color(0xff8687E7)
                              : Color(0xff4C4C4C),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Center(
                          child: Text(
                            'Completed',
                            style: Styles.textStyle16
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    )
                  ],
                ),
              ),
            ),
            calendarListView(context, text: text)
          ],
        ),
      ),
    );
  }

  Container calendarListView(BuildContext context, {required String text}) {
    return text == 'Today'
        ? Container(
            height: 385.h,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    TodoItem(),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                );
              },
            ),
          )
        : Container(
            height: 385.h,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    TodoItemDone(),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                );
              },
            ),
          );
  }
}
