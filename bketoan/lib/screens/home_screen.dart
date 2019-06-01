import 'package:bketoan/bloc/authentication/bloc.dart';
import 'package:bketoan/screens/add_pertanyaan_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bketoan/components/pertanyaan_component.dart';
import 'package:bketoan/components/head_pertanyaan_component.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthenticationBloc _authBloc;
  final db = Firestore.instance;
  void deleteData(DocumentSnapshot doc) async {
    await db.collection('questions').document(doc.documentID).delete();
  }

  void createData() async {
    await db.collection('questions').add({
      'created_at': '9:00:00 AM',
      'label': 'labels/2nQdn2WmJbMGfJ4nEDJc',
      'question': 'Tes Pertanyaan5',
      'status': 'Active'
    });
  }

  @override
  Widget build(BuildContext context) {
    _authBloc = Provider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bketoan'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                HeadPertanyaanComponent(),
                Expanded(
                  child: StreamBuilder(
                      stream: db.collection('quests').snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError)
                          return new Text('Error: ${snapshot.error}');
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
                          default:
                            return StreamBuilder(
                                stream: db
                                    .collection('quests')
                                    // .where('n', isEqualTo: 'faris')
                                    // .where('a', isEqualTo: 'mobjo')
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError)
                                    return new Text('Error: ${snapshot.error}');
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    default:
                                      return buildList(snapshot);
                                  }
                                });
                        }
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tambah Pertanyaan',
        onPressed: () {
          createData();
           Navigator.push(
               context, MaterialPageRoute(builder: (_) => AddPertanyaan()));
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Column(children: [
          DrawerHeader(
              child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(_authBloc.user.photoUrl),
                radius: 50.0,
              ),
              Text(_authBloc.user.displayName),
              Text(_authBloc.user.email),
            ],
          )),
          ButtonTheme(
            child: FlatButton(
                onPressed: () => _authBloc.authEvent.add(LoggedOut()),
                child: Text('Logout')),
          )
        ]),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<QuerySnapshot> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.documents.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            PertanyaanComponent(
              judul: snapshot.data.documents[index].data['question'],
              created_at: '20-10-2019',
              isSolverd: true,
              total_reply: 30,
            )
          ],
        );
      },
    );
  }
}
