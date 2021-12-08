import 'package:flutter/material.dart';

class RoundButtonWidget extends StatelessWidget {
  RoundButtonWidget({
    required this.color,
    required this.content,
    required this.isTapped,
  });

  final Color
      color; // final, wenn wir es einmal gezeichnet haben, können wir es nicht mehr ändern.
  final Widget content;
  final Function() isTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // dedectiere Knopfdrücke
      onTap: isTapped, // erstmal leer
      child: Container(
        // kind ist ein kontainer
        child: content, // kind ist ein icon(das jeweilige icon)
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(70),
        ),
      ),
    );
  }
}
