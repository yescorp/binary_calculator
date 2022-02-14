import 'dart:math';

import 'package:binary_calculator/numeric_systems/BinaryConstants.dart';
import 'package:binary_calculator/numeric_systems/DecimalNumber.dart';
import 'package:binary_calculator/numeric_systems/HexNumber.dart';
import 'package:binary_calculator/numeric_systems/Number.dart';
import 'package:flutter/foundation.dart';

import 'BinaryNumber.dart';

class OctalNumber extends Number{

  @override
  OctalNumber getNumberFromString(String str){
    RegExp exp = RegExp(r"[0-7]*");

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
      debugPrint(number);
    }
    return this;
  }

  @override
  OctalNumber copy(){
    OctalNumber result = OctalNumber();
    result.number = number;
    result.sign = sign;
    return result;

  }

  @override
  DecimalNumber toDecimal(){
    DecimalNumber result = DecimalNumber();

    int decimal = 0;
    int power = 0;
    for(int i = number.length - 1; i >= 0; i--){
      decimal += (int.parse(number[i]) * pow(8, power)) as int;
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
    DecimalNumber num = DecimalNumber();
    num = toDecimal();
    return num.toBinary();
  }

  @override
  HexNumber toHex() {
    DecimalNumber num = DecimalNumber();
    num = toDecimal();
    return num.toHex();
  }

  @override
  OctalNumber toOctal() {
    return this.copy();
  }
}