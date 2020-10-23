import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("img/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    _mostrarEscolhaDoApp(escolhaApp);
    _validarGanhador(escolhaUsuario, escolhaApp);
  }

  void _mostrarEscolhaDoApp(String escolha){
    switch(escolha){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("img/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("img/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("img/tesoura.png");
        });
        break;
    }
  }

  void _validarGanhador(String escolhaJogador, String escolhaApp){
    // Usuário ganha
    if(
        (escolhaJogador == "pedra" && escolhaApp == "tesoura") ||
        (escolhaJogador == "tesoura" && escolhaApp == "papel") ||
        (escolhaJogador == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Você ganhou! :)";
      });

      // App ganha
    } else if (
        (escolhaApp == "pedra" && escolhaJogador == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaJogador == "papel") ||
        (escolhaApp == "papel" && escolhaJogador == "pedra")
    ){
      setState(() {
        this._mensagem = "Você perdeu! :(";
      });
    }else{
      setState(() {
        this._mensagem = "Empatou! :|";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("img/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("img/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("img/tesoura.png", height: 100,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
