import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddLabel extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AddLabelState();

}

class _AddLabelState extends State<AddLabel> {
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement createState
    return Scaffold(
        body: StreamBuilder(
          stream: db.collection('labels').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) =>
                      GestureDetector(
                          child: FilterChip(
                            onSelected: (val){
                              Navigator.pop(context,
                                  snapshot.data.documents[index].data['name']);
                            },
                          backgroundColor: Color(0xFF69F0AE),
                          label: Text(snapshot.data.documents[index].data['name'])),
                          onTap: () {
                            Navigator.pop(context,
                                snapshot.data.documents[index].data['name']);
                          }),),
              );
//                      RaisedButton(onPressed:(){ Navigator.pop(context, snapshot.data.documents[index].data['name']);}, child: Text(
//                          snapshot.data.documents[index].data['name']),));
            } else if (snapshot.hasError) {
              return Text('Something wromg');
            }
            return CircularProgressIndicator();
          },
        )
    );
  }

}
