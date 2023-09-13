import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/ulits/styles.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    super.key,
    required this.text,
    this.controller
  });
  final String text;
  TextEditingController? controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: 1,
      maxLines: 5,
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
