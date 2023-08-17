import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/ulits/styles.dart';

class CustomBackBotton extends StatelessWidget {
  const CustomBackBotton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        GoRouter.of(context).pop();
      },
      child: Center(
        child: Text(
          'BACK',
          style: Styles.textStyle16.copyWith(
            color: Colors.white.withOpacity(.44),
          ),
        ),
      ),
    );
  }
}
