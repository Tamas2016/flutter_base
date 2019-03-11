import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper/layout_utils.dart';
import 'package:flutter_demo/view/day4/layout_test_view.dart';

class LayoutTestPage extends StatefulWidget {
  LayoutTestPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LayoutTestState createState() => _LayoutTestState();
}

class _LayoutTestState extends State<LayoutTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
//      body: Container(
//        height: 70,
//        color: Colors.white,
//        padding: EdgeInsets.all(5),
//        child: rowLine2,
//      ),
    body:testList,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  //条目2
  var testList = ListView.builder(itemBuilder:(BuildContext context,int index){
    return Column(children: <Widget>[
      test4,Divider(height: 1,)
    ],);

  },itemCount: 30,
  );







}


var test4 = Card(
  child: Container(
    child: item4,
    color: Colors.white,
    height: 160,
    padding: EdgeInsets.all(10),
  ),

);

///新级级别布局1
///所以这个用Card包一下吧，三块一目了然
///背景有助于你的排布，最后当然要把背景去掉

var test3 = Card(
    child: Container(
        height: 95,
        color: Colors.white,
        padding: EdgeInsets.all(5),
        child: rowLine3));


///入门级布局2：
var rowLine2 = Row(
  children: <Widget>[
    Padding(
      padding: EdgeInsets.all(5),
      child: headAvatar,
    ),
    Expanded(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: centerInfo,
        )),
    endInfo
  ],
);


///入门级布局1：
var rowLine = Row(
  children: <Widget>[
    Icon(
      Icons.extension,
      color: Colors.blue,
    ),
    Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          '好友微信',
          style: TextStyle(fontSize: 18),
        ),
      ),
    ),
    Icon(Icons.arrow_forward)
  ],
);