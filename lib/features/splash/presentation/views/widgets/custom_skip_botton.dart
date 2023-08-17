import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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