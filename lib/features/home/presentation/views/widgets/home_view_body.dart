import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: 66,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
          height: h * .01,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .72,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  TodoItem(),
                  SizedBox(
                    height: 20,
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
