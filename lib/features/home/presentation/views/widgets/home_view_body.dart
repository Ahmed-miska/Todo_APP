import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/ulits/styles.dart';
import 'package:todo/features/home/presentation/views/edit_task_view.dart';
import 'package:todo/features/home/presentation/views/widgets/todo_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final Stream<QuerySnapshot> stream =
      FirebaseFirestore.instance.collection('Todo').snapshots();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.filter_list),
              Text(
                'index',
                style: Styles.textStyle20,
              ),
              Image.asset('assets/images/Ellipse 13.png'),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Column(
                children: [
                  Image.asset('assets/images/Checklist-rafiki 1.png'),
                  Text(
                    'What do you want to do today?',
                    style: Styles.textStyle20,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Tap + to add your tasks',
                    style: Styles.textStyle16,
                  ),
                ],
              );
            }
            return Container(
              height: 641.h,
              width: 327.w,
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> document =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;

                  String colorString =
                      document['categoryColor']; // Color(0x12345678)
                  String valueString = colorString
                      .split('(0x')[1]
                      .split(')')[0]; // kind of hacky..
                  int value = int.parse(valueString, radix: 16);
                  Color otherColor = new Color(value);

                  String iconString = document['categoryIcon'];
                  int iconCodePoint =
                      int.parse(iconString.substring(16, 21), radix: 16);
                  IconData myIcon =
                      IconData(iconCodePoint, fontFamily: 'MaterialIcons');

                  return Column(
                    children: [
                      TodoItem(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => EditTaskView(
                                  document: document,
                                  id: snapshot.data!.docs[index].id,
                                ),
                              ));
                        },
                        title: document['title'],
                        desc: document['description'],
                        prNum: document['priorty'],
                        catColor: otherColor,
                        catIcon: Icon(myIcon),
                        catText: document['categoryText'],
                        time: document['timeDay'].substring(5, 10) +
                            ' At ' +
                            document['timeHour'] +
                            ':' +
                            document['timeMinute'] +
                            document['timeM'],
                      ),
                      SizedBox(
                        height: 16.h,
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
        // Column(
        //   children: [
        //     Image.asset('assets/images/Checklist-rafiki 1.png'),
        //     Text(
        //       'What do you want to do today?',
        //       style: Styles.textStyle20,
        //     ),
        //     SizedBox(
        //       height: h * .02,
        //     ),
        //     Text(
        //       'Tap + to add your tasks',
        //       style: Styles.textStyle16,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
