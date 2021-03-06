import 'dart:math';

import 'package:binary_calculator/numeric_systems/BinaryConstants.dart';
import 'package:binary_calculator/numeric_systems/DecimalNumber.dart';
import 'package:binary_calculator/numeric_systems/HexNumber.dart';
import 'package:binary_calculator/numeric_systems/Number.dart';
import 'package:binary_calculator/numeric_systems/OctalNumber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class BinaryNumber extends Number{

  @override
  BinaryNumber getNumberFromString(String str){
    RegExp exp = RegExp(r"[01]*");

    if(str.contains("+")){
      sign = "+";
      str = str.replaceAll(RegExp(r"+"), "");
    }
    if (str.contains("-")){
      sign = "-";
      str = str.replaceAll(RegExp(r"\-"), "");
    }

    if(exp.hasMatch(str)){
      number = str;
    }

    return this;
  }

  @override
  DecimalNumber toDecimal(){
    DecimalNumber result = DecimalNumber();

    int decimal = 0;
    int power = 0;
    for(int i = number.length - 1; i >= 0; i--){
        decimal += (int.parse(number[i]) * pow(2, power)) as int;
        power++;
    }

    if(sign == "-"){
      decimal *= -1;
      result.sign = "-";
    }

    result.intNumber = decimal;
    result.number = decimal.toString();
    result.number.replaceAll("-", "");

    return result;
  }

  @override
  BinaryNumber toBinary() {
    return this.copy();
  }

  @override
  HexNumber toHex() {
    DecimalNumber num = DecimalNumber();
    num = toDecimal();
    return num.toHex();
  }

  @override
  OctalNumber toOctal() {
    DecimalNumber num = DecimalNumber();
    num = toDecimal();
    return num.toOctal();
  }

  @override
  BinaryNumber copy() {
    BinaryNumber result = BinaryNumber();
    result.number = number;
    result.sign = sign;
    return result;
  }
}
