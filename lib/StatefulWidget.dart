
import 'package:flutter/material.dart';
const CITY_NAME = ["北京",'撒谎','年后','赵言','刘威','哈哈'];

class DemoStateWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title: Text("标题吗"),
            ),
            body:Container(
              height: 200,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:   _buildList()
              ),
            )
        )
    );
  }

 List<Widget> _buildList() {
    return CITY_NAME.map((city) => _item(city)).toList();
 }

 Widget _item(city){
  return Container(
    height: 80,
    width: 100,
    margin: EdgeInsets.only(right: 10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.orange
    ),
    child: Text(
        city,
      style: TextStyle(
          color: Colors.black,
        fontSize: 20
      ),
    ),

  );
 }
}
