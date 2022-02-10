import 'dart:math';

import 'package:binary_calculator/numeric_systems/BinaryConstants.dart';
import 'package:binary_calculator/numeric_systems/DecimalNumber.dart';
import 'package:binary_calculator/numeric_systems/Number.dart';
import 'package:flutter/foundation.dart';

class BinaryNumber extends Number{
  String number = "0x0000";

  void getNumberFromString(String str){
    RegExp exp = RegExp(r"[01]*");

    if(exp.hasMatch(str)){
      number = "0x" + str;
      debugPrint(number);
    }
  }

  int toDecimal(){
    int decimal = 0;
    int power = 0;
    for(int i = number.length - 1; i >= 2; i--){
        decimal += (int.parse(number[i]) * pow(2, power)) as int;
    }

    return decimal;
  }

  @override
  String toBinary() {
    return number;
  }

  @override
  String toHex() {
    DecimalNumber num = DecimalNumber();
    num.number = toDecimal();
    return num.toHex();
  }

  @override
  String toOctal() {
    DecimalNumber num = DecimalNumber();
    num.number = toDecimal();
    return num.toOctal();
  }
}