import 'BinaryNumber.dart';
import 'package:binary_calculator/numeric_systems/DecimalNumber.dart';
import 'package:binary_calculator/numeric_systems/HexNumber.dart';
import 'package:binary_calculator/numeric_systems/OctalNumber.dart';
import 'package:flutter/cupertino.dart';

import 'BinaryConstants.dart';

abstract class Number{
  String number = "";
  String sign = "+";

  Number getNumberFromString(String str);
  DecimalNumber toDecimal();
  HexNumber toHex();
  BinaryNumber toBinary();
  OctalNumber toOctal();
  Number copy();

  bool operator >(covariant Number other){
    if(this.toDecimal().intNumber > other.toDecimal().intNumber){
      return true;
    }
    else {
      return false;
    }
  }

  bool operator <(covariant Number other){
    if(this.toDecimal().intNumber < other.toDecimal().intNumber){
      return true;
    }
    else {
      return false;
    }
  }

  Number operator +(covariant Number other){
    Number system = other.copy();
    Number result = BinaryNumber();

    BinaryNumber first = this.toBinary();
    other = other.toBinary();

    if(first.number.length > other.number.length){
      other.number = "0" * (first.number.length - other.number.length) + other.number;
    }
    else  if (first.number.length < other.number.length){
      first.number = "0" * (other.number.length - first.number.length) + first.number;
    }

    int i = first.number.length - 1;

    int inMind = 0;
    int maxNumber = 2;
    while(i >= 0){
      int temp = BinaryConstants.getDecimal(first.number[i]) + BinaryConstants.getDecimal(other.number[i]) + inMind;

      if(temp < maxNumber){
        result.number += temp.toString();
        i--;
        inMind = 0;
        continue;
      }

      if(temp >= maxNumber){
        result.number += (temp % maxNumber).toString();
        i--;
        inMind = 1;
        continue;
      }
    }

    if(inMind > 0){
      result.number += inMind.toString();
    }

    result.getNumberFromString(result.number.split("").reversed.join());

    return initialSystem(result, system);
  }

  Number operator-(covariant Number other){
    Number system = other.copy();

    BinaryNumber result = BinaryNumber();
    BinaryNumber first = this.toBinary();
    BinaryNumber second = other.toBinary();

    first.sign = first.sign;
    second.sign = second.sign;

    if(second > first){
      BinaryNumber temp = BinaryNumber();
      temp.getNumberFromString(first.number);
      first.getNumberFromString(second.number);
      second.getNumberFromString(temp.number);
      result.sign = "-";
    }

    if(first.number.length > second.number.length){
      second.number = "0" * (first.number.length - second.number.length) + second.number;
    }
    else  if (first.number.length < second.number.length){
      first.number = "0" * (second.number.length - first.number.length) + first.number;
    }
    int i = first.number.length - 1;

    int inMind = 0;
    int maxNumber = 2;

    while(i >= 0){
      if(inMind == 1){
        BinaryNumber temp = BinaryNumber();
        temp.getNumberFromString(first.number);

        if(temp.number[i] == "0"){
          List l = temp.number.split("");
          l[i] = (maxNumber - 1).toString();
          first.number = l.join();
          inMind = 2;
        }
        else {
          List l = temp.number.split("");
          l[i] = (BinaryConstants.getDecimal(l[i]) - 1).toString();
          first.number = l.join();
          inMind = 1;
        }
      }

      if(BinaryConstants.getDecimal(first.number[i]) >= BinaryConstants.getDecimal(second.number[i])){

        result.number += (BinaryConstants.getDecimal(first.number[i]) - BinaryConstants.getDecimal(second.number[i])).toString();
        i--;
        inMind -= 1;
        continue;
      }
      else {
        result.number += (BinaryConstants.getDecimal(first.number[i]) + maxNumber - BinaryConstants.getDecimal(second.number[i])).toString();
        i--;
        inMind = 1;
        continue;
      }
    }
    result.getNumberFromString(result.number.split("").reversed.join());
    return initialSystem(result, system);
  }

  Number operator*(covariant Number other){

    Number system = other.copy();
    BinaryNumber first = this.toBinary();
    other = other.toBinary();

    BinaryNumber result = BinaryNumber();
    result.number = "0";
    int p = other.toDecimal().intNumber;

    for (int i = 0; i < p; i++) {
      result = (result + first) as BinaryNumber;
    }

    if(first.sign == other.sign){
      result.sign = "+";
    }
    else {
      result.sign = "-";
    }

    return initialSystem(result, system);
  }

