import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/custom_textfield.dart';

import '../../../../../core/ulits/styles.dart';

class EditTaskTitel extends StatefulWidget {
  const EditTaskTitel({Key? key}) : super(key: key);

  @override
  State<EditTaskTitel> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskTitel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Edit Task title',
              style: Styles.textStyle16,
            ),
            Divider(
              thickness: 2,
            ),
            SingleChildScrollView(
              child: Column(children: [
                CustomTextField(
                  text: 'Add Title',
                ),
                CustomTextField(
                  text: 'Description',
                ),
              ]),
            ),
            SizedBox(
              height: 8,
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
