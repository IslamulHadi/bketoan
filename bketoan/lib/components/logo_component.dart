import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class LogoComponent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SvgPicture.asset('assets/icons/lamp.svg',width: 120.0,height: 50.0,color: Colors.amber,),
        Text(
          'bketeon',
          style: TextStyle(fontSize: 50.0),
        ),
      ],
    );
  }

}


