import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/features/splash/presentation/views/widgets/splash_view_body1.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody1(),
    );
  }
}
