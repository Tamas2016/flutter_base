import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/view/anima_view.dart';

class AnimaPage extends StatefulWidget {

  AnimaPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AnimaPageState createState() => _AnimaPageState();
}

class _AnimaPageState extends State<AnimaPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  Animation<int> numAnima; //n角星的尖角数动画
  Animation<Color> colorAnima;

  Color _color = Colors.yellow;
  int _num = 5; //n角星的尖角数动画
  double _R = 25; //五角星的外接圆半径

  @override
  void initState() {
    super.initState();
    // 创建 AnimationController 对象
    //|----vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源


    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    numAnima = IntTween(begin: 5, end: 220).animate(controller)
      ..addListener(() {
        setState(() {
          _num = numAnima.value; //设置属性，刷新界面
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });


    colorAnima = ColorTween(begin: Colors.yellow, end: Colors.red).animate(controller)
      ..addListener(() {
        setState(() {
          _color = colorAnima.value;
        });
      })
    ..addStatusListener((status){
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

//    animation = Tween(begin: 25.0, end: 150.0).animate(
//        CurveTween(curve: Curves.bounceInOut).animate(controller))
    animation = Tween(begin: 25.0, end: 150.0).animate(
        CurveTween(curve: Cubic(0.96, 0.13, 0.1, 1.2)).animate(controller))
      ..addListener(() {
        setState(() {
          _R = animation.value;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
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
        title: Text("小虎游戏室"),
      ),
      body: CustomPaint(
        painter: AnimaView(context, r:_R,num: _num,color: _color),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward(); //执行动画
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
