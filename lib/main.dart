import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/ulits/app_router.dart';
import 'package:todo/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
      ),
      darkTheme: ThemeData.dark(),
    );
  }
}
