import 'package:flutter/material.dart';
import './perguntas.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> pergunta;
  final int perguntaSelecionada;
  final void Function(int) quantoResponder;

  Questionario({
    @required this.pergunta,
    @required this.perguntaSelecionada,
    @required this.quantoResponder,
  });

  bool get TemPerguntaSelecionada {
    return perguntaSelecionada < pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String,Object>> resposta = TemPerguntaSelecionada
        ? pergunta[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: <Widget>[
        Questao(pergunta[perguntaSelecionada]['texto']),
        ...resposta.map((f)  {
          return Resposta(f['texto'], () => quantoResponder(f['pontuacao']));
        }).toList(),
      ],
    );
  }
}
