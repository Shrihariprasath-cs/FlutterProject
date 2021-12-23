import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_project/shared_preferences_controller.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  SharedPreferencesController controller = SharedPreferencesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: FutureBuilder<List<String>?>(
                future: controller.getStringList("weatherInfo"),
                builder: (BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
                  List<Widget> rows = [];
                  if (snapshot.hasData) {
                    int counter = 1;
                    rows = snapshot.data!.map((weatherInfo) {
                      String text = counter.toString() + ". " + weatherInfo;
                      counter++;
                      return Text(text);
                    }).toList();
                  }

                  return Column(
                    children: rows,
                  );
                },
              )),
        ),
      ),
    );
  }
}