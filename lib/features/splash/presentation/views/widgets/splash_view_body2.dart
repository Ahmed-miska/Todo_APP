import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/splash/presentation/views/widgets/custom_splash_down_bar.dart';

import '../../../../../core/ulits/app_router.dart';
import 'custom_Next_botton.dart';
import 'custom_back_botton.dart';
import 'custom_skip_botton.dart';
import 'custom_splash_view.dart';

class SplashViewBody2 extends StatelessWidget {
  const SplashViewBody2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 58,
            ),
            CustomSkipBotton(),
            CustomSplashView(
              imageLink: 'assets/images/Group 1824 (1).png',
              text1: 'Manage your tasks',
              text2:
                  'You can easily manage all of your daily tasks in DoMe for free',
              color1: Colors.white,
              color2: Colors.white.withOpacity(.6),
              color3: Colors.white.withOpacity(.6),
            ),
            Spacer(),
            CustomSplashDownBar(
              width: 90,
              text: 'NEXT',
              onpressed: () {
                GoRouter.of(context).push(AppRouter.kSplashViewBody3);
              },
            ),
            SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }
}
