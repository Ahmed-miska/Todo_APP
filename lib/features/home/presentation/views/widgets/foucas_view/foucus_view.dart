import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:todo/core/ulits/styles.dart';

class FoucusView extends StatefulWidget {
  const FoucusView({Key? key}) : super(key: key);

  @override
  State<FoucusView> createState() => _FoucusViewState();
}

class _FoucusViewState extends State<FoucusView> {
  late Timer timer = timer;
  int _start = 0;
  var _isTimerOn = false;
  void notify() {
    if (_start == 3600) {
      FlutterRingtonePlayer.playNotification();
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 3600) {
          notify();
          setState(() {
            _start = 0;
            _isTimerOn = false;
            timer.cancel();
          });
        } else {
          setState(() {
            _start++;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  // CountDownController _controller = CountDownController();
  // bool isPaused = false;
  // String text = 'Start Focusing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Focus Mode',
              style: Styles.textStyle20,
            ),
            SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  size: 250.w,
                  customColors: CustomSliderColors(
                    trackColor: Colors.white38,
                    progressBarColor: Color(0xff8687E7),
                    dotColor: Colors.black,
                    shadowColor: Colors.grey.shade600,
                  ),
                  startAngle: 270,
                  angleRange: 360,
                  customWidths: CustomSliderWidths(
                    trackWidth: 15.w,
                    progressBarWidth: 15.w,
                    handlerSize: 5.w,
                  ),
                ),
                min: 0,
                max: 3600,
                initialValue: _start.toDouble(),
                onChange: (double value) {
                  setState(() {
                    _start = value.toInt();
                  });
                },
                innerWidget: (double value) {
                  final int remainingTime = value.toInt();
                  final int minutes = remainingTime ~/ 60;
                  final int seconds = remainingTime % 60;
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${minutes.toString().padRight(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                              style: const TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Minute',
                              style: Styles.textStyle16,
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
            Text(
              'While your focus mode is on, all of your notifications will be off',
              style: Styles.textStyle16,
              textAlign: TextAlign.center,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff8687E7),
              ),
              onPressed: () {
                if (_isTimerOn) {
                  timer.cancel();
                  setState(() {
                    _isTimerOn = false;
                    _start = 1;
                  });
                } else {
                  _isTimerOn = true;
                  startTimer();
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Text(
                  _isTimerOn ? 'Stop Focusing' : 'Start Focusing',
                  style: Styles.textStyle16.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class TimerReel extends StatefulWidget {
//   const TimerReel({Key? key}) : super(key: key);

//   @override
//   _TimerReelState createState() => _TimerReelState();
// }

// class _TimerReelState extends State<TimerReel> {
//   late Timer _timer;
//   int _start = 30;
//   var _isTimerOn = false;

//   void startTimer() {
//     const oneSec = Duration(seconds: 1);
//     _timer = Timer.periodic(
//       oneSec,
//       (Timer timer) {
//         if (_start == 0) {
//           setState(() {
//             timer.cancel();
//           });
//         } else {
//           setState(() {
//             _start--;
//           });
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ButtonStyle style =
//         ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

//     return Scaffold(
//       backgroundColor: Colors.amber,
//       appBar: AppBar(
//         title: const Text(
//           'Timer',
//           style: TextStyle(
//             fontSize: 28,
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         shadowColor: Colors.transparent,
//         backgroundColor: Color(0xfff2B2B2B),
//       ),
//       body: Container(
//         color: Color(0xfff2B2B2B),
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.85,
//               height: MediaQuery.of(context).size.width * 0.85,
//               child: SleekCircularSlider(
//                 appearance: CircularSliderAppearance(
//                   size: MediaQuery.of(context).size.width * 0.84,
//                   customColors: CustomSliderColors(
//                     trackColor: Color(0xfff364643),
//                     progressBarColor: Color(0xfff24FFCC),
//                     dotColor: Colors.black,
//                     shadowColor: Colors.grey.shade600,
//                   ),
//                   startAngle: 270,
//                   angleRange: 360,
//                   customWidths: CustomSliderWidths(
//                     trackWidth: 36,
//                     progressBarWidth: 22,
//                     handlerSize: 7,
//                   ),
//                 ),
//                 min: 0,
//                 max: 60,
//                 initialValue: _start.toDouble(),
//                 onChange: (double value) {
//                   setState(() {
//                     _start = value.round();
//                   });
//                 },
//                 innerWidget: (percentage) => Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         '${_start.round()}',
//                         style: const TextStyle(
//                           fontSize: 120,
//                           color: Color(0xfff24FFCC),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const Text(
//                         "seconds",
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 140,
//             ),
//             GestureDetector(
//               onTap: () {
//                 if (_isTimerOn) {
//                   _timer.cancel();
//                   setState(() {
//                     _isTimerOn = false;
//                     _start = 30;
//                   });
//                 } else {
//                   _isTimerOn = true;
//                   startTimer();
//                 }
//               },
//               child: Container(
//                 alignment: Alignment.center,
//                 width: MediaQuery.of(context).size.width * 0.65,
//                 decoration: BoxDecoration(
//                     color: _isTimerOn ? Colors.redAccent : Color(0xfff24FFCC),
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.5),
//                         spreadRadius: 1,
//                         blurRadius: 2,
//                         offset: Offset(2, 4),
//                       ),
//                     ]),
//                 padding: const EdgeInsets.symmetric(vertical: 20),
//                 child: Text(
//                   _isTimerOn ? 'Stop' : 'Start',
//                   style: TextStyle(
//                     fontSize: 24,
//                     color: _isTimerOn ? Colors.white : Colors.black,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
