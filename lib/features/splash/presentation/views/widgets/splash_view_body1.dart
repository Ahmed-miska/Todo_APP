import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/app_router.dart';
import 'package:todo/core/ulits/styles.dart';

class SplashViewBody1 extends StatefulWidget {
  const SplashViewBody1({Key? key}) : super(key: key);

  @override
  State<SplashViewBody1> createState() => _SplashViewBody1State();
}

class _SplashViewBody1State extends State<SplashViewBody1> {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          const Text(
            'UpTodo',
            style: Styles.textStyle40,
          ),
        ],
      ),
    );
  }

  void navigateToNext() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        GoRouter.of(context).push(AppRouter.kSplashViewBody2);
      },
    );
  }
}
