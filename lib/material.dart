

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DEMOWidget extends StatelessWidget{
  final String text;

  //数据可以通过构造方法传递进来
  DEMOWidget(this.text);

  @override
  Widget build(BuildContext context){
    //这里返回你需要的控件
    //这里末尾有没有的逗号，对于格式化代码而已是不一样的。
    return Container(
      //白色背景
      color:Colors.orange,
      child:Text(
        text?? "这就是无状态组件",
        textDirection:TextDirection.ltr,
      )
    );
  }

}