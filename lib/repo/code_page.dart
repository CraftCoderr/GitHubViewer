import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CodePage extends StatelessWidget {

  Color blue = Color.fromARGB(255, 3, 102, 214);
  Color lightBlue = Color.fromARGB(255, 231, 243, 255);

  EdgeInsetsGeometry padding = EdgeInsets.only(top: 16, bottom: 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
        Text('description'),
        Container(
          margin: EdgeInsets.only(top: 8, bottom: 8),
          child: Row(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: lightBlue
              ),
              padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 4),             
              child: Text('tag', style: TextStyle(color: blue),),
            )
          ],),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3), 
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: padding,
                  child: Center(child: Row(children: <Widget>[
                    Icon(Octicons.star, color: blue, size: 18,),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      child: Text('Unstar', style: TextStyle(color: blue, fontWeight: FontWeight.bold),)
                    )
                  ],),),
                ),
                VerticalDivider(color: Colors.grey, width: 1,),
                Center(child: Row(children: <Widget>[
                  Icon(Octicons.eye, color: blue, size: 18,),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Text('Watch', style: TextStyle(color: blue, fontWeight: FontWeight.bold),)
                  )
                ],),)
            ],),
          ),
        )
      ],),
    );
  }
  

}