import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/custom_textfield.dart';

import '../../../../core/ulits/styles.dart';

class AddTaskBody extends StatefulWidget {
  const AddTaskBody({Key? key}) : super(key: key);

  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'Add Task',
            style: Styles.textStyle20,
          ),
          SizedBox(
            height: 14,
          ),
          CustomTextField(
            text: 'Add Title',
          ),
          CustomTextField(
            text: 'Description',
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
