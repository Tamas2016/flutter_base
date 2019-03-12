//左边头像
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper/color_utils.dart';
import 'package:flutter_demo/helper/help_view.dart';
import 'package:flutter_demo/helper/layout_utils.dart';

var box = Container(
  width: 100,
  height: 100,
  color: randomRGB(),
);

//可见坐标是相对于屏幕顶点的
var ctr1_test = GestureDetector(
  child: box,
  onTap: () {
    print('onTap');
  },
  onTapDown: (d) {
    print('onTapDown' + d.globalPosition.toString());
  },
  onTapUp: (d) {
    print('onTapUp' + d.globalPosition.toString());
  },
  onTapCancel: () {
    print('onTapCancel');
  },
);

var ctrl_test2 = GestureDetector(
  child: box,
  onDoubleTap: () {
    print('onDoubleTap');
  },
  onLongPress: () {
    print('onLongPress');
  },
  onLongPressUp: () {
    print('onLongPressUp');
  },
);

var ctrl_test3 = GestureDetector(
  child: box,
  onVerticalDragDown: (d) {
    print("onVerticalDragDown---" + d.globalPosition.toString());
  },
  onVerticalDragStart: (d) {
    print("onVerticalDragStart---" + d.globalPosition.toString());
  },
  onVerticalDragUpdate: (d) {
    print("onVerticalDragUpdate---" + d.globalPosition.toString());
  },
  onVerticalDragCancel: () {
    print("onVerticalDragCancel---" );
  },
);







