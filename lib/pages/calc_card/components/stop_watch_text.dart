import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final stopWatchTextProvider =
    StateNotifierProvider((ref) => StopWatchViewModel());

class StopWatchText extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(stopWatchTextProvider.state);
    return Text(
      '$state',
      style: const TextStyle(
        fontSize: 48,
      ),
    );
  }
}

class StopWatchViewModel extends StateNotifier<String> {
  final Stopwatch _swatch = Stopwatch();

  StopWatchViewModel() : super('00:00:00');

  void start() {
    _swatch.start();
    Timer(const Duration(milliseconds: 10), onTimer);
  }

  void stop() => _swatch.stop();

  void reset() => _swatch.reset();

  void onTimer() {
    if (_swatch.isRunning) {
      Timer(const Duration(milliseconds: 10), onTimer);
    }
    final m = (_swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0");
    final s = (_swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    final ms = (_swatch.elapsed.inMilliseconds % 1000 ~/ 10)
        .toString()
        .padLeft(2, "0");
    state = '$m:$s:$ms';
  }
}
