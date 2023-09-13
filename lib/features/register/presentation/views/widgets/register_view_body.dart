import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo/core/services/google_login.dart';

import 'package:todo/core/ulits/app_router.dart';
import 'package:todo/features/register/presentation/manger/cubit/register_cubit.dart';

import '../../../../../core/ulits/styles.dart';
import '../../../../Login/presentation/views/widget/custom_login_register_botton.dart';
import '../../../../Login/presentation/views/widget/custom_password_textfield.dart';
import '../../../../Login/presentation/views/widget/custom_username_textfield.dart';
import '../../../../splash/presentation/views/widgets/custom_login_button.dart';

class RegisterViewBody extends StatefulWidget {
  RegisterViewBody({Key? key}) : super(key: key);

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  //  String email;
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
              'Register',
              style: Styles.textStyle32,
            ),
            // Spacer(),
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
              // onChanged: (value) {
              //   email = value;
              // },
            ),
            // Spacer(),
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
              // onChanged: (value) {
              //   pass = value;
              // },
            ),
            // Spacer(),
            SizedBox(
              height: 50.h,
            ),
            // Text(
            //   'Confirm Password',
            //   style: Styles.textStyle16.copyWith(
            //     color: Colors.white.withOpacity(.87),
            //   ),
            // ),
            // SizedBox(
            //   height: 8.h,
            // ),
            // CustomPasswordTextField(
            //   controller: pass2Controlar,
            //   // onChanged: (value) {
            //   //   pass = value;
            //   // },
            // ),
            // // Spacer(),
            // SizedBox(
            //   height: 20.h,
            // ),
            //-----------------------------------------------------------
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  setState(() {
                    circular = false;
                  });

                  GoRouter.of(context).push(AppRouter.kHomeView);
                } else if (state is RegisterFailure) {
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
                  text: 'Register',
                  onPressed: () async {
                    setState(() {
                      circular = true;
                    });
                    await BlocProvider.of<RegisterCubit>(context).registeration(
                      emailControlar: emailControlar,
                      passControlar: passControlar,
                    );
                  },
                );
              },
            ),
            //----------------------------------------------------------------

            // CustomLoginButton(
            //   circular: circular,
            //   text: 'Register',
            //   onPressed: () async {
            //     // setState(() {
            //     //   circular = true;
            //     // });
            //     try {
            //       UserCredential user = await FirebaseAuth.instance
            //           .createUserWithEmailAndPassword(
            //               email: emailControlar.text,
            //               password: passControlar.text);
            //       GoRouter.of(context).push(AppRouter.kHomeView);
            //     } catch (e) {
            //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //         content: Text('ssss'),
            //       ));
            //     }
            //   },
            // ),
            // setState(() {
            //   circular = true;
            // });
            // try {
            //   UserCredential user =
            //       await auth.createUserWithEmailAndPassword(
            //     email: emailControlar.text,
            //     password: passControlar.text,
            //   );
            //   print(user.user!.email);
            //   circular = false;
            //   GoRouter.of(context).push(AppRouter.kHomeView);
            // } catch (e) {
            //   circular = true;
            //   final snackBar = SnackBar(content: Text(e.toString()));
            //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
            // }
            //       },
            //     );
            //   },
            // ),
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
                  'Already have an account?',
                  style: Styles.textStyle12,
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                  child: Text(
                    ' Login',
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
