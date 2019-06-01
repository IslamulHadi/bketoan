import 'package:bketoan/components/logo_component.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_RegisterState();

}

class _RegisterState extends State<Register>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child: Center(child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LogoComponent(),
            SizedBox(height: MediaQuery.of(context).size.width/3.0,),
            Column(
              children: <Widget>[
                ButtonTheme(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Login()));

                    },
                    child: Text('Login With FB'),
                  ),
                ),
                ButtonTheme(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                  child: RaisedButton(
                    onPressed: (){},
                    child: Text('Login with google'),
                  ),
                )
              ],
            )

          ],
        ),
        )
      ),
    );
  }

}