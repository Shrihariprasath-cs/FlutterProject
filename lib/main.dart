import 'package:calculator_project/menu.dart';
import 'package:calculator_project/model.dart';
import 'package:calculator_project/preferences_service.dart';
import 'package:calculator_project/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'converter.dart';

void main(){
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  final _equationController = TextEditingController();
  final _preferencesService = PreferencesService();
 // final SharedPreferencesController = sharedPreferenceController()
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }

      else if(buttonText == "⌫"){
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if(equation == ""){
          equation = "0";
        }
      }

      else if(buttonText == "="){
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        _saveEquation;




        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }
      }
      else{
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if(equation == "0"){
          equation = buttonText;
        }else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Future<Equations> getEquations() async{
    final preferences = await SharedPreferences.getInstance();
    final equation = preferences.getString('equation');
    return Equations(equation!);
  }

  Future<Equations> saveEquations() async{
    final preferences = await SharedPreferences.getInstance();
    final equation = preferences.getString('equation');
    return Equations(equation!);
  }



  Widget roundButton(String buttonText, double buttonHeight, Color buttonColor){
  //  height: MediaQuery.of(context).size.height * 0.1 * buttonHeight;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 60,
          padding: const EdgeInsets.all(1.0),
          child: FlatButton(
            //  padding: const EdgeInsets.all(8.0),
              onPressed: () => buttonPressed(buttonText),
              child: Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              )
          ),

        //child: Icon(Icons.android, size: 60, color: Colors.grey[800]),

        decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600,
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ],

            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey.shade200,
                  Colors.grey.shade300,
                  Colors.grey.shade400,
                  Colors.grey.shade400,
                ],
                stops: const [
                  0.1,
                  0.3,
                  0.8,
                  1
                ]
            )

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: const Text('Simple Calculator')),
      body: Column(
        children: <Widget>[

          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontSize,color: Colors.grey[800]),),
          ),


          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultFontSize, color: Colors.grey[800]),),
          ),


          const Expanded(
            child: Divider(),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,

        padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Table(
                    children: [
                      TableRow(
                          children: [
                            roundButton("C", 1, Colors.amber),
                            roundButton("⌫", 1, Colors.amber),
                            roundButton("÷", 1, Colors.amber),
                          ]
                      ),

                      TableRow(
                          children: [
                            roundButton("7", 1, const Color(0xFF374352)),
                            roundButton("8", 1, const Color(0xFF374352)),
                            roundButton("9", 1, const Color(0xFF374352)),
                          ]
                      ),

                      TableRow(
                          children: [
                            roundButton("4", 1, const Color(0xFF374352)),
                            roundButton("5", 1, const Color(0xFF374352)),
                            roundButton("6", 1, const Color(0xFF374352)),
                          ]
                      ),

                      TableRow(
                          children: [
                            roundButton("1", 1, const Color(0xFF374352)),
                            roundButton("2", 1, const Color(0xFF374352)),
                            roundButton("3", 1, const Color(0xFF374352)),
                          ]
                      ),

                      TableRow(
                          children: [
                            roundButton(".", 1, const Color(0xFF374352)),
                            roundButton("0", 1, const Color(0xFF374352)),
                            roundButton("00", 1, const Color(0xFF374352)),
                          ]
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          roundButton("×", 1, Colors.amber),
                        ]
                    ),

                    TableRow(
                        children: [
                          roundButton("-", 1, Colors.amber),
                        ]
                    ),

                    TableRow(
                        children: [
                          roundButton("+", 1, Colors.amber),
                        ]
                    ),
                    TableRow(
                        children: [
                          roundButton("^", 1, Colors.amber),
                        ]
                    ),

                    TableRow(
                        children: [

                          TextButton(onPressed: () {
                            _saveEquation;
                          },
                          child: roundButton("=", 1, Colors.redAccent)),
                        ]
                    ),
                  ],
                ),
              )
            ],
          ),

        ],
      ),
    );

  }
  void _saveEquation(){
    final newSavedEquation = Equations(equation);
    _preferencesService.saveEquation(newSavedEquation);
  }
}

