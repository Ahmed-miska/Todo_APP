import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/ulits/styles.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key, required this.text, this.controller, this.min, this.max});
  String text;
  int? min = 1, max = 5;
  TextEditingController? controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: min,
      maxLines: max,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: Styles.textStyle18,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
