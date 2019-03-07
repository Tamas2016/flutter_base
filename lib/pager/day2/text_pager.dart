import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/view/anima_view.dart';

class TextPage extends StatefulWidget {
  TextPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xffcbf231),
        elevation: 12,
        //阴影
        centerTitle: true,
        toolbarOpacity: .6, //透明度
      ),
      body: Transform(
        origin: Offset(0, 200),
        transform: Matrix4.rotationZ(3.1415 / 4),
        child: Container(
          color: Color.fromARGB(100, 191, 21, 254),
          height: 150,
          width: 250,
          child: IndexedStack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Offstage(
                offstage: false,
                child:  Text("挪威的森林"),
              )

            ],
          ),
          margin: EdgeInsets.fromLTRB(15, 20, 5, 10),
//            padding: EdgeInsets.all(16),
        ),
      ),


      ///  Transform Matrix4.rotationZ
      ///  Offstage  offstage为true--隐藏，为false--显示
//      body: Transform(
//        origin: Offset(0, 200),
//        transform: Matrix4.rotationZ(3.1415 / 4),
//        child: Container(
//          color: Color.fromARGB(100, 191, 21, 254),
//          height: 150,
//          width: 250,
//          child: Stack(
//            alignment: Alignment.centerLeft,
//            children: <Widget>[
//              Offstage(
//                offstage: false,
//                child:  Text("挪威的森林"),
//              )
//
//            ],
//          ),
//          margin: EdgeInsets.fromLTRB(15, 20, 5, 10),
////            padding: EdgeInsets.all(16),
//        ),
//      ),


      ///  Stack Align Card
      ///  IndexedStack:按照索引来显示堆叠容器中的控件
//      body: Container(
//        color: Color.fromARGB(100, 191, 21, 254),
//        height: 150,
//        width: 250,
//        child: Stack(
//          alignment: Alignment.centerLeft,
//          children: <Widget>[
//            Text("挪威的森林"),
//            Align(
//              alignment: Alignment.topRight,
//              widthFactor: 2.5,
//              child: Card(
//                elevation: 10,
//                color: Color(0xffffffff),
//                child: Text('围城'),
//              ),
//            ),
//            Text('霍乱时期的爱情'),
////                Text('自控力'),
//          ],
//        ),
//        margin: EdgeInsets.fromLTRB(15, 20, 5, 10),
////            padding: EdgeInsets.all(16),
//      ),

      ///  Container Padding Center
//      body: Column(
//        children: <Widget>[
//          Container(
//            color: Color.fromARGB(100, 91, 211, 254),
//            height: 100,
//            width: 200,
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Text("挪威的森林"),
//            ),
//            margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
//            padding: EdgeInsets.all(16),
//          ),
//          Container(
//            color: Color.fromARGB(100, 191, 211, 254),
//            height: 100,
//            width: 200,
//            child: Center(
//              child: Text("挪威的森林"),
//            ),
//            margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
//            padding: EdgeInsets.all(16),
//          ),
//        ],
//      ),

      ///  Row Column Expanded
//      body:Row(
//        children: <Widget>[
//          Expanded(
//            child: Text("围城"),
//          ),
//          Expanded(
//            child: Text("霍乱时期的爱情"),
//          ),
//          Expanded(
//            child: Text("自控力"),
//          ),
//          Expanded(
//            child: Text("挪威的森林"),
//          ),
//        ],
//      ),
      /// AppBar Text TextStyle
//      body: Text(
//        "美国政府涉嫌入侵华为服务器",
//        maxLines: 1,
//        overflow: TextOverflow.fade,
//        style: TextStyle(
//          color: Colors.deepOrangeAccent,
//          fontSize: 20,
//          letterSpacing: 10,
//          fontWeight: FontWeight.bold,
//          background: Paint()..color = Colors.amberAccent,
//        ),
//      ),
      floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      elevation: 12,
      highlightElevation: 24,
      onPressed: () {},
      tooltip: 'Increment',
      child: Icon(
        Icons.clear,
        size: 40,
        color: Colors.white,
        semanticLabel: "TODO",
      )
      ,
    ),);
  }
}
