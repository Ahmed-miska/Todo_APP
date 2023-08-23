import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/core/ulits/styles.dart';
import 'package:todo/features/home/presentation/views/choose_time_view.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime toDay = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      toDay = day;
    });
  }

  Future openTimeDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: MediaQuery.of(context).size.height * .29,
            width: MediaQuery.of(context).size.width,
            child: TimeView(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          tableCalenderFormat(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * .3, 48),
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
                  fixedSize: Size(MediaQuery.of(context).size.width * .3, 48),
                ),
                onPressed: () async {
                  print(toDay);
                  GoRouter.of(context).pop();
                  await openTimeDialog();
                },
                child: Text(
                  'Choose Time',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container tableCalenderFormat() {
    return Container(
          height: 300,
          child: TableCalendar(
            shouldFillViewport: true,
            weekendDays: [],
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle:
                  TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            ),
            daysOfWeekHeight: 15,
            locale: "en_US",
            focusedDay: toDay,
            firstDay: DateTime.utc(2010, 3, 5),
            lastDay: DateTime(2040, 3, 5),
            rowHeight: 43,
            headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                formatButtonShowsNext: false,
                decoration: BoxDecoration()),
            selectedDayPredicate: (day) => isSameDay(day, toDay),
            availableGestures: AvailableGestures.all,
            onDaySelected: _onDaySelected,
          ),
        );
  }
}
