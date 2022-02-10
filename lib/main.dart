import 'package:binary_calculator/numeric_systems/BinaryNumber.dart';
import 'package:binary_calculator/numeric_systems/DecimalNumber.dart';
import 'package:flutter/material.dart';

import 'Convert.dart';
import 'numeric_systems/Number.dart';

void main() {
  Number num = DecimalNumber();
  num.getNumberFromString("15");
  debugPrint(num.toHex());

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
      home: const Convert(title: 'Flutter Demo Home Page'),
    );
  }
}

