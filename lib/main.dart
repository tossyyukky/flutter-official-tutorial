import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    ));
    return MaterialApp(
        title: 'Flutter Layout Demo',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter Layout Demo'),
            ),
            body: Column(
              children: <Widget>[
                titleSection,
                buttonSection,
              ],
            )));
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        Expanded(
          /* 1 */
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /* 2 */
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          ),
        ),
        /* 3 */
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Text('41'),
      ],
    ),
  );

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}
