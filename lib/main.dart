import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() {
//  runApp(MyApp());
  runApp(LogoApp());
}

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status) {

        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
    ..addStatusListener((state) => print('$state'));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => GrowTransition(
    child: LogoWidget(),
    animation: animation,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: animation.value,
      width: animation.value,
      child: FlutterLogo(),
    ));
  }
}

class LogoWidget extends StatelessWidget {
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: FlutterLogo(),
  );
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child,
    ),
  );
}

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    Color color = Theme.of(context).primaryColor;
//    Widget buttonSection = Container(
//        child: Row(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        _buildButtonColumn(color, Icons.call, 'CALL'),
//        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//        _buildButtonColumn(color, Icons.share, 'SHARE'),
//      ],
//    ));
//
//    Widget textSection = Container(
//      padding: const EdgeInsets.all(32),
//      child: Text(
//        'Lake Oeschinen lies at the foot of Bluemlisalp in the Bernese '
//            'Alps. Situated 1,578 meters above sea level, it is one of the '
//            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
//            'half-hour walk through pastures and pine forest, leads you to the '
//            'enjoyed here include rowing, and riding the summer toboggan run.',
//        softWrap: true,
//      ),
//    );
//
//    return MaterialApp(
//        title: 'Flutter Layout Demo',
//        home: Scaffold(
//            appBar: AppBar(
//              title: Text('Flutter Layout Demo'),
//            ),
//            body: ListView(
//              children: <Widget>[
//                Image.asset(
//                    'images/lake.jpg',
//                  width: 600,
//                  height: 240,
//                  fit: BoxFit.cover,
//                ),
//                titleSection,
//                buttonSection,
//                textSection,
//              ],
//            )));
//  }
//
//  Widget titleSection = Container(
//    padding: const EdgeInsets.all(32),
//    child: Row(
//      children: <Widget>[
//        Expanded(
//          /* 1 */
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              /* 2 */
//              Container(
//                padding: const EdgeInsets.only(bottom: 8),
//                child: Text(
//                  'Oeschinen Lake Campground',
//                  style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//              ),
//              Text(
//                'Kandersteg, Switzerland',
//                style: TextStyle(
//                  color: Colors.grey[500],
//                ),
//              )
//            ],
//          ),
//        ),
//        /* 3 */
//        FavoriteWidget(),
//      ],
//    ),
//  );
//
//  Column _buildButtonColumn(Color color, IconData icon, String label) {
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Icon(
//          icon,
//          color: color,
//        ),
//        Container(
//          margin: const EdgeInsets.only(top: 8),
//          child: Text(
//            label,
//            style: TextStyle(
//                fontSize: 12, fontWeight: FontWeight.w400, color: color),
//          ),
//        )
//      ],
//    );
//  }
//}
//class FavoriteWidget extends StatefulWidget {
//  @override
//  _FavoriteWidgetState createState() => _FavoriteWidgetState();
//}
//
//class _FavoriteWidgetState extends State<FavoriteWidget> {
//  bool _isFavorited = true;
//  int _favoriteCount = 41;
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        Container(
//          padding: EdgeInsets.all(0),
//          child: IconButton(
//            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
//            color: Colors.red[500],
//            onPressed: _toggleFavorite,
//          ),
//        ),
//        SizedBox(
//          width: 18,
//          child: Container(
//            child: Text('$_favoriteCount')
//          )
//        )
//      ],
//    );
//  }
//  void _toggleFavorite() {
//    setState(() {
//      if (_isFavorited) {
//        _favoriteCount -= 1;
//        _isFavorited = false;
//      } else {
//        _favoriteCount += 1;
//        _isFavorited = true;
//      }
//    });
//  }
//}
