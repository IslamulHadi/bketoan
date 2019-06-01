import 'package:flutter/material.dart';

class HeadPertanyaanComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin:EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6.0,
      child: Card(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(

                decoration: InputDecoration(hintText: 'Search......', suffixIcon: FlatButton(onPressed: (){}, child: Icon(Icons.search))),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: ButtonTheme(
                      child: FlatButton(onPressed: (){}, child: Text('Newest')),
                    ),
                  ),
                  Expanded(
                  child : ButtonTheme(
                    child: FlatButton(onPressed: (){}, child: Text('Populer')),
                  )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
