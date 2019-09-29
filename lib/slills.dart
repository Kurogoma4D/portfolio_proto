import 'package:flutter/material.dart';

class _Props {
  static TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: Color.fromRGBO(20, 20, 20, 1),
  );

  static TextStyle skillNameStyle = TextStyle(
    fontSize: 16,
  );
  static TextStyle skillDescriptionStyle = TextStyle(
    fontSize: 12,
  );
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
          Text("プログラミング", style: _Props.titleStyle),
          const Divider(thickness: 2, height: 1.0),
          const SizedBox(height: 16),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            shrinkWrap: true,
            children: List.generate(3, (index) => _buildGridItem()),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("hoge", style: _Props.skillNameStyle),
            const SizedBox(height: 8),
            Text("huga", style: _Props.skillDescriptionStyle),
          ],
        ),
      ),
    );
  }
}
