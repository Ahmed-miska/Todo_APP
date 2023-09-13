import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/ulits/styles.dart';

class DeleteView extends StatelessWidget {
  const DeleteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Column(
          children: [
            Text(
              'Delete Task',
              style: Styles.textStyle16,
            ),
            Divider(
              thickness: 2,
            ),
            Column(
              children: [
                Text(
                  'Are You sure you want to delete this task?',
                  style: Styles.textStyle14,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Task title : Do math homework',
                  style: Styles.textStyle16,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    GoRouter.of(context).pop();
                  },
                  child: Text(
                    'Save',
                    style: Styles.textStyle16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
