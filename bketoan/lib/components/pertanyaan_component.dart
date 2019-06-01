import 'package:flutter/material.dart';

class PertanyaanComponent extends StatelessWidget{
  String created_at;
  String judul;
  int total_reply;
  bool isSolverd;


  PertanyaanComponent({this.judul, this.isSolverd, this.created_at, this.total_reply});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        //
      },
      child: Card(
        shape: RoundedRectangleBorder(),
        child: ListTile(
          title: Text(judul),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(created_at),
              isSolverd?Icon(Icons.check, color: Colors.green,):Icon(Icons.clear, color: Colors.red,),
            ]
          ),
          leading: CircleAvatar(child: Text(total_reply.toString())),
        ),
      ),
    );
  }


}