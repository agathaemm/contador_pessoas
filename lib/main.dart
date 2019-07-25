// Importa todos os widgets relacionados ao material design
import 'package:flutter/material.dart';

void main() {

  // Roda o meu aplicativo
  // Como parametro é uma instancia do widget do material design
  runApp(MaterialApp(
    title: "Contador de Pessoas", // Titulo do meu aplicativo - opcional - valor interno
    
    // Conteudo do meu aplicativo, defino que ele é um container 
    // e a cor do seu background
    home: Home()
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode Entrar!";

  /**
   * Redesenha a tela, 
   * informa pro flutter que alguma coisa mudou na minha tela
   */
  void _changePeople(int delta) {

    // Mudar o estado da minha tela
    setState(() {
      _people += delta;

      // Seta mensagem pra o usuario
      if(_people > 10) {
        _infoText = "Lotado!";
      }else if(_people < 0) {
        _infoText = "Mundo invertido?!";
      }else {
        _infoText = "Pode Entrar!";
      }
    });
  }

  // Função chamada sempre que queremos modificar alguma coisa no layout
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000
        ),
        Column(

          // Alinha os itens no centro da pagina
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas $_people",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: (
                    FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white
                        ),
                      ),
                      onPressed: () {
                        _changePeople(1);
                      }, // Função anonima
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: (
                    FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white
                        ),
                      ),
                      onPressed: () {
                        _changePeople(-1);
                      }, // Função anonima
                    )
                  ),
                )
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30
              ),
            )
          ],
        )
      ],
    );
  }
}