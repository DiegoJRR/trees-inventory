import 'package:flutter/material.dart';

import 'search_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new InkWell(
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));},
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Catálogo de Árboles", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),),
            new Text("Presiona para comenzar!", style: new TextStyle(color: Colors.white, fontSize: 30.0,  fontStyle: FontStyle.italic),),
          ]
        ),
      ),
    );
  }
}
