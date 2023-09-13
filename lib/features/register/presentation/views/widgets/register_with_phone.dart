import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:todo/core/services/google_login.dart';
import 'package:todo/core/ulits/styles.dart';
import 'package:todo/features/register/presentation/views/widgets/custom_phone_register_text_form.dart';
import 'package:todo/features/register/presentation/views/widgets/otp_text_field.dart';
import 'package:todo/features/splash/presentation/views/widgets/custom_login_button.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  int start = 30;
  bool wait = false;
  String buttonName = 'Send';
  TextEditingController phoneController = TextEditingController();
  AuthClass authClass = AuthClass();
  String verificationIdFinal = '';
  String smsCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomPhoneField(
                controller: phoneController,
                color: wait,
                text: buttonName,
                onTap: wait
                    ? null
                    : () async {
                        startTimer();
                        setState(() {
                          start = 30;
                          wait = true;
                          buttonName = 'Resend';
                        });
                        await authClass.verifyPhoneNumber(
                            '+2${phoneController.text}', context, setData);
                      },
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      'Enter 6 digit OTP',
                      style: Styles.textStyle14,
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 45.w,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Colors.black26,
                  borderColor: Colors.white,
                ),
                style: Styles.textStyle16.copyWith(
                  color: Color(0xff8687E7),
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                  setState(() {
                    smsCode = pin;
                  });
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Sent OTP agin in ',
                      style: Styles.textStyle14,
                    ),
                    TextSpan(
                      text: ' 00:$start ',
                      style: Styles.textStyle14.copyWith(
                        color: Color(0xff8687E7),
                      ),
                    ),
                    TextSpan(
                      text: ' sec ',
                      style: Styles.textStyle14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomLoginButton(
                onPressed: () {
                  authClass.signInwithPhoneNumber(
                      verificationIdFinal, smsCode, context);
                },
                text: 'Lets Go',
              )
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void setData(verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }
}
