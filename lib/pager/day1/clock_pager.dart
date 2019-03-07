import 'package:flutter/material.dart';
import 'package:flutter_demo/helper/color_utils.dart';
import 'package:flutter_demo/view/clock_view.dart';
import 'package:flutter_demo/view/run_ball_view.dart';

class ClockPage  extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState  extends State<ClockPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;




  @override
  void initState() {
    super.initState();


    // 创建 AnimationController 对象
    //|----vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200000));

    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward(); //执行动画
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // 资源释放
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("时间器"),
      ),
      body: CustomPaint(
        painter: ClockView(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }




}
