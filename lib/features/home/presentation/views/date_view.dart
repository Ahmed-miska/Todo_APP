import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/core/ulits/styles.dart';
import 'package:todo/features/home/presentation/views/choose_time_view.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/category_items.dart';

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
      dateItem.day = toDay.toString();
    });
  }

  TimeItem timeItem = TimeItem();
  DateItem dateItem = DateItem();
  Future openTimeDialog() async {
    timeItem = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: 220.h,
          width: 320.w,
          child: TimeView(),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          tableCalenderFormat(),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  fixedSize: Size(105.w, 35.h),
                ),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: Styles.textStyle12.copyWith(
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
                  Navigator.pop(context, dateItem);
                  await openTimeDialog();
                  dateItem.timeItem = timeItem;
                },
                child: Text(
                  'Choose Time',
                  style: Styles.textStyle12.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Spacer()
        ],
      ),
    );
  }

  Container tableCalenderFormat() {
    return Container(
      height: 250.h,
      width: 220.w,
      child: TableCalendar(
        shouldFillViewport: true,
        weekendDays: [],
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.w700),
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
