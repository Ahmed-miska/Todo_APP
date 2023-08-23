import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/styles.dart';

class PriorityView extends StatefulWidget {
  const PriorityView({Key? key}) : super(key: key);

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
    Color(0xff272727),
  ];
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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    xX(choosen: 1),
                    xX(choosen: 2),
                    xX(choosen: 3),
                    xX(choosen: 4),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    xX(choosen: 5),
                    xX(choosen: 6),
                    xX(choosen: 7),
                    xX(choosen: 8),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    xX(choosen: 9),
                    SizedBox(
                      width: 8,
                    ),
                    xX(choosen: 10),
                  ],
                ),
              ],
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
                    print(choosenPriority);
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

  GestureDetector xX({required int choosen}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          colors = [
            color,
            color,
            color,
            color,
            color,
            color,
            color,
            color,
            color,
            color,
            color
          ];
          colors[choosen] = Color(0xff8687E7);
          choosenPriority = choosen;
        });
      },
      child: Container(
        height: 64,
        width: 64,
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
