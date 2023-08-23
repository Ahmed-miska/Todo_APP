import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(8.0),
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
                  style: Styles.textStyle16,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Task title : Do math homework',
                  style: Styles.textStyle18,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    GoRouter.of(context).pop();
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
          ],
        ),
      ),
    );
  }
}
