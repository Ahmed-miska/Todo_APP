import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/app_router.dart';
import 'package:todo/core/ulits/styles.dart';
import 'package:todo/features/splash/presentation/views/widgets/custom_login_button.dart';
import 'package:todo/features/splash/presentation/views/widgets/splash_view_body5.dart';

import '../../../../splash/presentation/views/widgets/custom_create_account_botton.dart';
import 'custom_login_register_botton.dart';
import 'custom_password_textfield.dart';
import 'custom_username_textfield.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * .04,
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            // Spacer(),
            SizedBox(
              height: h * .03,
            ),
            Text(
              'LOGIN',
              style: Styles.textStyle32,
            ),
            SizedBox(
              height: h * .05,
            ),
            Text(
              'Username',
              style: Styles.textStyle16.copyWith(
                color: Colors.white.withOpacity(.87),
              ),
            ),
            SizedBox(
              height: h * .009,
            ),
            CustomUserNameTextField(),
            SizedBox(
              height: h * .04,
            ),
            Text(
              'Password',
              style: Styles.textStyle16.copyWith(
                color: Colors.white.withOpacity(.87),
              ),
            ),

            SizedBox(
              height: h * .009,
            ),
            CustomPasswordTextField(),
            // Spacer(),
            SizedBox(
              height: h * .06,
            ),
            CustomLoginButton(text: 'LOGIN', onPressed: () { GoRouter.of(context).push(AppRouter.kHomeView); },),
            SizedBox(
              height: h * .04,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Text(
                  " or ",
                  style: Styles.textStyle16,
                ),
                Expanded(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * .04,
            ),
            CustomLoginWithBotton(
              imageLink: 'assets/images/google.png',
              text: 'Login with Google',
            ),
            SizedBox(
              height: h * .04,
            ),
            CustomLoginWithBotton(
              imageLink: 'assets/images/apple.png',
              text: 'Login with Appel',
            ),
            SizedBox(
              height: h * .06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: Styles.textStyle12,
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kRegisterView);
                  },
                  child: Text(
                    ' Register',
                    style: Styles.textStyle12.copyWith(
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
}
