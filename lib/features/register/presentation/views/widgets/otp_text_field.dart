import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:todo/core/ulits/styles.dart';

class OtpField extends StatefulWidget {
   OtpField({Key? key,required this.smsCode}) : super(key: key);
 String smsCode;
  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
 
  @override
  Widget build(BuildContext context) {
    return OTPTextField(
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
         widget. smsCode = pin;
        });
      },
    );
  }
}
