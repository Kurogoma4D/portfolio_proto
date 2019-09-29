import 'package:flutter/material.dart';
import 'dart:html' as html;

class _Props {
  static String avatar =
      "https://www.gravatar.com/avatar/2a56039e69ff01ccaed212c455d06003";
  static String school = "2013/4~     木更津工業高等専門学校 情報工学科\n" +
      "2016/10~   吉澤研究室(メディアデザイン実験室) 所属\n" +
      "2018/4~      木更津工業高等専門学校 制御・情報システム工学専攻";
  static String bio =
      "自主制作としてソフトウェア開発をしたり、3DCGで静止画を制作したりしている。高専生活の過程でX-R技術やデザインに興味を持ち、メディアデザインを対象とする研究室に所属する。現在はAR技術を用いたスマートフォンアプリとUser Interfaceに関する研究を続けている。\n趣味はPCゲーム、ポータブルオーディオなど。";
  static List<Map<String, String>> links = [
    {
      "name": "Qiita",
      "url": "https://qiita.com/Kurogoma4D",
      "image":
          "https://img.icons8.com/material-rounded/96/000000/twitter-squared.png",
    },
    {
      "name": "GitHub",
      "url": "https://github.com/Kurogoma4D/",
      "image":
          "https://img.icons8.com/material-rounded/96/000000/twitter-squared.png",
    },
    {
      "name": "note",
      "url": "https://note.mu/krgm4d",
      "image":
          "https://img.icons8.com/material-rounded/96/000000/twitter-squared.png",
    },
    {
      "name": "3DCG",
      "url": "https://kurogoma-show.myportfolio.com/work",
      "image":
          "https://img.icons8.com/material-rounded/96/000000/twitter-squared.png",
    },
    {
      "name": "Twitter",
      "url": "https://twitter.com/Krgm4D",
      "image":
          "https://img.icons8.com/material-rounded/96/000000/twitter-squared.png",
    },
  ];
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextStyle _nameStyle = const TextStyle(
    fontSize: 36,
    height: 1,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  TextStyle _detailStyle = const TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildName(),
          const SizedBox(height: 48),
          Text(_Props.school, style: _detailStyle),
          const SizedBox(height: 12),
          Text(_Props.bio, style: _detailStyle),
        ],
      ),
    );
  }

  Widget _buildName() {
    return Center(
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.4))
              ],
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage(_Props.avatar),
            ),
          ),
          const SizedBox(height: 32),
          Text('Kurogoma4D', style: _nameStyle),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            children: List.generate(
              _Props.links.length,
              (index) => _buildLinks(_Props.links[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinks(Map<String, String> link) {
    return GestureDetector(
      onTap: () => html.window.open(link["url"], link["name"]),
      child: Container(
        constraints: BoxConstraints(maxHeight: 48),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color.fromRGBO(220, 220, 220, 1),
          shape: BoxShape.circle,
        ),
        child: Image.network(link["image"]),
      ),
    );
  }
}
