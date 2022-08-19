import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Duration _duration = const Duration(days: 4);
  Timer? _timer;

  void start({bool reset = true}) {
    if (reset == true) {
      resetCountdown();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountdown());
  }

  void setCountdown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = _duration.inSeconds - reduceSecondsBy;
      seconds < 0 ? _timer?.cancel() : _duration = Duration(seconds: seconds);
    });
  }

  void stop({bool reset = true}) {
    //This function is same as saying: if(reset == true) {
    //resetCountdown()}
    if (reset == true) ;
    resetCountdown();

    _timer!.cancel();
  }

  void resetCountdown() {
    setState(() {
      _duration = const Duration(days: 4);
    });
  }

  @override
  Widget build(BuildContext context) {
    String strLen(int n) => n.toString().padLeft(2, '0');
    final days = strLen(_duration.inDays);
    final hours = strLen(_duration.inHours.remainder(24));
    final minutes = strLen(_duration.inMinutes.remainder(60));
    final seconds = strLen(_duration.inSeconds.remainder(60));
    bool isRunning = _timer == null ? false : _timer!.isActive;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$days : $hours : $minutes : $seconds'),
          const SizedBox(
            height: 20,
          ),
          isRunning
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          stop(reset: false);
                        },
                        child: Container(
                          color: Colors.orange,
                          width: double.infinity,
                          height: 40,
                          child: const Center(
                              child: Text(
                            'Pause',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          start(reset: false);
                        },
                        child: Container(
                          color: Colors.orange,
                          width: double.infinity,
                          height: 40,
                          child: const Center(
                              child: Text(
                            'Resume',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                  ],
                )
              : GestureDetector(
                  onTap: () => start(),
                  child: Container(
                    color: Colors.orange,
                    width: double.infinity,
                    height: 40,
                    child: const Center(
                        child: Text(
                      'Start',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => stop(),
            child: Container(
              color: Colors.orange,
              width: double.infinity,
              height: 40,
              child: const Center(
                  child: Text(
                'Stop',
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
            ),
          )
        ],
      ),
    ));
  }
}
