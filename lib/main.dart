import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(new PerguntaApp());

class _perguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _pergunta = [
    {
      'texto': "Qual sua cor favorita ?",
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelhor', 'pontuacao': 7},
        {'texto': 'Verde', 'pontuacao': 6},
        {'texto': 'Branco', 'pontuacao': 3},
      ],
    },
    {
      'texto': "Qual seu animal favorito ?",
      'respostas': [
        {'texto': 'Elefante', 'pontuacao': 5},
        {'texto': 'Leão', 'pontuacao': 6},
        {'texto': 'Cobra', 'pontuacao': 3},
        {'texto': 'Cabra', 'pontuacao': 10},
      ],
    },
    {
      'texto': "Qual sua comida favorita ?",
      'respostas': [
        {'texto': 'Japonesa', 'pontuacao': 10},
        {'texto': 'Chinesa', 'pontuacao': 3},
        {'texto': 'Brasileira', 'pontuacao': 8},
        {'texto': 'Árabe', 'pontuacao': 6},
      ]
    }
  ];

  void _responder(int pontuacao) {
    perguntaSelecionada
        ? setState(() {
            _perguntaSelecionada++;
            _pontuacaoTotal += pontuacao;
          })
        : null;

    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get perguntaSelecionada {
    return _perguntaSelecionada < _pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Perguntas"),
          ),
        ),
        body: perguntaSelecionada
            ? Questionario(
                pergunta: _pergunta,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _responder,
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
                quandoReiniciarQuestionario: _reiniciarQuestionario,
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
