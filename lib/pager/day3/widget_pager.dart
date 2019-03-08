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

var chartLi = ["Apple", "Boy", "Cat", "Dog"];
var iconInfoMap = {
  "首页":Icon(Icons.home),
  "消息":Icon(Icons.message),
  "动态":Icon(Icons.toys),
  "我的":Icon(Icons.perm_identity),
};


var scContext;//先声明一下Scaffold的context
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
      body: Builder(builder: (context){
        scContext = context;
        return tabBarView;
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
    items: (){
      var items = <BottomNavigationBarItem>[];
      iconInfoMap.forEach((k,v){
            items.add(BottomNavigationBarItem(
                icon: v,title: Text(k),backgroundColor: Color(0xff49B1FB)));
          });
      return items;
    }(),
    currentIndex: 2,
    onTap: (pos){
      print(pos);
    },
  );


  ///Drawer
  var draw =Drawer(
    elevation: 5,
    child: Container(
      alignment: Alignment.center,
      color:  Color(0xff99c6f9),
      child:Text('hello world',style: TextStyle(fontSize: 20),),
    ),
  );


  var snackBar =SnackBar(
    backgroundColor: Color(0xffffbbaa),
    content: Text('有一条信息'),
    duration: Duration(seconds: 3),
    action: SnackBarAction(label: '确定', onPressed: (){
      print('点击了');
    }),
  );

}


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
