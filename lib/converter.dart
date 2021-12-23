import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu.dart';

void main() => runApp(const MaterialApp(
  home: ConverterApp(),
));

class ConverterApp extends StatefulWidget {
  const ConverterApp({Key? key}) : super(key: key);

  @override
  State<ConverterApp> createState() => _ConverterAppState();
}

class _ConverterAppState extends State<ConverterApp> {
  late int inputNumber;
  late double answer = 0.0;
  final myController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(),
      backgroundColor: const Color(0xFF374352),
      appBar: AppBar(
        title: const Text('Converter App'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
             TextField(
             // controller: myController,
               style: const TextStyle(color: Colors.white),
               onChanged: (digit)  => inputNumber=int.parse(digit),
              keyboardType: TextInputType.number,
              decoration:  const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:  BorderSide(color: Colors.white, width: 10)
                ),
            //    hintText: 'Enter Number',
                labelText: 'Enter Number',
                fillColor: Colors.white,
              ),
            ),
            FloatingActionButton.extended(
                onPressed: (){
                  setState(() {
                    answer = (inputNumber * 0.621).toDouble();
                  });
                  },
                icon:  const Icon(Icons.directions),
                label: const Text("Kms to Miles")),
            FloatingActionButton.extended(
                onPressed: (){
                  setState(() {
                    answer = (inputNumber * 1.609344).toDouble();
                  });                },
                icon:  const Icon(Icons.commute),
                label: const Text("Miles to Kms")),
            FloatingActionButton.extended(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.calculate),
                label: const Text("Back to Calc")),

            Container(
                padding: const EdgeInsets.all(20.0),
                child:  Text(
                  answer.toString(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                  color: Colors.white),
                )
            ),
          ],

        ),
      ),
    );
  }
}




