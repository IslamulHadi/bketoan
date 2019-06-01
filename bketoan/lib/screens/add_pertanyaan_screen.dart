import 'dart:io';

import 'package:flutter/material.dart';

class AddPertanyaan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPertanyaanState();
}

class _AddPertanyaanState extends State<AddPertanyaan> {
  bool isanonym;
  File imagfile;

  @override
  void initState() {
    isanonym = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Pertanyaan'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
//            Checkbox(value: true, onChanged: null)
                Row(
                  children: <Widget>[
                    Text('masuk sebagai anonym'),
                    Checkbox(
                      value: isanonym,
                      onChanged: (value) {
                        setState(() {
                          isanonym = value;
                        });
                      },
                    ),
                  ],
                ),
                Text('Pertanyaan'),
                TextFormField(
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                ),
                FlatButton(
                  child: Text('label'),
                  onPressed: () {},
                ),
                Text(''),
                FlatButton(
                  child: Icon(Icons.insert_drive_file),
                  onPressed: () {},
                ),
                Text(''),
                FlatButton(
                  child: Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
                imagfile == null ? Placeholder() : Image.file(imagfile),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ButtonTheme(
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text('Simpan'),
                      ),
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
