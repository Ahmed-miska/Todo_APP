import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/app_router.dart';
import 'package:todo/core/ulits/styles.dart';
import 'package:todo/features/Login/presentation/manger/cubit/login_cubit.dart';
import 'package:todo/features/Login/presentation/views/widget/custom_username_textfield.dart';
import 'package:todo/features/splash/presentation/views/widgets/custom_login_button.dart';

import '../../../../../core/services/google_login.dart';
import 'custom_login_register_botton.dart';
import 'custom_password_textfield.dart';

class LoginViewBody extends StatefulWidget {
  LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailControlar = TextEditingController();

  TextEditingController passControlar = TextEditingController();
  bool circular = false;
  AuthClass googleSignin = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            // Spacer(),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Login',
              style: Styles.textStyle32,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Username',
              style: Styles.textStyle16.copyWith(
                color: Colors.white.withOpacity(.87),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomUserNameTextField(
              controller: emailControlar,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Password',
              style: Styles.textStyle16.copyWith(
                color: Colors.white.withOpacity(.87),
              ),
            ),

            SizedBox(
              height: 10.h,
            ),
            CustomPasswordTextField(
              controller: passControlar,
            ),
            // Spacer(),
            SizedBox(
              height: 50.h,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  setState(() {
                    circular = false;
                  });

                  GoRouter.of(context).push(AppRouter.kHomeView);
                } else if (state is LoginFailure) {
                  setState(() {
                    circular = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errMessage),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return CustomLoginButton(
                  circular: circular,
                  text: 'LOGIN',
                  onPressed: () async {
                    setState(() {
                      circular = true;
                    });
                    BlocProvider.of<LoginCubit>(context).login(
                        emailControlar: emailControlar,
                        passControlar: passControlar);
                  },
                );
              },
            ),
            SizedBox(
              height: 30.h,
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
              height: 30.h,
            ),
            CustomLoginWithBotton(
              onPressed: () async {
                await googleSignin.googleSignIn(context);
              },
              imageLink: 'assets/images/google.png',
              text: 'Login with Google',
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomLoginWithBotton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kPhoneView);
              },
              imageLink: 'assets/images/mobile-phones-telephone-call.png',
              text: 'Login with Mobile',
            ),
            SizedBox(
              height: 20.h,
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
                    GoRouter.of(context).pop();
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
