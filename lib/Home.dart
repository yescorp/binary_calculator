import 'package:binary_calculator/Convert.dart';
import 'package:binary_calculator/Expressions.dart';
import 'package:flutter/material.dart';

import 'Calculate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  
  static const List<Widget> _widgetOptions = <Widget>[
    Convert(),
    Calculate(),
    Expressions()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(234, 240, 251, 1),
          title: Padding(
            padding: const EdgeInsets.only(top: 27),
            child: Text(
              "Calculator 3000 Ultra Max Pro",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),

      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_vertical_circle_outlined),
            label: 'Convert',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Expressions',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(69, 140, 238, 1.0),
        onTap: _onItemTapped,
      ),
    );
  }
}
