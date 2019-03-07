

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper/common_path.dart';
import 'package:flutter_demo/helper/help_view.dart';
class AnimaView extends CustomPainter {


  Paint mPaint ;
  BuildContext context;
  double _R;
  int _num;

  AnimaView(this.context, {double r,int num,Color color}){
    mPaint = new Paint();
    mPaint.color = color;
    _R =r;
    _num = num;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;
    drawGrid(canvas,winSize);
    drawCoo(canvas, new Size(160, 320), winSize);
    canvas.translate(160, 320);
//    canvas.drawPath(nStarPath(5, _R, 50), mPaint);

    canvas.drawPath(nStarPath(_num, _R, 50), mPaint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
  }





}