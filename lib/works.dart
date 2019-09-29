import 'package:flutter/material.dart';
import 'dart:math' as math;

class _Props {
  static TextStyle textStyle = TextStyle(
    fontSize: 72,
    height: 1.2,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

class Works extends StatefulWidget {
  @override
  _WorksState createState() => _WorksState();
}

class _WorksState extends State<Works> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GridView.count(
          padding: const EdgeInsets.all(24),
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          children: List.generate(9, (index) {
            return Placeholder();
          }),
        ),
        Center(
          child: Transform(
            transform: Matrix4.rotationZ(0.1 * math.pi),
            origin: Offset(MediaQuery.of(context).size.width / 2, 0),
            child: Text(
              "ここには\n作品が\n入る予定",
              style: _Props.textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