  Number operator/(covariant Number other){

    Number system = other.copy();
    BinaryNumber first = this.toBinary();
    other = other.toBinary();

    BinaryNumber result = BinaryNumber();

    if(first.sign == other.sign){
      result.sign = "+";
    }
    else {
      result.sign = "-";
    }

    debugPrint(first.number);
    debugPrint(other.number);
    debugPrint((first > other).toString());

    if(other > first){
      result.number = "0";
      return result;
    }

    result.number = "0";
    int p = other.toDecimal().intNumber;

    BinaryNumber temp = first.copy();
    int count = 0;

    while(temp.sign == "+"){
      temp =  (temp - other).toBinary();
      count++;
    }

    DecimalNumber decResult = DecimalNumber().getNumberFromString((count - 1).toString());

    result = decResult.toBinary();

    return initialSystem(result, system);
  }

  Number initialSystem(Number num, Number initial){
    Number result = num.copy();

    switch(initial.runtimeType){
      case BinaryNumber:
        result = num.toBinary();
        break;
      case DecimalNumber:
        result = num.toDecimal();
        break;
      case OctalNumber:
        result = num.toOctal();
        break;
      case HexNumber:
        result = num.toHex();
        break;
    }

    return result;
  }

  @override
  String toString(){
    return sign + number;
  }
  
  static int getNumberFromAnySystem(String str){
    str = str.toLowerCase();
    if(str.contains("0x")){
      str = str.replaceAll("0x", "");
      return HexNumber().getNumberFromString(str).toDecimal().intNumber;
    }
    else if(str.contains("0b")){
      str = str.replaceAll("0b", "");
      return BinaryNumber().getNumberFromString(str).toDecimal().intNumber;
    }
    else if(str.contains("0o")){
      str = str.replaceAll("0o", "");
      return OctalNumber().getNumberFromString(str).toDecimal().intNumber;
    }
    else {
      return DecimalNumber().getNumberFromString(str).intNumber;
    }
  }

  static int evaluateExpression(String expression){
    List<String> stringOperands = expression.split(RegExp(r"[\-\+\*\/]"));
    List<String> operators = expression.splitMapJoin(RegExp(r"[\-\+\/\*]"), onMatch: (m){return m[0]!;}, onNonMatch: (n){return "";} ).split("");

    List<int> operands = stringOperands.map((e){return getNumberFromAnySystem(e);}).toList();

    debugPrint(operands.toString());
    debugPrint(operators.toString());

    return _delegateEvaluation(operands, operators);
  }

  static int _delegateEvaluation(List<int> operands, List<String> operators){
    debugPrint(operands.toString());
    debugPrint(operators.toString());

    if(operands.length == 1){
      return operands[0];
    }

    if(operators.contains("*") || operators.contains("/")){
      int multi = operators.indexOf("*");
      int divide = operators.indexOf("/");

      if((multi < divide || divide == -1) && multi != -1){
        int result = operands[multi] * operands[multi + 1];
        operands.removeAt(multi + 1);
        operands.removeAt(multi);
        operands.insert(multi, result);
        operators.removeAt(multi);

        return _delegateEvaluation(operands, operators);
      }
      else if (divide != -1){
        int result = (operands[divide] / operands[divide + 1]).floor();
        operands.removeAt(divide + 1);
        operands.removeAt(divide);
        operands.insert(divide, result);
        operators.removeAt(divide);
        return _delegateEvaluation(operands, operators);
      }
    }

    if(operators[0] == "+"){
      int plus = 0;

      int result = operands[plus] + operands[plus + 1];
      operands.removeAt(plus + 1);
      operands.removeAt(plus);
      operands.insert(plus, result);
      operators.removeAt(plus);
      return _delegateEvaluation(operands, operators);
    }

    if(operators[0] == "-"){
      int minus = 0;
      int result = operands[minus] - operands[minus + 1];
      operands.removeAt(minus + 1);
      operands.removeAt(minus);
      operands.insert(minus, result);
      operators.removeAt(minus);
      return _delegateEvaluation(operands, operators);
    }

    return 0;
  }
}