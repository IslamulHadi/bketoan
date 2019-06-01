import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PertanyaanDetailComponent extends StatefulWidget {
  String username;
  String fullname;
  String avatar;
  String question;
  String label;
  String file;
  File gambar;

  PertanyaanDetailComponent(
      {this.avatar,
      this.username = 'username',
      this.fullname = 'fullname',
      this.question = 'question',
      this.label = 'label',
      this.file,
      this.gambar});

  @override
  State<StatefulWidget> createState()=> _PertanyaanDetailComponent();
}


class _PertanyaanDetailComponent extends State<PertanyaanDetailComponent>{
  bool isFavorited;

  @override
  void initState() {
    isFavorited = false;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text('username'),
              subtitle: Text('fullname'),
              leading: CircleAvatar(
                child: SvgPicture.asset('assets/icons/lamp.svg'),
              ),
              trailing: GestureDetector(
                onTap: () {
                    setState(() {
                      isFavorited = !isFavorited;
                    });
                },
                child: isFavorited?Icon(Icons.favorite):Icon(Icons.favorite,color: Colors.red,),
              ),
            ),
            Wrap(children: [Text(widget.question)]),
            Text(widget.label),
            GestureDetector(
              child: Text(
                'Download code here',
                style: TextStyle(
                    color: Colors.indigo, decoration: TextDecoration.underline),
              ),
            ),
            widget.gambar == null ? Placeholder() : Image.network(widget.file)
          ],
        ),
      ),
    );;
  }

}