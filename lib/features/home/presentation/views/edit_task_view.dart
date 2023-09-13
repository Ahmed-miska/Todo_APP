import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/home/presentation/views/widgets/edit_Task_title.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/category_view.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/priority_view.dart';

import '../../../../core/ulits/styles.dart';
import 'date_view.dart';
import 'delete_view.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Future openEditTaskView() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: MediaQuery.of(context).size.height * .31,
              width: MediaQuery.of(context).size.width,
              child: EditTaskTitel(),
            ),
          ),
        );
    Future openDateDialog() => showDialog(
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
    Future openPriorityView() => showDialog(
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
    Future openCategoryView() => showDialog(
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
                              Text(
                                'Do Math Homework',
                                style: Styles.textStyle16,
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
                                Text(
                                  'Today At 16:45',
                                  style: Styles.textStyle16
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 80,
                //   width: MediaQuery.of(context).size.width * .9,
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.circle_outlined,
                //         size: 20,
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Text(
                //                 'Do Math Homework',
                //                 style: Styles.textStyle20,
                //               ),
                //               SizedBox(
                //                 width: MediaQuery.of(context).size.width * .17,
                //               ),
                //               IconButton(
                //                 onPressed: () async {
                //                   await openEditTaskView();
                //                 },
                //                 icon: Icon(Icons.edit_note),
                //               ),
                //             ],
                //           ),
                //           Text(
                //             'Do chapter 2 to 5 for next week',
                //             style:
                //                 Styles.textStyle16.copyWith(color: Colors.grey),
                //           )
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
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
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Today At 16:45',
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
                          Icon(Icons.school_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'University',
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
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Default',
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
}
