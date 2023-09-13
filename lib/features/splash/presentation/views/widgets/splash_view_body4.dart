import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/ulits/app_router.dart';
import 'custom_skip_botton.dart';
import 'custom_splash_down_bar.dart';
import 'custom_splash_view.dart';

class SplashViewBody4 extends StatelessWidget {
  const SplashViewBody4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 58.h,
            ),
            CustomSkipBotton(),
            CustomSplashView(
              imageLink: 'assets/images/Frame 161.png',
              text1: 'Orgonaize your tasks',
              text2:
                  'You can organize your daily tasks by adding your tasks into separate categories',
              color1: Colors.white.withOpacity(.6),
              color2: Colors.white.withOpacity(.6),
              color3: Colors.white,
            ),
            Spacer(),
            CustomSplashDownBar(
              width: 120.w,
              text: 'Get Started',
              onpressed: () {
                GoRouter.of(context).push(AppRouter.kSplashViewBody5);
              },
            ),
            SizedBox(
              height: 60.h,
            )
          ],
        ),
      ),
    );
  }
}
