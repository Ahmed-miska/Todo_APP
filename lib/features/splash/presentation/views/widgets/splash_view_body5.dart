import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/styles.dart';

import '../../../../../core/ulits/app_router.dart';
import 'custom_create_account_botton.dart';
import 'custom_login_button.dart';

class SplashViewBody5 extends StatelessWidget {
  const SplashViewBody5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 58,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ],
            ),
            SizedBox(
              height: 58,
            ),
            Text(
              'Welcome to UpTodo',
              style: Styles.textStyle32,
            ),
            SizedBox(
              height: 26,
            ),
            Container(
              height: 48,
              width: 287,
              child: Text(
                'Please login to your account or create new account to continue',
                style: Styles.textStyle16.copyWith(
                  color: Colors.white.withOpacity(.8),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            CustomLoginButton(
              text: 'LOGIN',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kLoginView);
              },
            ),
            SizedBox(
              height: 24,
            ),
            CreateAccountBotton(),
            SizedBox(
              height: 67,
            )
          ],
        ),
      ),
    );
  }
}
