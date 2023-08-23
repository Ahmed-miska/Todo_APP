import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/category_view.dart';
import 'package:todo/features/home/presentation/views/widgets/profile_view/priority_view.dart';

import '../../../../../../core/ulits/styles.dart';
import '../../date_view.dart';
import 'custom_textfield.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  Future openDateDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width,
            child: DatePicker(),
          ),
        ),
      );
  Future openPriorityView() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: MediaQuery.of(context).size.height * .43,
            width: MediaQuery.of(context).size.width,
            child: PriorityView(),
          ),
        ),
      );
  Future openCategoryView() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            height: MediaQuery.of(context).size.height * .6,
            width: MediaQuery.of(context).size.width,
            child: CategoryView(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    await openDateDialog();
                  },
                  icon: Icon(Icons.timer_outlined),
                ),
                IconButton(
                  onPressed: () async {
                    await openCategoryView();
                  },
                  icon: Icon(Icons.sell_outlined),
                ),
                IconButton(
                  onPressed: () async {
                    await openPriorityView();
                  },
                  icon: Icon(Icons.flag_outlined),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
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
