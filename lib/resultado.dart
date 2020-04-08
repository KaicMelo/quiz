import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado({this.pontuacao, this.quandoReiniciarQuestionario});

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Sem graça";
    } else if (pontuacao < 16) {
      return 'Tu tem mal gosto';
    } else if (pontuacao < 24) {
      return 'Até que tem bom gosto';
    } else {
      return "Melhor pessoa do mundo <3";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        FlatButton(
          child: Text(
            "Reiniciar",
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 190, 0, 0),
          child: Text(
            'by Kaic Melo Santos',
            style: TextStyle(
              color: Colors.black12,
            ),
          ),
        )
      ],
    );
  }
}
