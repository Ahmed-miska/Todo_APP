import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/styles.dart';

class PriorityView extends StatefulWidget {
  const PriorityView({
    Key? key,
  }) : super(key: key);

  @override
  State<PriorityView> createState() => _PriorityViewState();
}

class _PriorityViewState extends State<PriorityView> {
  var choosenPriority = 1;

  var color = Color(0xff272727);
  List<Color> colors = [
    Color(0xff272727),
    Color(0xff272727),
    Color(0xff272727),
    Color(0xff272727),
    Color(0xff272727),
    Color(0xff272727),
    Color(0xff272727),
    Color(0xff272727),
    Color(0xff272727),
    Color(0xff272727),
    Color(0xff272727),
    Color(0xff272727)
  ];

  void reColor() {
    for (var i = 0; i < 12; i++) {
      colors[i] = Color(0xff272727);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Task Priorty',
              style: Styles.textStyle16,
            ),
            Divider(
              thickness: 2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        xX(choosen: 1),
                        SizedBox(
                          height: 10.h,
                        ),
                        xX(choosen: 5),
                        SizedBox(
                          height: 10.h,
                        ),
                        xX(choosen: 9),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        xX(choosen: 2),
                        SizedBox(
                          height: 10.h,
                        ),
                        xX(choosen: 6),
                        SizedBox(
                          height: 10.h,
                        ),
                        xX(choosen: 10),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        xX(choosen: 3),
                        SizedBox(
                          height: 10.h,
                        ),
                        xX(choosen: 7),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        xX(choosen: 4),
                        SizedBox(
                          height: 10.h,
                        ),
                        xX(choosen: 8),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: Size(107.w, 35.h),
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
                    fixedSize: Size(107.w, 35.h),
                  ),
                  onPressed: () async {
                    print(choosenPriority);
                    Navigator.pop(context, choosenPriority);
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
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector xX({required int choosen}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          reColor();
          colors[choosen] = Color(0xff8687E7);
          choosenPriority = choosen;
        });
      },
      child: Container(
        height: 64.h,
        width: 64.h,
        decoration: BoxDecoration(
          color: colors[choosen],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.flag_outlined,
            ),
            Text(
              '$choosen',
              style: Styles.textStyle16,
            )
          ],
        ),
      ),
    );
  }
}
