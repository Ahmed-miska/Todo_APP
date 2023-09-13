import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/app_router.dart';
import 'package:todo/core/ulits/styles.dart';

import '../../../../../core/services/google_login.dart';

class SplashViewBody1 extends StatefulWidget {
  const SplashViewBody1({Key? key}) : super(key: key);

  @override
  State<SplashViewBody1> createState() => _SplashViewBody1State();
}

class _SplashViewBody1State extends State<SplashViewBody1> {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  AuthClass googleLogin = AuthClass();
  bool check = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
    navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Group 151.png',
          ),
          SizedBox(
            height: 19,
          ),
          Text(
            'UpTodo',
            style: Styles.textStyle40,
          ),
        ],
      ),
    );
  }

  void checkLogin() async {
    String? token = await googleLogin.getToken();
    if (token != null) {
      setState(() {
        check = true;
      });
    }
  }

  void navigateToNext() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        if (check) {
          check = false;

          GoRouter.of(context).push(AppRouter.kHomeView);
        } else {
          GoRouter.of(context).push(AppRouter.kSplashViewBody2);
        }
      },
    );
  }
}
