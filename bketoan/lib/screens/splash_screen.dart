import 'dart:async';
import 'dart:math' as math;
import 'package:bketoan/components/logo_component.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'register_screen.dart';

class Splash extends StatefulWidget {
  @override
  createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => Register()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LogoComponent(),
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: LinearProgressIndicator(),
                  ),
                )
              ],
            )));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    startTime();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
