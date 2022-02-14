import 'package:binary_calculator/numeric_systems/BinaryConstants.dart';
import 'package:binary_calculator/numeric_systems/BinaryNumber.dart';
import 'package:binary_calculator/numeric_systems/HexNumber.dart';
import 'package:binary_calculator/numeric_systems/OctalNumber.dart';
import 'package:flutter/cupertino.dart';

import 'Number.dart';

class DecimalNumber extends Number{
  int intNumber = 0;

  @override
  DecimalNumber getNumberFromString(String str) {
    intNumber = int.parse(str);
    if(str.contains("+")){
      sign = "+";
      str = str.replaceAll(RegExp(r"+"), "");
    }
    if (str.contains("-")){
      sign = "-";
      str = str.replaceAll(RegExp(r"\-"), "");
    }

    number = str;
    return this;
  }

  @override
  BinaryNumber toBinary() {
    String binary = "";

    int temp = intNumber.abs();
    while(true){
      if(temp / 2 == 0){
        break;
      }

      binary += (temp % 2).toString();
      temp =  (temp / 2).floor();
    }

    if(sign == "-"){
      binary += "-";
    }

    return BinaryNumber().getNumberFromString(binary.split("").reversed.join());
  }

  @override
  DecimalNumber toDecimal() {
    return this.copy();
  }

  @override
  HexNumber toHex() {
    String hex = "";

    int temp = intNumber.abs();
    while(true){
      if(temp / 16 == 0){
        break;
      }

      hex += BinaryConstants.value[(temp % 16).toString()]!;

      temp =  (temp / 16).floor();
    }

    if(intNumber < 0){
      hex += "-";
    }

    return HexNumber().getNumberFromString(hex.split("").reversed.join());
  }

  @override
  OctalNumber toOctal() {
    String octal = "";

    int temp = intNumber.abs();
    while(true){
      if(temp / 8 == 0){
        break;
      }

      octal += BinaryConstants.value[(temp % 8).toString()]!;

      temp =  (temp / 8).floor();
    }

    if(intNumber < 0){
      octal += "-";
    }

    return OctalNumber().getNumberFromString(octal.split("").reversed.join());
  }

  @override
  DecimalNumber copy() {
    DecimalNumber result = DecimalNumber();
    result.intNumber = intNumber;
    result.number = number;
    result.sign = sign;
    return result;
  }
}