import 'package:countdowntimer_stackwidgets_stackimages/stack_images.dart';
import 'package:countdowntimer_stackwidgets_stackimages/stack_widget.dart';
import 'package:flutter/material.dart';

import 'countdown_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StackImages(),
    );
  }
}
