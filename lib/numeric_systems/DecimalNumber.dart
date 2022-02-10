import 'package:binary_calculator/numeric_systems/BinaryConstants.dart';

import 'Number.dart';

class DecimalNumber extends Number{
  int number = 0;

  @override
  void getNumberFromString(String str) {
    number = int.parse(str);
  }

  @override
  String toBinary() {
    String binary = "";

    int temp = number;
    while(true){
      if(temp / 2 == 0){
        break;
      }

      binary += (temp % 2).toString();
      temp =  (temp / 2).floor();
    }

    return binary.split("").reversed.join();
  }

  @override
  int toDecimal() {
    return number;
  }

  @override
  String toHex() {
    String hex = "";

    int temp = number;
    while(true){
      if(temp / 16 == 0){
        break;
      }

      hex += BinaryConstants.value[(temp % 16).toString()]!;

      temp =  (temp / 16).floor();
    }

    return hex.split("").reversed.join();
  }

  @override
  String toOctal() {
    String octal = "";

    int temp = number;
    while(true){
      if(temp / 8 == 0){
        break;
      }

      octal += BinaryConstants.value[(temp % 8).toString()]!;

      temp =  (temp / 8).floor();
    }

    return octal.split("").reversed.join();
  }
}