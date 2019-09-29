import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_proto/profile.dart';
import 'package:portfolio_proto/skills.dart';
import 'package:portfolio_proto/word.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class _Props {
  static List<Color> colors = [
    const Color.fromRGBO(52, 73, 94, 1),
    const Color.fromRGBO(0, 0, 0, 0),
    const Color.fromRGBO(0, 131, 143, 1),
    const Color.fromRGBO(44, 62, 80, 1),
  ];

  static List<String> titles = ["作品", "人", "技術"];

  List<bool> isActive = List.generate(4, (i) => false);
  static String backgroundImage = "assets/images/backgroundImage.png";
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;
  int _tabIndex = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            _Props.backgroundImage,
            fit: BoxFit.cover,
          ),
          PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _controller,
            itemCount: 4,
            itemBuilder: (context, index) => _buildListItem(context, index),
            onPageChanged: (index) => setState(() {
              if (index < 3) {
                _tabIndex = index;
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        showUnselectedLabels: true,
        backgroundColor: Color.fromRGBO(52, 73, 94, 1),
        onTap: (index) => setState(() {
          _tabIndex = index;
          _controller.animateToPage(index,
              duration: const Duration(milliseconds: 120),
              curve: Curves.easeIn);
        }),
        items: List.generate(_Props.titles.length, (index) {
          return BottomNavigationBarItem(
            icon: Center(),
            title: Text(
              _Props.titles[index],
              style: TextStyle(color: Colors.white),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: _Props.colors[index],
      child: _buildContent(index),
    );
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return Center();
      case 1:
        return Profile();
      case 2:
        return Skills();
      case 3:
        return Word();
      default:
        return Center();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
