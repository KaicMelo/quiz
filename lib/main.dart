import 'package:flutter/material.dart';
import './perguntas.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp());

class _perguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> pergunta = [
      {
        'texto': "Qual sua cor favorita ?",
        'respostas': ['Preto', 'Vermelhor', 'Verde', 'Branco'],
      },
      {
        'texto': "Qual seu animal favorito ?",
        'respostas': ['Elefante', 'Leão', 'Cobra', 'Cabra'],
      },
      {
        'texto': "Qual sua comida favorita ?",
        'respostas': ['Japonesa', 'Chinesa', 'Brasileira', 'Árabe']
      }
    ];

    List<Widget> respostas = [];

    for (String textoResp in pergunta[_perguntaSelecionada]['respostas']) {
      respostas.add(Resposta(textoResp,_responder));
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Column(
          children: <Widget>[
            Questao(pergunta[_perguntaSelecionada]['texto']),
            ...respostas,
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _perguntaAppState createState() {
    return _perguntaAppState();
  }
}
