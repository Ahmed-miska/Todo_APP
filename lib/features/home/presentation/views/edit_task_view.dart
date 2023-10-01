import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/home/presentation/views/widgets/edit_Task_title.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/category_items.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/category_view.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/priority_view.dart';

import '../../../../core/ulits/styles.dart';
import 'date_view.dart';
import 'delete_view.dart';

class EditTaskView extends StatefulWidget {
  EditTaskView({Key? key, required this.document, required this.id})
      : super(key: key);
  final Map<String, dynamic> document;
  final String id;
  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  TextEditingController? titleCont;
  TextEditingController? discCont;
  String? time;
  IconData? myIcon;
  String? iconString;
  String? catText;
  String? prNumb;
  String? catcolor;
  String? day;
  String? hour;
  String? minute;
  String? m;

  Color? otherColor;
  EditTitle editTitle = EditTitle();
  DateItem dateItem = DateItem();
  TimeItem timeItem = TimeItem();
  int? prrnum;
  CategoryItems categoryItems = CategoryItems();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dateItem.day = widget.document['timeDay'].toString();

    timeItem.hour = widget.document['timeHour'].toString();
    timeItem.minute = widget.document['timeMinute'].toString();
    timeItem.m = widget.document['timeM'].toString();
    dateItem.timeItem = timeItem;
    editTitle.titcont = TextEditingController(text: widget.document['title']);
    editTitle.discont =
        TextEditingController(text: widget.document['description']);
    day = widget.document['timeDay'].substring(5, 10);
    hour = widget.document['timeHour'].toString();
    minute = widget.document['timeMinute'].toString();
    m = widget.document['timeM'].toString();
    time = (day! + ' At ' + hour! + ':' + minute! + m!).toString();

    iconString = widget.document['categoryIcon'].toString();
    rIcon();
    catcolor = widget.document['categoryColor'].toString();
    rColor();
    catText = widget.document['categoryText'].toString();

    prNumb = widget.document['priorty'].toString();
  }

  @override
  Widget build(BuildContext context) {
    Future openEditTaskView() async {
      editTitle = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * .31,
                minWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height * .45),
            child: EditTaskTitel(
              disc: editTitle.discont.text,
              title: editTitle.titcont.text,
            ),
          ),
        ),
      );
    }

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
      prrnum = await showDialog(
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

    Future openDeleteView() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: 200.h,
              width: 300.w,
              child: DeleteView(),
            ),
          ),
        );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 90.h,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                    maxWidth: 150.w, minWidth: 150.w),
                                child: Text(
                                  editTitle.titcont.text,
                                  style: Styles.textStyle16,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 100.w,
                              ),
                              IconButton(
                                onPressed: () async {
                                  await openEditTaskView();
                                },
                                icon: Icon(Icons.edit_note),
                              ),
                            ],
                          ),
                          Container(
                            width: 280.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 250.w),
                                  child: Text(
                                    editTitle.discont.text,
                                    style: Styles.textStyle16
                                        .copyWith(color: Colors.grey),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Task Time :',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    await openDateDialog();
                    setState(() {
                      day = dateItem.day!.substring(5, 10);
                      hour = dateItem.timeItem!.hour.toString();
                      minute = dateItem.timeItem!.minute.toString();
                      m = dateItem.timeItem!.m.toString();
                    });
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        (day! + ' At ' + hour! + ':' + minute! + m!).toString(),
                        // day!.toString() +
                        //     ' At ' +
                        //     hour!.toString() +
                        //     ':' +
                        //     minute!.toString() +
                        //     m!.toString(),
                        style: Styles.textStyle12.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Row(
              children: [
                Icon(
                  Icons.sell_outlined,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Task Category :',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    await openCategoryView();
                    setState(() {
                      catText = categoryItems.text;
                      myIcon = categoryItems.icon.icon;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Icon(
                            // Icons.abc,
                            myIcon,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            catText!,
                            style: Styles.textStyle12
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Row(
              children: [
                Icon(
                  Icons.flag_outlined,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Task Priority :',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    await openPriorityView();
                    setState(() {
                      prNumb = prrnum.toString();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        prNumb!,
                        style: Styles.textStyle12.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Row(
              children: [
                Icon(
                  Icons.subject,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Sub - Task',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Add Sub - Task',
                      style: Styles.textStyle12.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            GestureDetector(
              onTap: () async {
                await openDeleteView();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.delete_forever_outlined,
                    size: 24,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Delete Task',
                    style: Styles.textStyle16.copyWith(color: Colors.red),
                  )
                ],
              ),
            ),
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff8687E7),
                fixedSize: Size(320.w, 48.h),
              ),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('Todo')
                    .doc(widget.id)
                    .update({
                  'title': editTitle.titcont.text,
                  'description': editTitle.discont.text,
                  'timeDay': dateItem.day.toString(),
                  'timeHour': hour,
                  'timeMinute': minute,
                  'timeM': m,
                  'priorty': prNumb,
                  'categoryText': catText,
                  'categoryColor': categoryItems.color.toString(),
                  'categoryIcon': Icon(myIcon).toString(),
                });
                GoRouter.of(context).pop();
              },
              child: Text(
                'Edit Task',
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void rIcon() {
    int iconCodePoint = int.parse(iconString!.substring(16, 21), radix: 16);
    myIcon = IconData(iconCodePoint, fontFamily: 'MaterialIcons');
  }

  void rColor() {
    // Color(0x12345678)
    String valueString =
        catcolor!.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    otherColor = new Color(value);
  }
}
