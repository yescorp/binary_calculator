import 'package:binary_calculator/Home.dart';
import 'package:binary_calculator/numeric_systems/BinaryConstants.dart';
import 'package:binary_calculator/numeric_systems/BinaryNumber.dart';
import 'package:binary_calculator/numeric_systems/DecimalNumber.dart';
import 'package:binary_calculator/numeric_systems/HexNumber.dart';
import 'package:flutter/material.dart';

import 'Convert.dart';
import 'numeric_systems/Number.dart';

void main() {
  debugPrint(Number.evaluateExpression("0b100+78-0xa/0o8*0b1001").toString());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(),
    );
  }
}

