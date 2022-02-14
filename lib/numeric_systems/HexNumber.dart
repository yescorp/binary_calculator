import 'dart:math';

import 'package:binary_calculator/numeric_systems/BinaryNumber.dart';
import 'package:binary_calculator/numeric_systems/Number.dart';
import 'package:binary_calculator/numeric_systems/OctalNumber.dart';

import 'BinaryConstants.dart';
import 'DecimalNumber.dart';

class HexNumber extends Number {

  @override
  HexNumber getNumberFromString(String str) {
    RegExp exp = RegExp(r"[0-9A-Fa-f]*");
    if(str.contains("+")){
      sign = "+";
      str = str.replaceAll(RegExp(r"+"), "");
    }
    if (str.contains("-")){
      sign = "-";
      str = str.replaceAll(RegExp(r"\-"), "");
    }

    if(exp.hasMatch(str)){
      number = str.toUpperCase();
    }

    return this;
  }

  @override
  BinaryNumber toBinary() {
    DecimalNumber num = DecimalNumber();
    num = toDecimal();
    return num.toBinary();
  }

  @override
  DecimalNumber toDecimal() {
    DecimalNumber result = DecimalNumber();
    int decimal = 0;
    int power = 0;
    for(int i = number.length - 1; i >= 0; i--){
      decimal += (int.parse(BinaryConstants.value[number[i]]!) * pow(16, power)) as int;
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
  HexNumber toHex() {
    return this.copy();
  }

  @override
  OctalNumber toOctal() {
    DecimalNumber num = DecimalNumber();
    num = toDecimal();
    return num.toOctal();
  }


  @override
  HexNumber copy() {
    HexNumber result = HexNumber();
    result.sign = sign;
    result.number = number;
    return result;
  }
  
}