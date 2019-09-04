import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

    double precoAlcool = double.tryParse( _controllerAlcool.text );
    double precoGasolina = double.tryParse( _controllerGasolina.text );

    if( precoAlcool == null || precoGasolina == null ){
      setState(() {
        _textoResultado = "Número invalido, digite números maiores que 0 e utilizando ( . ) ponto";
      });
    }else{

      if( ( precoAlcool / precoGasolina ) >= 0.7 ){
        setState(() {
          _textoResultado = "Abasteça com Gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Abasteça com Álcool";
        });
      }
    }

    FocusScope.of(context).requestFocus(new FocusNode());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.black45,
      ),
      body: Container(

        height: double.infinity,
        color: Colors.grey[900],
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("imgs/logo.png", height: 140,),
              ),
              /*Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Container(
                  transform: Matrix4.translationValues(28.0, -60.0, 0.0),
                  child: Image.asset("imgs/ponteiro.png", height: 87, width: 100,),
                ),
              ),*/
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Saiba qual a melhor opção para abastecer seu carro.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Preço Álcool ex: 2.11",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Preço Gasolina ex: 3.94",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onPressed: _calcular,

                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: Text(
                    _textoResultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
