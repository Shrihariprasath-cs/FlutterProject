import 'package:calculator_project/model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferencesService{
  Future saveEquation(Equations equations) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('equation', equations.equation);

    print('Equation Saved');
  }

  //Future<Equations> getEquations() async{
  //  final preferences = await SharedPreferences.getInstance();

  //  final equation = preferences.getString('equation');

   // return Equations(saveEquation(equations: equation));
 // }
}