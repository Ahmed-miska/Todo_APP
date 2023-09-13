import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/app_router.dart';

import '../../../../../core/ulits/styles.dart';

class CustomSkipBotton extends StatelessWidget {
  const CustomSkipBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kLoginView);
          },
          child: Text(
            'SKIP',
            style: Styles.textStyle16.copyWith(
              color: Colors.white.withOpacity(.44),
            ),
          ),
        ),
      ],
    );
  }
}
