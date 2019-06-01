import 'package:bketoan/components/head_pertanyaan_component.dart';
import 'package:bketoan/components/pertanyaan_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'add_pertanyaan_screen.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Beketoan'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                HeadPertanyaanComponent(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(10, (i) {
                    return PertanyaanComponent(
                      judul: 'Test',
                      created_at: '20-10-2019',
                      isSolverd: true,
                      total_reply: 30,
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tambah Pertanyaan',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) =>AddPertanyaan()));
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Column(children: [
          DrawerHeader(
              child: Column(
            children: <Widget>[
              CircleAvatar(
                child: SvgPicture.asset('assets/icons/lamp.svg'),
              ),
              Text('Username')
            ],
          )),
          ButtonTheme(
            child: FlatButton(onPressed: () {}, child: Text('Logout')),
          )
        ]),
      ),
    );
  }
}
