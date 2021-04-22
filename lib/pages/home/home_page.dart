import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../calc_card/calc_card_view_model.dart';
import 'components/card_set.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          _buildTitle(),
          _buildCardDeckList(),
        ]),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(8, 24, 8, 24),
      child: const Text(
        '計算カード',
        style: TextStyle(fontSize: 36),
      ),
    );
  }

  Widget _buildCardDeckList() {
    final context = useContext();
    final flashCardVM = useProvider(calcCardViewModelProvider);
    final deckList = <CardSet>[
      CardSet(
        text: 'たしざん',
        color: Colors.lightBlueAccent,
        onTap: () {
          flashCardVM.calcMode = CalcCardCalcMode.add;
          Navigator.pushNamed(context, '/calc_card');
        },
      ),
      CardSet(
        text: 'たしざん\nくりあがり',
        color: Colors.amberAccent,
        onTap: () {
          flashCardVM.calcMode = CalcCardCalcMode.addUp;
          Navigator.pushNamed(context, '/calc_card');
        },
      ),
      CardSet(
        text: 'ひきざん',
        color: Colors.pinkAccent,
        onTap: () {
          flashCardVM.calcMode = CalcCardCalcMode.sub;
          Navigator.pushNamed(context, '/calc_card');
        },
      ),
      CardSet(
        text: 'ひきざん\nくりさがり',
        color: Colors.greenAccent,
        onTap: () {
          flashCardVM.calcMode = CalcCardCalcMode.subDown;
          Navigator.pushNamed(context, '/calc_card');
        },
      ),
      CardSet(
        text: '九九',
        color: Colors.purpleAccent,
        onTap: () {
          flashCardVM.calcMode = CalcCardCalcMode.multi;
          Navigator.pushNamed(context, '/calc_card');
        },
      ),
      CardSet(
        text: '九九・ばらばら',
        color: Colors.purpleAccent,
        onTap: () {
          flashCardVM.calcMode = CalcCardCalcMode.multiRandom;
          Navigator.pushNamed(context, '/calc_card');
        },
      ),
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: deckList.length,
        itemBuilder: (context, index) {
          return deckList[index];
        },
      ),
    );
  }
}
