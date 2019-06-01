import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


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
  @override
  void initState() {
    isanonym = false;
    _autovalidate = false;
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    imagfile = null;
    super.dispose();
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
                    Text('Your Question'),
                    TextFormField(
                      validator: (val){
                        if(val.isEmpty){
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
//                    questionController.text
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
//                    Row(children: [
//                      FlatButton(
//                        child: Icon(Icons.insert_drive_file),
//                        onPressed: () async{
//
//                        },
//                      ),
//                      TextFormField(
//                        controller: fileCodeController,
//
//                      )
//                    ]),
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
                              if(_formquestion.currentState.validate()){
                                _formquestion.currentState.save();
                              }else{
                                _autovalidate =true;
                              }

                            },
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
