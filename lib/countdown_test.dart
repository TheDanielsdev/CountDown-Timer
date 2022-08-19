import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyCountdown extends StatefulWidget {
  const MyCountdown({Key? key}) : super(key: key);

  @override
  State<MyCountdown> createState() => _MyCountdownState();
}

class _MyCountdownState extends State<MyCountdown> {
  Duration myDuration = Duration(days: 2);
  Timer? _timer;

//To start the timer, we can also call this function inside the resume button, , but reset will be false.
  void start() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) => setCount());
  }

  void setCount({bool reset = true}) {
    if (reset == true) {
      resetTimer();
    }
    final removeOne = 1;
    setState(() {
      final seconds = myDuration.inSeconds - removeOne;
      seconds < 0 ? _timer?.cancel() : myDuration = Duration(seconds: seconds);
    });
  }

//To stop the timer, we can call this function either in our pause button, but reset will be false
  void stop({bool reset = true}) {
    if (reset == true) {
      resetTimer();
    }
    setState(() {
      _timer?.cancel();
    });
  }

//Function to reset the timer, resets to its initail state which is 2 days
  void resetTimer() {
    setState(() {
      myDuration = Duration(days: 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    //to check if timer is running, so that you can pause and resume.
    bool isRunning = _timer == null ? false : _timer!.isActive;
    //To add 0 to any single figure or number e.g 1 will now be 01 and 2 will now be 02
    String strLen(int n) => n.toString().padLeft(2, '0');
    final days = strLen(myDuration.inDays);
    final hrs = strLen(myDuration.inHours.remainder(24));
    final mins = strLen(myDuration.inMinutes.remainder(60));
    final secs = strLen(myDuration.inSeconds.remainder(60));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      body: Center(child: Text('$days : $hrs : $mins : $secs')),
    );
  }
}
