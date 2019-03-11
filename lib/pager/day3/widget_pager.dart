import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper/color_utils.dart';
import 'package:flutter_demo/view/anima_view.dart';

class WidgetPage extends StatefulWidget {
  WidgetPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WidgetPageState createState() => _WidgetPageState();
}

var numLi = [1, 2, 3, 4, 5];
var chartLi = ["Apple", "Boy", "Cat", "Dog"];
var iconInfoMap = {
  "首页": Icon(Icons.home),
  "消息": Icon(Icons.message),
  "动态": Icon(Icons.toys),
  "我的": Icon(Icons.perm_identity),
};

var scContext; //先声明一下Scaffold的context

class _WidgetPageState extends State<WidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.lightBlue,
        bottom: tabBar,
        elevation: 8,
        //阴影
        centerTitle: true,
        toolbarOpacity: 0.4, //透明度
      ),
      body: Builder(builder: (context) {
        scContext = context;
//        return tabBarView;
//        return Column(
//          children: <Widget>[
//            textField,
//            checkbox,
//            slide,
//            _switch,
//            radios,
//            chip
//          ],
//        );
        return flex_test;
      }),
      drawer: draw,
      bottomNavigationBar: bottomNavigationBar,

      ///为了查看模式，改一次，看一次，千万不要这样，即费时间，比较的效果又差
      ///学会用数组或map去动态生成,让变化去应对变化，才能以不变应万变。

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          //一开始打开总是报错，貌似是context的锅，
          Scaffold.of(scContext).showSnackBar(snackBar);
//        Scaffold.of(scContext).showBottomSheet(bottomSheet.builder);
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.audiotrack,
          color: Colors.white,
          semanticLabel: "TODO",
        ),
      ),
    );
  }



  ///TabBar
  var tabBar = TabBar(
    labelStyle: TextStyle(fontSize: 20),
    labelColor: Color(0xfff64c19),
    unselectedLabelColor: Colors.white,
    tabs: chartLi.map((item) {
      return Container(
        alignment: AlignmentDirectional.center,
        child: Text(item),
        height: 40,
      );
    }).toList(),
  );

  ///TabBarView
  var tabBarView = new TabBarView(
    children: chartLi.map((text) {
      return new Center(
        child: new Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      );
    }).toList(),
  );

  ///BottomNavigationBar--底部Bar
  var bottomNavigationBar = BottomNavigationBar(
    items: () {
      var items = <BottomNavigationBarItem>[];
      iconInfoMap.forEach((k, v) {
        items.add(BottomNavigationBarItem(
            icon: v, title: Text(k), backgroundColor: Color(0xff49B1FB)));
      });
      return items;
    }(),
    currentIndex: 2,
    onTap: (pos) {
      print(pos);
    },
  );

  ///Drawer
  var draw = Drawer(
    elevation: 5,
    child: Container(
      alignment: Alignment.center,
      color: Color(0xff99c6f9),
      child: Text(
        'hello world',
        style: TextStyle(fontSize: 20),
      ),
    ),
  );

  ///SnackBar
  var snackBar = SnackBar(
    backgroundColor: Color(0xffffbbaa),
    content: Text('有一条信息'),
    duration: Duration(seconds: 1),
    action: SnackBarAction(
        label: '确定',
        onPressed: () {
          print('点击了');
        }),
  );

  ///BottomSheet
  var bottomSheet = BottomSheet(
    onClosing: () {},
    builder: (context) => (Container(
          color: Color(0xffABF5E0),
          child: Wrap(
            children: <Widget>[
              Center(
                child: Text("1+1=2"),
              ),
              Center(
                child: Text("2+2=4"),
              ),
              Center(
                child: Text("4+4=8"),
              ),
              Center(
                child: Text("8+8=16"),
              ),
            ],
          ),
        )),
  );

  ///TextField Flutter版EditText
  var textField = TextField(
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    maxLines: 1,
    cursorColor: Colors.orangeAccent,
    cursorWidth: 10,
    style: TextStyle(fontSize: 20, color: Colors.lightBlue),
    onChanged: (str) {
      print(str);
    },
    onEditingComplete: () {
      print("onEditingComplete");
    },
    onSubmitted: (str) {
      print("onSubmitted $str");
    },
    onTap: () {
      print("onTap");
    },
  );

  ///Checkbox
  var checkbox = Checkbox(
    value: true,
    activeColor: Colors.orange,
    onChanged: (value) {
      print(value);
    },
  );

  ///Slider
  var slide = Slider(
    min: 100,
    max: 200,
    value: 180,
    activeColor: Colors.green,
    inactiveColor: Colors.grey,
    onChanged: (value) {
      print(value);
    },
    onChangeStart: (v) {},
    onChangeEnd: (v) {},
  );

  ///Switch
  var _switch = Switch(
    value: true,
    activeColor: Colors.greenAccent,
    activeTrackColor: Colors.black,
    activeThumbImage: AssetImage("images/icon_qq.png"),
    onChanged: (bool value) {
      print(value);
    },
  );

  ///Radio
  var radios = Wrap(
      children: numLi.map((i) {
    return Radio<int>(
      value: i,
      groupValue: 5,
      onChanged: (int value) {},
    );
  }).toList());

  ///Chip + CircleAvatar
  var chip = Chip(
    backgroundColor: Color(0xffE5E5E5),
    padding: EdgeInsets.all(4),
    avatar: CircleAvatar(
      backgroundColor: Colors.lightBlue.shade400,
      child: new Text(
        '王',
        style: TextStyle(fontSize: 10.0, color: Colors.white),
      ),
    ),
    label: Text('八蛋'),
  );

  ///Flex布局详解 Row和Column的老爸
  ///mainAxis(主轴) Alignment对齐 CrossAxis主轴的交错轴

  var flex_test = Flex(
    mainAxisAlignment: MainAxisAlignment.end,
    direction: Axis.horizontal,
    children: <Widget>[
      Expanded(
        child: c1,
      ),
      Expanded(
        child: c2,
      ),
      Expanded(
        child: c3,
      ),
    ],
  );
}

var c1 = Container(
  width: 50,
  height: 50,
  color: Colors.blue,
);
var c2 = Container(
  width: 50,
  height: 80,
  color: Colors.red,
);
var c3 = Container(
  width: 150,
  height: 50,
  color: Colors.yellow,
);

class MarginFlowDelegate extends FlowDelegate {
  EdgeInsets _margin = EdgeInsets.zero; //成员变量_margin

  MarginFlowDelegate(this._margin);

//绘制孩子的方法
  @override
  void paintChildren(FlowPaintingContext context) {
    var offsetX = _margin.left;
    var offsetY = _margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + offsetX + _margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX = w + _margin.left;
      } else {
        offsetX = _margin.left;
        offsetY +=
            context.getChildSize(i).height + _margin.top + _margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(offsetX, offsetY, 0.0));
        offsetX += context.getChildSize(i).width + _margin.left + _margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
