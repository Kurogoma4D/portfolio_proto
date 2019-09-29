import 'package:flutter/material.dart';

class _Props {
  static TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Colors.white,
  );
  static TextStyle subtitleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.white,
  );
  static TextStyle skillNameStyle = TextStyle(
    fontSize: 14,
  );
  static TextStyle skillDescriptionStyle = TextStyle(
    fontSize: 12,
  );
  static TextStyle poorSkillStyle = TextStyle(
    fontSize: 12,
    color: Color.fromRGBO(33, 33, 33, 1),
  );

  static List<Map<String, String>> skills = [
    {
      "name": "Flutter / Dart",
      "url": "https://img.icons8.com/ios/100/000000/programming.png",
      "description": "個人開発，業務開発で使用．勉強会にも参加するなど，個人的に注目度の高い技術．Redux使用経験あり．",
    },
    {
      "name": "HTML / CSS / JS",
      "url": "https://img.icons8.com/color/144/000000/javascript.png",
      "description":
          "個人開発，業務開発で使用．\n\n使用経験のあるツール：Gulp，yarn，Webpack，npm\n\n使用経験のあるライブラリ：enchant.js，three.js，React.js，AR.js，jQuery",
    },
    {
      "name": "Python",
      "url": "https://img.icons8.com/color/144/000000/python.png",
      "description":
          "3系：研究でのデータ処理・分析，業務開発で使用．\n2系：Cinema4Dのスクリプトとして使用．\n\n使用経験のあるツール・フレームワーク：Jupyter Notebook，IPython，Django",
    },
    {
      "name": "C言語",
      "url": "https://img.icons8.com/color/144/000000/c-programming.png",
      "description":
          "高専一年次より講義で使用．プログラミングの基礎，アルゴリズム，データ構造，組み込みプログラミング，ニューラルネットワークなど",
    },
  ];
  static List<Map<String, String>> designSkills = [
    {
      "name": "Cinema4D",
      "url": "https://img.icons8.com/ios/100/000000/programming.png",
      "description":
          "3DCG制作のときにメインで使用するツール．Octane Renderを使用したフォトリアル レンダリングを主に行う．Pythonを用いた外部連携も可能．",
    },
    {
      "name": "Adobe CC",
      "url": "https://img.icons8.com/color/144/000000/adobe-creative-cloud.png",
      "description":
          "よく使用するツール：Photoshop，Xd，Lightroom\n\n使用できるツール：Illustrator，Indesign，AfterEffects",
    },
  ];

  static List<String> poorSkills = [
    "C#",
    "C++",
    "Java",
    "PHP",
    "Golang",
    "Objective-C",
    "Processing",
    "Arduino"
  ];
}

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(children: [
              TextSpan(text: "プログラミング - ", style: _Props.titleStyle),
              TextSpan(text: "そこそこできる", style: _Props.subtitleStyle),
            ]),
          ),
          const Divider(thickness: 1, height: 1.6, color: Colors.white54),
          const SizedBox(height: 16),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 5,
            crossAxisSpacing: 12,
            shrinkWrap: true,
            children: List.generate(
                4, (index) => _buildGridItem(_Props.skills[index], context)),
          ),
          const SizedBox(height: 42),
          RichText(
            text: TextSpan(children: [
              TextSpan(text: "プログラミング - ", style: _Props.titleStyle),
              TextSpan(text: "さわったことある", style: _Props.subtitleStyle),
            ]),
          ),
          const Divider(thickness: 1, height: 1.6, color: Colors.white54),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            children: List.generate(
              8,
              (index) => Chip(
                label: Text(_Props.poorSkills[index]),
                backgroundColor: Color.fromRGBO(240, 240, 240, 1),
              ),
            ),
          ),
          const SizedBox(height: 42),
          Text("デザイン", style: _Props.titleStyle),
          const Divider(thickness: 1, height: 1.6, color: Colors.white54),
          const SizedBox(height: 16),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 5,
            crossAxisSpacing: 12,
            shrinkWrap: true,
            children: List.generate(2,
                (index) => _buildGridItem(_Props.designSkills[index], context)),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(Map<String, String> skill, BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.network(skill["url"]),
        ),
      ),
      onTap: () => _onPressed(skill, context),
    );
  }

  void _onPressed(Map<String, String> skill, BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(skill["name"]),
            content: Text(skill["description"]),
          );
        });
  }
}
