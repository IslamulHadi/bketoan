import 'package:flutter/material.dart';


class JawabanComponent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 5.0,top: 5.0,bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
              children: <Widget>[
                CircleAvatar(child: Icon(Icons.person),),
                Icon(Icons.check,color: Colors.green,)
              ],
            ),
            SizedBox(width: 5.0,),
            Wrap(children: <Widget>[Text('etets')]),
          ],
        ),
      ),
    );
  }
  
}