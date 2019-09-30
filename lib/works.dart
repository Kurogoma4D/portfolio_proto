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
        ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 36,
            vertical: 72,
          ),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(width: 36);
          },
          itemCount: 9,
          itemBuilder: (context, index) {
            return Placeholder();
          },
        ),
        Center(
          child: Transform(
            transform: Matrix4.rotationZ(0.1 * math.pi),
            origin: Offset(MediaQuery.of(context).size.width / 2, 200),
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
