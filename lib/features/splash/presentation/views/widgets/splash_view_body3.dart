import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/ulits/app_router.dart';
import 'custom_skip_botton.dart';
import 'custom_splash_down_bar.dart';
import 'custom_splash_view.dart';

class SplashViewBody3 extends StatelessWidget {
  const SplashViewBody3({Key? key}) : super(key: key);

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
              imageLink: 'assets/images/Frame 162.png',
              text1: 'Create daily routine',
              text2:
                  'In Uptodo  you can create your personalized routine to stay productive',
              color1: Colors.white.withOpacity(.6),
              color2: Colors.white,
              color3: Colors.white.withOpacity(.6),
            ),
            Spacer(),
            CustomSplashDownBar(
              width: 90.w,
              text: 'NEXT',
              onpressed: () {
                GoRouter.of(context).push(AppRouter.kSplashViewBody4);
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
