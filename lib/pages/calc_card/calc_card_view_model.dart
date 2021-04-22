import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final calcCardViewModelProvider =
    ChangeNotifierProvider((_) => CalcCardViewModel());

enum CalcCardCalcMode {
  add,
  addUp,
  sub,
  subDown,
  multi,
  multiRandom,
}

class CalcCardViewModel extends ChangeNotifier {
  CalcCardCalcMode calcMode = CalcCardCalcMode.add;
  bool isStart = false;

  List<String> calcList() {
    var list = [''];
    switch (calcMode) {
      case CalcCardCalcMode.add:
        list = _add(isUp: false);
        break;
      case CalcCardCalcMode.addUp:
        list = _add(isUp: true);
        break;
      case CalcCardCalcMode.sub:
        list = _sub(isDown: false);
        break;
      case CalcCardCalcMode.subDown:
        list = _sub(isDown: true);
        break;
      case CalcCardCalcMode.multi:
        list = _multi(isRandom: false);
        break;
      case CalcCardCalcMode.multiRandom:
        list = _multi(isRandom: true);
        break;
    }
    return list;
  }

  void start() {
    isStart = true;
    notifyListeners();
  }

  void stop() {
    isStart = false;
    notifyListeners();
  }

  List<String> _add({required bool isUp}) {
    final leftArray = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    final rightArray = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    var list = leftArray
        .map((left) => rightArray
            .where((right) => isUp ? left + right > 10 : left + right < 11)
            .map((right) => '$left + $right=${left + right}'))
        .expand((element) => element)
        .toList();
    list.shuffle();
    return list;
  }

  List<String> _sub({required bool isDown}) {
    final leftArray = isDown
        ? [11, 12, 13, 14, 15, 16, 17, 18, 19]
        : [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final rightArray = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    var list = leftArray
        .map((left) => rightArray
            .where((right) => isDown ? left - right < 10 : left - right >= 0)
            .map((right) => '$left - $right=${left - right}'))
        .expand((element) => element)
        .toList();
    list.shuffle();
    return list;
  }

  List<String> _multi({required bool isRandom}) {
    final leftArray = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    final rightArray = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    var list = leftArray
        .map((left) =>
            rightArray.map((right) => '$left X $right=${left * right}'))
        .expand((element) => element)
        .toList();
    if (isRandom) list.shuffle();
    return list;
  }
}
