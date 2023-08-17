import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/app_router.dart';

import '../../../../../core/ulits/styles.dart';

class CreateAccountBotton extends StatelessWidget {
  const CreateAccountBotton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kRegisterView);
      },
      child: Container(
        height: 48,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Color(0xFF8E7CFF),
              ),
              borderRadius: BorderRadius.circular(4)),
        ),
        child: Center(
          child: Text(
            'CREATE ACCOUNT',
            style: Styles.textStyle16.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
