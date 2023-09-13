import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/ulits/styles.dart';
import 'package:todo/features/home/presentation/views/widgets/todo_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
        Container(
          height: 641.h,
          width: 327.w,
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  TodoItem(),
                  SizedBox(
                    height: 16.h,
                  )
                ],
              );
            },
          ),
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
