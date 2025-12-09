import 'dart:async';

import 'package:flutter/material.dart';

class TimerViewModel extends ChangeNotifier {
  bool isPlaying = false;
  Timer? timer;
  Duration duration = Duration.zero;

  void startTime(int initialMinutes, ValueNotifier<bool> isPaused) {
    if (isPaused.value) return;

    duration = Duration.zero;
    isPlaying = true;
    notifyListeners();
    // setState(() {
    // setState(() {
    //   duration = Duration.zero;
    // });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // setState(() {
      if (duration.inMinutes < initialMinutes) {
        duration += Duration(seconds: 1);
        notifyListeners();
      } else {
        stopTime();
      }
    });
    // });
    // });
  }

  void stopTime() {
    isPlaying = false;
    timer?.cancel();
    notifyListeners();
  }
}
