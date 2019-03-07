import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper/color_utils.dart';
import 'package:flutter_demo/view/anima_view.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xffcbc2cb),
        elevation: 4,
        //阴影
        centerTitle: true,
        toolbarOpacity: 1.0, //透明度
      ),

    ///AspectRatio   定比例的容器width/height=aspectRatio
    body: Container(
      width: 200.0,
      child: new AspectRatio(aspectRatio: 1.5,
      child: new Container(
        color: Colors.red,
      ),),
    ),

      ///FractionallySizedBox
      ///儿子随爷爷，父亲(FractionallySizedBox)中间倒把手
      ///可以实现爷爷和孙子之间的尺寸比例联系
//      body: Container(
//       color: Colors.blue,
//        height: 150.0,
//        width: 150.0,
//        child: new FractionallySizedBox(
//          alignment: Alignment.center,
//          widthFactor: 1.5,
//          heightFactor: 0.5,
//          child: new Container(
//            color:Colors.red ,
//          ),
//
//        ),
//      ),

      ///  Baseline
//      body: Row(
//        children: formTextList(4),
//      ),

      ///  ListBody 竖直定
//      body: Column(
//        children: <Widget>[
//          ListBody(
//            mainAxis: Axis.vertical,
//            reverse: false,
//            children: formColorList(10),
//          )
//        ],
//      ),

      ///  ListBody 水平定
//      body: Row(
//        children: <Widget>[
//          ListBody(
//            mainAxis: Axis.horizontal,
//            reverse: false,
//            children: formColorList(4),
//          )
//        ],
//      ),

      ///  GridView.count
//      body: GridView.count(
//        crossAxisCount: 4,
//        scrollDirection: Axis.horizontal,
//        children: List.generate(
//            100,
//                (index){
//              return Card(
//                child: Center(child: Text('TiTi $index'),),
//              );
//            }),
//      ),

      ///  ListView.builder
      ///  scrollDirection  Axis.vertical, Axis.horizontal
//      body: ListView.builder(
//        itemCount: 20,
//        padding: EdgeInsets.all(8.0),
//        scrollDirection: Axis.vertical,
//        itemExtent: 60.0,
//        itemBuilder:(BuildContext context,int index){
//          return Card(
//            child: Center(child: Text('TiTi $index'),),
//          );
//        } ,
//      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(
          Icons.airplanemode_active,
          color: Colors.white,
        ),
      ),
    );
  }

  ///动态生成Widget数组(可别傻傻的cv,60个Container)
  formColorList(int count) {
    var random = new Random();
    var list = <Widget>[];

    for (int i = 0; i < count; i++) {
      list.add(new Container(
          width: 80 * (random.nextDouble() + 0.3),
          height: 30,
          color: randomRGB(),
          child: Center(
            child: Text("${i + random.nextInt(100)}"),
          )));
    }
    return list;
  }

  formTextList(int count) {
    var random = new Random();
    var li = <Widget>[];

    for (int i = 0; i < count; i++) {
      li.add(new Baseline(
        baselineType: TextBaseline.alphabetic,
        child: new Text(
          'Toly',
          style: new TextStyle(
            fontSize: 20.0 + random.nextInt(40),
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        baseline: 80,
      ));
    }
    return li;
  }
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
