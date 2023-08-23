import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/ulits/styles.dart';

class FoucusView extends StatefulWidget {
  const FoucusView({Key? key}) : super(key: key);

  @override
  State<FoucusView> createState() => _FoucusViewState();
}

class _FoucusViewState extends State<FoucusView> {
  String text = 'Start Focusing';
  @override
  Widget build(BuildContext context) {
    CountDownController _controller = CountDownController();
    bool _isPause = true;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Focus Mode',
              style: Styles.textStyle20,
            ),
            CircularCountDownTimer(
              width: MediaQuery.of(context).size.width * .5,
              height: MediaQuery.of(context).size.height * .5,
              duration: 3600,
              fillColor: Color(0xff8687E7),
              ringColor: Colors.white.withOpacity(.5),
              strokeWidth: 10.0,
              textStyle: Styles.textStyle40,
              controller: _controller,
              strokeCap: StrokeCap.round,
              isTimerTextShown: true,
              isReverse: false,
              autoStart: false,
            ),
            Text(
              'While your focus mode is on, all of your notifications will be off',
              style: Styles.textStyle16,
              textAlign: TextAlign.center,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff8687E7),
                fixedSize: Size(MediaQuery.of(context).size.width * .4,
                    MediaQuery.of(context).size.height * .06),
              ),
              onPressed: () {
                setState(() {
                  if (_isPause) {
                    _isPause = false;
                    _controller.resume();
                    text = 'Stop Focusing';
                  } else {
                    _isPause = true;
                    _controller.pause();
                    text = 'Start Focusing';
                  }
                });
              },
              child: Text(
                text,
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {
      //       setState(() {
      //         if (isPause) {
      //           isPause = false;
      //           _controller.resume();
      //         } else {
      //           isPause = true;
      //           _controller.pause();
      //         }
      //       });
      //     },
      //     icon: Icon(isPause ? Icons.play_arrow : Icons.pause),
      //     label: Text(isPause ? 'Start Focusing' : 'Stop Focusing')),
    );
  }
}
