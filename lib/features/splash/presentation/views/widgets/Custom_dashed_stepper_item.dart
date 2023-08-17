import 'package:flutter/cupertino.dart';

class DashedStepperItem extends StatelessWidget {
  const DashedStepperItem({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
    );
  }
}
