import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper/color_utils.dart';
import 'package:flutter_demo/helper/help_view.dart';
import 'package:flutter_demo/helper/layout_utils.dart';
import 'package:flutter_demo/view/day4/gusture_view.dart';
import 'package:flutter_demo/view/day4/layout_test_view.dart';

var balls = []; //小球合集

class GesturePage extends StatefulWidget {
  GesturePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GestureState createState() => _GestureState();
}

class _GestureState extends State<GesturePage> {
  var _downX;
  var _downY;
  var _upX;
  var _upY;

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text(widget.title),
    );
    var barTopHeight = MediaQueryData.fromWindow(window).padding.top;
    print(barTopHeight);
    var srf = Scaffold(
        appBar: appBar,
        body: CustomPaint(
          painter: CanvasView(context, _downX, _downY, _upX, _upY),
        ));

    return GestureDetector(
      child: srf,
      onTapDown: (d) {
        _downX = d.globalPosition.dx;
        _downY =
            d.globalPosition.dy - appBar.preferredSize.height - barTopHeight;
      },
      onPanUpdate: (d) {
        var pos = d.globalPosition;
        balls.add(new DrawCircle(pos.dx,
            pos.dy - appBar.preferredSize.height - barTopHeight, randomRGB()));

        _upX = d.globalPosition.dx;
        _upY = d.globalPosition.dy - appBar.preferredSize.height - barTopHeight;
        setState(() {});
      },
      onPanEnd: (d) {
        _downX = -10.0;
        _downY = -10.0;
        _upX = -10.0;
        _upY = -10.0;
        setState(() {});
      },
    );
  }
}

class DrawCircle {
  double x;
  double y;
  Color color;

  DrawCircle(this.x, this.y, this.color);
}

class CanvasView extends CustomPainter {
  BuildContext context;
  Paint mPaint;
  double _downX;
  double _downY;
  double _upX;
  double _upY;

  CanvasView(this.context, this._downX, this._downY, this._upX, this._upY) {
    mPaint = new Paint()
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    balls.forEach((ball) {
      drawBall(canvas, ball);
    });

    var winSize = MediaQuery.of(context).size;
    drawGrid(canvas, winSize);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void drawBall(Canvas canvas, DrawCircle ball) {
    mPaint.color = ball.color;
    canvas.drawCircle(Offset(ball.x, ball.y), 10, mPaint);
  }
}
