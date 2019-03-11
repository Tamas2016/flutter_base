import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/pager/day1/anim_pager.dart';
import 'package:flutter_demo/pager/day1/clock_pager.dart';
import 'package:flutter_demo/pager/day2/layout_pager.dart';
import 'package:flutter_demo/pager/day1/run_ball_pager.dart';
import 'package:flutter_demo/pager/day2/list_pager.dart';
import 'package:flutter_demo/pager/day2/text_pager.dart';
import 'package:flutter_demo/pager/day3/image_pager.dart';
import 'package:flutter_demo/pager/day3/widget_pager.dart';
import 'package:flutter_demo/pager/day4/layout_test_pager.dart';
import 'package:flutter_demo/view/star_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.lightBlue,
      ),
//      home: MyHomePage(title: '小虎电竞'),
//      home: AnimaPage(title: '小虎电竞'),
//      home: RunBallPage(),
//      home: ClockPage(),
//      home: TextPage(title: '文字游戏'),
//      home: LayoutPage(title: '控件之间'),
//      home: ListPage(title: '我的列表'),
//      home: ImagePage(title: '照片流'),
        //注意一点：主页的Scaffold标签要让DefaultTabController包一下，否则会报错
//      home: new DefaultTabController(length: 4, child: WidgetPage(title:"风之控件"))
      home: LayoutTestPage(title: 'DEMO'),
    );
  }
}




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  Color _color = Colors.black;

  void _changeColor(){
    setState(() {
      _color = randomRGB();
    });
  }
  //-----------随机颜色-------------------
  Color randomRGB() {
    Random random = new Random();
    int r = 30+random.nextInt(200);
    int g = 30+random.nextInt(200);
    int b = 30+random.nextInt(200);
    return Color.fromARGB(255, r, g, b);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomPaint(
        painter: StarView(context,_color),
      ),

//      body: Center(
//
//        child: Column(
//
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeColor,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



