import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/styles.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
                Text(
                  'Settings',
                  style: Styles.textStyle20,
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: Styles.textStyle16.copyWith(color: Colors.white70),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.brush_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Change app color',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.title_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Change app typography',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.language_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Change app language',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Import',
                  style: Styles.textStyle16.copyWith(color: Colors.white70),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.important_devices),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Import from Google calendar',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .3,
            )
          ],
        ),
      ),
    );
  }
}
