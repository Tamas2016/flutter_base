import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper/color_utils.dart';
import 'package:flutter_demo/view/anima_view.dart';

class ImagePage extends StatefulWidget {
  ImagePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.lightGreen,
        elevation: 4,
        //阴影
        centerTitle: false,
        toolbarOpacity: 1.0, //透明度
      ),
      body: Row(
        children: <Widget>[
          outLineButton,
        ],
      ),

      ///为了查看模式，改一次，看一次，千万不要这样，即费时间，比较的效果又差
      ///学会用数组或map去动态生成,让变化去应对变化，才能以不变应万变。

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          semanticLabel: "TODO",
        ),
      ),
    );
  }

  ///OutlineButton是一个框型按钮
  var outLineButton = OutlineButton(
    onPressed: () {},
    child: Text("红楼梦"),
    color: Color(0xffF88B0A),
    highlightColor: Colors.blue,
    textColor: Color(0xff000000),
    borderSide: BorderSide(color: Color(0xff0A66F8), width: 2),
  );

  ///FlatButton  精简版的RaisedButton,没有阴影凸起效果
  var iconFlatBtn = FlatButton(
    onPressed: () {
      print("FlatButton click");
    },
    color: Color(0xff88b00a),
    child: Text('红楼梦'),
    highlightColor: Colors.blue,
  );

  ///RaisedButton  Android的内置Button基本上是一致的
  var iconRaiseBtn = RaisedButton(
    onPressed: () {
      print("RaisedButton click");
    },
    color: Color(0xff88b00a),
    child: Text('红楼梦'),
    highlightColor: Colors.blue,
  );

  /// ButtonBar
  var iconBtnBar = ButtonBar(
    alignment: MainAxisAlignment.end,
    children: <Widget>[],
  );

  /// IconButton
  var iconBtn = IconButton(
      icon: Icon(
        Icons.android,
        size: 40,
        color: Colors.deepPurpleAccent,
      ),
      tooltip: "android",
      highlightColor: Colors.red,
      //点击时间稍长的时候背景渐变到这个颜色
      splashColor: Colors.blue,
      //点击时一闪而过的颜色
      disabledColor: Colors.blueGrey,
      onPressed: () {
        print('clicked');
      });

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

  ///颜色混合模式--colorBlendMode
  //叠合模式数组
  var colorBlendMode = [
    BlendMode.clear,
    BlendMode.src,
    BlendMode.dst,
    BlendMode.srcOver,
    BlendMode.dstOver,
    BlendMode.srcIn,
    BlendMode.dstIn,
    BlendMode.srcOut,
    BlendMode.dstOut,
    BlendMode.srcATop,
    BlendMode.dstATop,
    BlendMode.xor,
    BlendMode.plus,
    BlendMode.modulate,
    BlendMode.screen,
    BlendMode.overlay,
    BlendMode.darken,
    BlendMode.lighten,
    BlendMode.colorDodge,
    BlendMode.colorBurn,
    BlendMode.hardLight,
    BlendMode.softLight,
    BlendMode.difference,
    BlendMode.exclusion,
    BlendMode.multiply,
    BlendMode.hue,
    BlendMode.saturation,
    BlendMode.color,
    BlendMode.luminosity,
  ];

  //循环生成Image控件
  formImgsColorBlendMode() {
    var imgLi = <Widget>[];
    colorBlendMode.forEach((mode) {
      imgLi.add(Column(
        children: <Widget>[
          Padding(
            child: Image(
              image: AssetImage('images/icon_moment.png'),
              width: 60,
              height: 60,
              color: Colors.red,
              colorBlendMode: mode,
            ),
            padding: EdgeInsets.all(4),
          ),
          Text(mode.toString().split('.')[1])
        ],
      ));
    });
    return imgLi;
  }

  ///图片的适应模式--BoxFit
  var fitMode = [
    BoxFit.none,
    BoxFit.contain,
    BoxFit.cover,
    BoxFit.fill,
    BoxFit.fitHeight,
    BoxFit.fitWidth,
    BoxFit.scaleDown
  ];

  //循环生成Image控件
  formImages() {
    var imgLi = <Widget>[];
    fitMode.forEach((fit) {
      imgLi.add(Container(
        width: 40,
        height: 60,
        color: randomRGB(),
        child: Image(
          image: AssetImage('images/icon_90.jpg'),
          fit: fit,
        ),
      ));
    });
    return imgLi;
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
