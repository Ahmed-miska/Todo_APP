import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/ulits/styles.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xff8875FF),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            'LOGIN',
            style: Styles.textStyle16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
