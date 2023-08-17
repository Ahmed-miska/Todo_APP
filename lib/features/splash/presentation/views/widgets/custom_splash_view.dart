import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/ulits/styles.dart';
import 'dashed_stepper.dart';

class CustomSplashView extends StatelessWidget {
  const CustomSplashView(
      {Key? key,
      required this.imageLink,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.text1,
      required this.text2})
      : super(key: key);
  final String imageLink;
  final String text1, text2;
  final Color color1, color2, color3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 269, child: Image.asset(imageLink)),
        SizedBox(
          height: 57,
        ),
        DashedStepper(
          color1: color1,
          color2: color2,
          color3: color3,
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          text1,
          style: Styles.textStyle32.copyWith(
            color: Colors.white.withOpacity(.8),
          ),
        ),
        SizedBox(
          height: 42,
        ),
        Container(
          height: 48,
          width: 300,
          child: Text(
            text2,
            style: Styles.textStyle16.copyWith(
              color: Colors.white.withOpacity(.8),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
