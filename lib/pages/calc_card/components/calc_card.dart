import 'dart:math';

import 'package:flutter/material.dart';

class CalcCard extends StatefulWidget {
  final Key? key;
  final Widget front;
  final Widget rear;
  final Color color;
  final Color rearColor;

  CalcCard({
    this.key,
    required this.front,
    required this.rear,
    this.color = Colors.white,
    this.rearColor = Colors.white,
  });

  @override
  State<StatefulWidget> createState() => _CalcCardState();
}

class _CalcCardState extends State<CalcCard> {
  double frontAngle = 0.0;
  double backAngle = 180.0;
  final controller = PageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final value = controller.offset / controller.position.maxScrollExtent;
      final frontValue = min(1.0, value * 2);
      final backValue = min(1.0, 2 - value * 2);

      setState(() {
        frontAngle = -180.0 * frontValue;
        backAngle = 180.0 * backValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: controller,
      children: [
        _buildFrontCard(),
        _buildBackCard(),
      ],
    );
  }

  Widget _buildFrontCard() {
    return Container(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(pi / 360 * frontAngle),
      transformAlignment: Alignment.bottomCenter,
      child: Card(
        color: widget.color,
        child: widget.front,
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(pi / 360 * backAngle),
      transformAlignment: Alignment.topCenter,
      child: Card(
        color: widget.rearColor,
        child: widget.rear,
      ),
    );
  }
}
