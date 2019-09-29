import 'package:flutter/material.dart';

class _Props {
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

  static List<Map<String, String>> links = [
    {"Qiita": "https://qiita.com/Kurogoma4D"},
    {"GitHub": "https://github.com/Kurogoma4D/"},
    {"note": "https://note.mu/krgm4d"},
    {"3DCG": "https://kurogoma-show.myportfolio.com/work"},
  ];
}

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }
}
