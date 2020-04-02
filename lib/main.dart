
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(new PerguntaApp());
  void responder()
  {
    print("Responder Prguinta");
  }

class PerguntaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> pergunta =
    [
      "Qual sua cor favorita ?",
      "Qual seu animal favorito ?",
    ];
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("QUIZ"),
        ),
        body: Column(
          children: <Widget>[
            Text(pergunta[0]),
            RaisedButton(
              child: Text("Resposta 1"),
              onPressed: responder,
            ),RaisedButton(
              child: Text("Resposta 2"),
              onPressed: responder,
            ),RaisedButton(
              child: Text("Resposta 3"),
              onPressed: responder,
            ),
          ],
        ),
      ),
    );
  }
}
