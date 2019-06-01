import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class PertanyaanDetailComponent extends StatelessWidget{
  String username;
  String fullname;
  String avatar;
  String question;
  String label;
  String file;
  File gambar;
  PertanyaanDetailComponent({this.avatar, this.username='username',this.fullname='fullname',this.question='question', this.label='label', this.file, this.gambar});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(title: Text('username'),subtitle: Text('fullname'),leading: CircleAvatar(child: SvgPicture.asset('assets/icons/lamp.svg'),),),
          Text(question),
          Text(label),
          GestureDetector(
            child: Text('Download code here', style: TextStyle(color: Colors.indigo,decoration: TextDecoration.underline),),
          ),
          gambar==null?Placeholder(): Image.network(file)
        ],
      ),
    );
  }
}
