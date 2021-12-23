import 'package:calculator_project/history_page.dart';
import 'package:calculator_project/main.dart';
import 'package:flutter/material.dart';

import 'converter.dart';

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Shri Hari Prasath'),
            accountEmail: const Text('shriplays@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/profile.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.grey,
           //   image: DecorationImage(
             //     fit: BoxFit.fill,
              //    image: AssetImage('assets/profile.jpg')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Calculator'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SimpleCalculator()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.compare_arrows),
            title: const Text('Converter'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConverterApp()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.compare_arrows),
            title: const Text('History Page'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              );
            },
          ),


        ],
      ),
    );
  }
}