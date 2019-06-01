import 'package:bketoan/components/jawaban_component.dart';
import 'package:bketoan/components/pertanyaan_detail_component.dart';
import 'package:flutter/material.dart';

class DetailPertanyaan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailPertanyaanState();
}

class _DetailPertanyaanState extends State<DetailPertanyaan> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('your question'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PertanyaanDetailComponent(),
                Column(
                  children: List.generate(10, (i){
                    return JawabanComponent();
                  }),
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
