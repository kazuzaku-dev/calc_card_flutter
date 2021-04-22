import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'calc_card_view_model.dart';
import 'components/calc_card.dart';
import 'components/stop_watch_text.dart';

class CalcCardPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = useProvider(calcCardViewModelProvider);
    final stopWatchState = useProvider(stopWatchTextProvider);
    useEffect(() {
      viewModel.isStart = false;
      stopWatchState.stop();
      stopWatchState.reset();
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('計算カード')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StopWatchText(),
              SizedBox(
                height: 300,
                child: viewModel.isStart ? _buildPageView() : _buildStartView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartView() {
    final viewModel = useProvider(calcCardViewModelProvider);
    final stopWatchState = useProvider(stopWatchTextProvider);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('計算を始めるよ', style: TextStyle(fontSize: 48)),
          ElevatedButton(
            onPressed: () {
              viewModel.start();
              stopWatchState.start();
            },
            child: const Text('スタート', style: TextStyle(fontSize: 36)),
          ),
        ],
      ),
    );
  }

  Widget _buildPageView() {
    final viewModel = useProvider(calcCardViewModelProvider);
    final stopWatchState = useProvider(stopWatchTextProvider);
    final calcList = viewModel.calcList();
    final viewList = calcList
        .map((e) => e.split('='))
        .map((e) => _buildCalcCard(front: e[0], rear: e[1]))
        .toList()
          ..add(Card(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  stopWatchState.stop();
                  viewModel.stop();
                },
                child: const Text('おわり', style: TextStyle(fontSize: 48)),
              ),
            ),
          ));

    final pageController = usePageController(initialPage: 0);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: PageView(
        controller: pageController,
        children: viewList,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildCalcCard({required String front, required String rear}) {
    return CalcCard(
      front: Text(front, style: const TextStyle(fontSize: 48)),
      rear: Text(rear, style: const TextStyle(fontSize: 48)),
      color: Colors.blue,
    );
  }
}
