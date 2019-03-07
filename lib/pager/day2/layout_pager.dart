import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper/color_utils.dart';
import 'package:flutter_demo/view/anima_view.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xffcb2231),
        elevation: 12,
        //阴影
        centerTitle: false,
        toolbarOpacity: 1.0, //透明度
      ),
      body: Wrap(
        spacing: 8.0,// 列间距
       runSpacing: 4.0,//行间距
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children:formColorList(50),
      ),


      ///Wrap css的flex有九分相似
//      body: Wrap(
//        spacing: 8.0,// 列间距
//        runSpacing: 4.0,//行间距
//        direction: Axis.vertical,
//        crossAxisAlignment: WrapCrossAlignment.center,
//        children:formColorList(50),
//      ),

      ///流动容器 -- Flow
//      body: Flow(
//        delegate: MarginFlowDelegate(EdgeInsets.all(4)),
//        children: formColorList(60),
//      ),

      ///Table columnWidths:可以指定每列的宽度
      ///border:边线的样式
      ///children:通过TableRow来显示一行
//      body: Table(
//        columnWidths: const<int,TableColumnWidth>{
//          0:FixedColumnWidth(60.0),
//          1:FixedColumnWidth(100.0),
//          2:FixedColumnWidth(100.0),
//          3:FixedColumnWidth(80.0),
//        },
//        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//        border:
//        TableBorder.all(color: Color(0xff16daf1),width: 1.0,style: BorderStyle.solid),
//        children: const <TableRow>[
//          TableRow(
//            children: <Widget>[
//              Center(child: Text('姓名')),
//              Center(child: Text('年龄')),
//              Center(child: Text('称号')),
//              Center(child: Text('武器')),
//            ],
//          ),
//          TableRow(
//            children: <Widget>[
//              Center(child: Text('渣男')),
//              Center(child: Text('12')),
//              Center(child: Text('疾风')),
//              Center(child: Text('剪刀')),
//            ],
//          ),
//          TableRow(
//            children: <Widget>[
//              Center(child: Text('孤傲')),
//              Center(child: Text('23')),
//              Center(child: Text('浪客')),
//              Center(child: Text('石头')),
//            ],
//          ),
//          TableRow(
//            children: <Widget>[
//              Center(child: Text('年兽')),
//              Center(child: Text('45')),
//              Center(child: Text('艾力')),
//              Center(child: Text('布')),
//            ],
//          ),
//        ],
//      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          semanticLabel: "TODO",
        ),
      ),
    );
  }


///动态生成Widget数组(可别傻傻的cv,60个Container)
  formColorList(int count) {
    var random = new Random();
    var list = <Widget>[];

    for(int i=0;i<count;i++) {
      list.add(new Container(
        width: 80 *(random.nextDouble() +0.3),
        height: 30,
        color: randomRGB(),
        child: Center(
          child:  Text("${i+random.nextInt(100)}"),
        )
      ));
    }
    return list;
  }
}

class MarginFlowDelegate extends FlowDelegate{

  EdgeInsets _margin = EdgeInsets.zero;//成员变量_margin

  MarginFlowDelegate(this._margin);

//绘制孩子的方法
  @override
  void paintChildren(FlowPaintingContext context) {
      var offsetX = _margin.left;
      var offsetY = _margin.top;
      for(int i =0;i<context.childCount;i++){
        var w = context.getChildSize(i).width +offsetX+_margin.right;
        if(w<context.size.width){
          context.paintChild(i,transform: new Matrix4.translationValues(offsetX,offsetY,0.0));
          offsetX = w +_margin.left;
        }else{
          offsetX = _margin.left;
          offsetY += context.getChildSize(i).height+_margin.top+_margin.bottom;
          context.paintChild(i,transform: new Matrix4.translationValues(offsetX,offsetY,0.0));
          offsetX += context.getChildSize(i).width + _margin.left + _margin.right;
        }
        
      }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate!=this;
  }
}
