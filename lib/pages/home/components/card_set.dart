import 'package:flutter/material.dart';

class CardSet extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  CardSet({
    required this.text,
    this.color = Colors.white,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 16, 0),
              child: Icon(Icons.circle, color: Colors.white, size: 36),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 16, 24, 16),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
