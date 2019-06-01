import 'dart:io';
import 'dart:core';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'home_screen.dart';
import 'label_screen.dart';

class AddPertanyaan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPertanyaanState();
}

class _AddPertanyaanState extends State<AddPertanyaan> {
  bool isanonym;
  File imagfile;
  bool _autovalidate;
  final _formquestion = GlobalKey<FormState>();
  final labelController = TextEditingController();
  final questionController = TextEditingController();
  final fileCodeController = TextEditingController();
  final db = Firestore.instance;
  static var today = new DateTime.now();
  var formatedTanggal = new DateFormat.yMMMd().format(today);
  @override
  void initState() {
    isanonym = false;
    _autovalidate = false;
    super.initState();
  }

  @override
  void dispose() {
    imagfile = null;
    super.dispose();
  }

  void createData() async {
    await db.collection('quests').add({
      'created_at': formatedTanggal.toString(),
      'label': labelController.text,
      'question': questionController.text,
      'status': 'Active',
      'displayName': 'Diaz',
      'photoUrl':
          'https://lh4.googleusercontent.com/-Dylt4o3LZ5k/AAAAAAAAAAI/AAAAAAAABbI/fPHqc4i7jnY/s96-c/photo.jpg',
      'anonim': isanonym,
      'uid': 'zxl5g77iHdXfinbZThOSQUyoGlY2'
    });
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
                key: _formquestion,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
//            Checkbox(value: true, onChanged: null)
                    Row(
                      children: <Widget>[
                        Text('Ask anonymously?'),
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
                    Text('Your Question'),
                    TextFormField(
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please fill question';
                        }
                      },
                      maxLines: 5,
                      controller: questionController,
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text('Your Label'),
                    InkWell(
                        onTap: () async {
                          labelController.text = await Navigator.push(context,
                              MaterialPageRoute(builder: (_) => AddLabel()));
                        },
                        child: Icon(Icons.add)),
                    InkWell(
                      onTap: () async {
                        print('tetete');
                        labelController.text = await Navigator.push(context,
                            MaterialPageRoute(builder: (_) => AddLabel()));
                      },
                      child: TextFormField(
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Please Insert your label';
                          }
                        },
                        controller: labelController,
                      ),
                    ),

                    Text(''),
                    FlatButton(
                      child: Icon(Icons.camera_alt),
                      onPressed: () async {
                        final File imagefile = await ImagePicker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          this.imagfile = imagefile;
                        });
                      },
                    ),
                    imagfile == null
                        ? Placeholder()
                        : Image.file(
                            imagfile,
                          ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ButtonTheme(
                          child: RaisedButton(
                            onPressed: () {
                              if (_formquestion.currentState.validate()) {
                                _formquestion.currentState.save();
                                createData();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => Home()));
                              } else {
                                _autovalidate = true;
                              }
                            },
                            child: Text('Simpan'),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
