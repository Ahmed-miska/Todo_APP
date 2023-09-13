import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/category_items.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/category_view.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/priority_view.dart';

import '../../../../../../core/ulits/styles.dart';
import '../../date_view.dart';
import 'custom_textfield.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int result = 0;
  CategoryItems categoryItems = CategoryItems();
  DateItem dateItem = DateItem();
  TimeItem timeItem = TimeItem();
  String time = '';
  Future openDateDialog() async {
    dateItem = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: 340.h,
          width: 230.w,
          child: DatePicker(),
        ),
      ),
    );
  }

  Future openPriorityView() async {
    result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: 360.h,
          width: 250.w,
          child: PriorityView(),
        ),
      ),
    );
  }

  Future openCategoryView() async {
    categoryItems = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: 556.h,
          width: 300.w,
          child: CategoryView(),
        ),
      ),
    );
  }

  TextEditingController titleCont = TextEditingController();
  TextEditingController discCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * .02,
            ),
            Text(
              'Add Task',
              style: Styles.textStyle20,
            ),
            SizedBox(
              height: h * .03,
            ),
            CustomTextField(
              controller: titleCont,
              text: 'Add Title',
            ),
            SizedBox(
              height: h * .04,
            ),
            CustomTextField(
              controller: discCont,
              text: 'Description',
            ),
            SizedBox(
              height: h * .04,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    openDateDialog();
                  },
                  icon: Icon(Icons.timer_outlined),
                ),
                IconButton(
                  onPressed: () async {
                    openCategoryView();
                  },
                  icon: Icon(Icons.sell_outlined),
                ),
                IconButton(
                  onPressed: () async {
                    openPriorityView();
                  },
                  icon: Icon(Icons.flag_outlined),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('Todo').add({
                      'title': titleCont.text,
                      'description': discCont.text,
                      'timeDay': dateItem.day.toString(),
                      'timeHour': dateItem.timeItem!.hour.toString(),
                      'timeMinute': dateItem.timeItem!.minute.toString(),
                      'timeM': dateItem.timeItem!.m.toString(),
                      'priorty': result,
                      'categoryText': categoryItems.text,
                      'categoryColor': categoryItems.color.toString(),
                      'categoryIcon': categoryItems.icon.toString(),
                    });
                    titleCont.clear();
                    discCont.clear();
                    
                  },
                  icon: Icon(Icons.send_outlined),
                  color: Color(0xff8687E7),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            )
          ],
        ),
      ),
    );
  }
}
