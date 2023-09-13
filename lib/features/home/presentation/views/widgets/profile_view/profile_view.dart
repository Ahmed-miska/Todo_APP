import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/services/google_login.dart';
import 'package:todo/core/ulits/app_router.dart';
import 'package:todo/core/ulits/styles.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  AuthClass googleSign = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Profile',
              style: Styles.textStyle20,
            ),
            Image.asset(
              'assets/images/Ellipse 13.png',
            ),
            Text(
              'Martha Hays',
              style: Styles.textStyle20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff363636),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .08,
                        vertical: MediaQuery.of(context).size.height * .02),
                    child: Text(
                      '10 Task left',
                      style: Styles.textStyle16,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff363636),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .08,
                        vertical: MediaQuery.of(context).size.height * .02),
                    child: Text(
                      '5 Task done',
                      style: Styles.textStyle16,
                    ),
                  ),
                ),
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
                Icon(Icons.settings),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'App Settings',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kSettingView);
                  },
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account',
                  style: Styles.textStyle16.copyWith(color: Colors.white70),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.person_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Change account name',
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
                Icon(Icons.key_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Change account password',
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
                Icon(Icons.camera_alt_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Change account Image',
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
                  'Uptodo',
                  style: Styles.textStyle16.copyWith(color: Colors.white70),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.menu_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'About US',
                  style: Styles.textStyle16,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {},
                )
              ],
            ),
            GestureDetector(
              onTap: () async {
                await googleSign.googleSignout(context);
                GoRouter.of(context).pop();
                GoRouter.of(context).push(AppRouter.kLoginView);
              },
              child: Row(
                children: [
                  Icon(Icons.logout_rounded),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Log out',
                    style: Styles.textStyle16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
