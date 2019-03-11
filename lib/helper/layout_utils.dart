
//正常文字

import 'dart:ui';

import 'package:flutter_demo/helper/color_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//正常文字
var commonStyle = TextStyle(color:Color(0xff000000), fontSize: 18);
var littleStyle = TextStyle(color: Colors.black, fontSize: 16);
//灰色较小文字
var infoStyle = TextStyle(color: Color(0xff999999), fontSize: 13);
//较大文字
var bigStyle = TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
//btn文字
var btnStyle = TextStyle(color: Color(0xffffffff), fontSize: 13);






//添加测试背景色
bg(Widget w,[Color color]){
  return Container (color: color??randomARGB(),child: w,);
}


pd(Widget w, {double l, double t, double r, double b}) {
  return Padding(
    child: w,
    padding: EdgeInsets.fromLTRB(l ?? 0, t ?? 0, r ?? 0, b ?? 0),
  );
}

//全部padding
pda(Widget w, double a) {
  return Padding(
    child: w,
    padding: EdgeInsets.all(a),
  );
}

//水平、竖直的两个padding
pdhv(Widget w, {double h, double v}) {
  return Padding(
    child: w,
    padding: EdgeInsets.fromLTRB(h ?? 0, v ?? 0, h ?? 0, v ?? 0),
  );
}