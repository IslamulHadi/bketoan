import 'package:bketoan/components/jawaban_component.dart';
import 'package:bketoan/components/pertanyaan_detail_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                    children: List.generate(10, (i) {
                      return JawabanComponent();
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SafeArea(
              minimum: EdgeInsets.only(left: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                        decoration:
                            InputDecoration(hintText: 'your answer here')),
                  ),
                  Expanded(
                    flex: 1,
                    child: ButtonTheme(
                      minWidth: 10.0,
                        child: FlatButton(
                      onPressed: () {},
                      child: SvgPicture.asset(
                        'assets/icons/send.svg',
                        width: 20.0,
                        height: 30.0,
                      ),
                    )),
                  )
                ],
              )),
        ));
  }
}
