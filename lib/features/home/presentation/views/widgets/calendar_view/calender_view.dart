import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:todo/core/ulits/styles.dart';
import 'package:todo/features/home/presentation/views/widgets/todo_item.dart';

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
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .06,
          ),
          Text(
            'Calendar',
            style: Styles.textStyle20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Container(
            color: Color(0xff363636),
            child: TableCalendar(
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
            padding: const EdgeInsets.all(24),
            child: Container(
              height: 80,
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
                      height: 48,
                      width: MediaQuery.of(context).size.width * .3,
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
                          style:
                              Styles.textStyle16.copyWith(color: Colors.white),
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
                      height: 48,
                      width: MediaQuery.of(context).size.width * .3,
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
                          style:
                              Styles.textStyle16.copyWith(color: Colors.white),
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
    );
  }

  Container calendarListView(BuildContext context, {required String text}) {
    return text == 'Today'
        ? Container(
            height: MediaQuery.of(context).size.height * .44,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    TodoItem(),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height * .44,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                          color: Color(0xff363636),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.circle_outlined,
                                  size: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Do Math Homework',
                                  style: Styles.textStyle16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Today At 16:45',
                                      style: Styles.textStyle16
                                          .copyWith(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
            ),
          );
  }
}
