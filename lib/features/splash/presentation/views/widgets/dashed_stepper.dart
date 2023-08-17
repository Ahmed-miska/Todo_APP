import 'package:flutter/cupertino.dart';

import 'Custom_dashed_stepper_item.dart';

class DashedStepper extends StatelessWidget {
  const DashedStepper(
      {Key? key,
      required this.color1,
      required this.color2,
      required this.color3})
      : super(key: key);
  final Color color1, color2, color3;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 4,
      child: Row(
        children: [
          DashedStepperItem(
            color: color1,
          ),
          SizedBox(
            width: 5,
          ),
          DashedStepperItem(
            color: color2,
          ),
          SizedBox(
            width: 5,
          ),
          DashedStepperItem(
            color: color3,
          ),
        ],
      ),
    );
  }
}