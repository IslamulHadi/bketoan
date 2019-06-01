import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main(){
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFFFFFFFF)),
      debugShowCheckedModeBanner: false,
      title: 'Bketoan',
      home: Splash(),
    );
  }
}
