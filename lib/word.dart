import 'package:flutter/material.dart';

class _Props {
  // static String quote = "なりたかった自分になるのに\n遅すぎるということはない。";
  // static String author = "ジョージ・エリオット";
  static String quote = "It is never too late to be what\nyou might have been.";
  static String author = "George Eliot";

  static TextStyle quoteStyle = TextStyle(
    fontSize: 36,
    height: 1.2,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle authorStyle = TextStyle(
    fontSize: 24,
    color: Colors.white,
  );
}

class Word extends StatefulWidget {
  @override
  _WordState createState() => _WordState();
}

class _WordState extends State<Word> {
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewY(-0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_Props.quote, style: _Props.quoteStyle),
            const SizedBox(height: 24),
            Text(
              _Props.author,
              style: _Props.authorStyle,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
