import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/ulits/app_router.dart';

import 'custom_Next_botton.dart';
import 'custom_back_botton.dart';

class CustomSplashDownBar extends StatelessWidget {
  const CustomSplashDownBar({
    super.key,
    required this.onpressed,
    required this.text,
    required this.width,
  });
  final Function()? onpressed;
  final String text;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackBotton(),
        CustomNextBotton(
          width: width,
          text: text,
          onpressed: onpressed,
        ),
      ],
    );
  }
}
