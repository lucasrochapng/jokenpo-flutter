import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoStatus createState() => _JogoStatus();
}

class _JogoStatus extends State<Jogo> {
  var _imgApp = AssetImage('assets/img/padrao.png');
  var _msg = 'Escolha uma opção abaixo';

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var num = Random().nextInt(3);
    var escolhaApp = opcoes[num];

    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          this._imgApp = AssetImage('assets/img/pedra.png');
        });
        break;
      case 'papel':
        setState(() {
          this._imgApp = AssetImage('assets/img/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          this._imgApp = AssetImage('assets/img/tesoura.png');
        });
        break;
    }
    if (escolhaUsuario == escolhaApp) {
      setState(() {
        this._msg = 'Empate!';
      });
    } else if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel')) {
      setState(() {
        this._msg = 'Você Venceu!';
      });
    } else {
      setState(() {
        this._msg = 'Você perdeu!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 2.0,
                  ),
                  shape: BoxShape.circle),
              child: ClipOval(
                child: Image(
                  image: this._imgApp,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              this._msg,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Material(
                  child: InkWell(
                      onTap: () => _opcaoSelecionada('pedra'),
                      borderRadius: BorderRadius.circular(100),
                      splashColor: Color.fromARGB(255, 0, 162, 255).withOpacity(0.5),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/img/pedra.png',
                          width: 150,
                          height: 150,
                        ),
                      )),
                ),
                Material(
                  child: InkWell(
                    onTap: () => _opcaoSelecionada('papel'),
                    borderRadius: BorderRadius.circular(100),
                    splashColor: Color.fromARGB(255, 255, 0, 43).withOpacity(0.5),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/img/papel.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: () => _opcaoSelecionada('tesoura'),
                    borderRadius: BorderRadius.circular(100),
                    splashColor:
                        Color.fromARGB(255, 13, 155, 0).withOpacity(0.5),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/img/tesoura.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
