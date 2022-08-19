import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Timer? timer;
  Duration duration = const Duration(days: 2);

  void start({bool reset = true}) {
    if (reset == true) {
      resetCountdown();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountdown());
  }

  void setCountdown() {
    const removeByOne = 1;
    setState(() {
      final seconds = duration.inSeconds - removeByOne;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stop({bool reset = true}) {
    if (reset == true) {
      resetCountdown();
    }
    setState(() {
      timer?.cancel();
    });
  }

  void resetCountdown() {
    setState(() {
      duration = const Duration(days: 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isRunning = timer == null ? false : timer!.isActive;
    bool isComplete = duration.inDays == 0 &&
        duration.inHours == 0 &&
        duration.inMinutes == 0 &&
        duration.inSeconds == 0;
    String strLen(int n) => n.toString().padLeft(2, '0');
    final days = strLen(duration.inDays);
    final hours = strLen(duration.inHours.remainder(24));
    final minutes = strLen(duration.inMinutes.remainder(60));
    final secs = strLen(duration.inSeconds.remainder(60));
    return Scaffold(
      body: Center(child: Text('$days : $hours : $minutes : $secs')),
    );
  }
}
