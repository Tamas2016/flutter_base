//左边头像
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/helper/layout_utils.dart';


///新级级别布局 测试4
var lineTop4 = Row(
  children: <Widget>[
    Image.asset("images/icon_tiger.png", width: 20, height: 20,),
    Expanded(child: pd(Text('张三李四'),l: 5),),
    Text("Flutter/Dart",style: infoStyle,)
  ],
);

var center_left = Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Text(' Galaxy S10 在韩国、北美、欧洲及中国市场都创造了历史最高预售记录。',style: infoStyle,maxLines: 2,),
    pd(Text(
      "S10 初期销量较理想主要得益于这款手机的价格、全面屏配置和相机性能提升等多种因素的影响。", style: infoStyle,maxLines: 2,overflow: TextOverflow.ellipsis,
    ),t: 5),
]
);

var centerInfo4 = Row(
    children: <Widget>[Expanded(child: pda(center_left, 5)),
    Image.asset("images/icon_tiger.png", width: 80,height: 80,fit: BoxFit.fitHeight)
    ],

);

var end4 = Row(
  children: <Widget>[
    Icon(Icons.grade,color: Colors.green,size: 20,),
    Text('1000w',style: infoStyle,),
    pd(Icon(Icons.tag_faces,color:Colors.lightBlueAccent, size: 20),l:15,r:5),
    Text("2000W",style: infoStyle),
  ],
);

var item4 = Column(children: <Widget>[lineTop4, Expanded(child: centerInfo4), end4]);




///新级级别布局1 测试3
//左边头像
var headImg3 = Image.asset("images/icon_tiger.png", width: 50, height: 50,);

//中间的信息
var centerInfo3 = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text('盖伦杀四方',style: bigStyle),
    Row(children: <Widget>[
      Icon(Icons.next_week, size: 15,),
      pd(Text('圣诞节 | 无'), l: 5),
    ],),
    Row(children: <Widget>[
      Icon(Icons.keyboard, size: 15,),
      pd(Text("海的彼岸有我未曾见证的风采",overflow:TextOverflow.ellipsis, maxLines: 1 ), l: 5,)
    ],
    )
  ],
);

//尾部的
var endInfo3 = Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: <Widget>[
    Row(children: <Widget>[
      Icon(Icons.language, size: 15,),
      Icon(Icons.local_pharmacy, size: 15,),
      Icon(Icons.person_pin_circle, size: 15,),
    ],
    ),
    bg(pdhv(Text('编辑', style: btnStyle,), h: 10, v: 3), Colors.blueAccent),
  ],
);

var rowLine3 = Row(
  children: <Widget>[
 pda(headImg3, 5),
Expanded(child: pda(centerInfo3,5)),
 pda(endInfo3, 10),
  ],
);


///入门级布局2：
var headAvatar = Image.asset(
  "images/icon_tiger.png",
  width: 45,
  height: 45,
);

//中间的信息
var centerInfo = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text(
      '诺基亚9 Pure View ',
      style: commonStyle,
    ),
    Text(
      "发布后，诺基亚并没有公布Nokia 9 Pure View发货时间",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: infoStyle,
      textAlign: TextAlign.start,
    )
  ],
);

//尾部的时间+图标
var endInfo = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text(
      '00:15',
      style: infoStyle,
    ),
    Icon(
      Icons.visibility_off,
      size: 20,
      color: Color(0xff999999),
    )
  ],
);



