import 'package:binary_calculator/numeric_systems/BinaryNumber.dart';
import 'package:binary_calculator/numeric_systems/DecimalNumber.dart';
import 'package:binary_calculator/numeric_systems/HexNumber.dart';
import 'package:binary_calculator/numeric_systems/OctalNumber.dart';
import 'package:flutter/material.dart';

import 'numeric_systems/Number.dart';

class Convert extends StatefulWidget {
  const Convert({Key? key}) : super(key: key);

  @override
  State<Convert> createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  String firstNumberSystem = "Decimal";
  String secondNumberSystem = "Binary";
  String result = "";
  TextEditingController controller = TextEditingController();
  Number firstNumber = DecimalNumber();

  convert() {
    debugPrint("Convert button pressed");

    if (controller.text == "") {
      return;
    }

    firstNumber.getNumberFromString(controller.text);

    debugPrint(controller.text);

    switch (secondNumberSystem) {
      case "Decimal":
        setState(() {
          result = firstNumber.toDecimal().toString();
        });
        break;
      case "Binary":
        setState(() {
          result = firstNumber.toBinary().toString();
        });
        break;
      case "Octal":
        setState(() {
          result = firstNumber.toOctal().toString();
        });
        break;
      case "Hexadecimal":
        setState(() {
          result = firstNumber.toHex().toString();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Number convertator",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: "Number to convert"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 1, child: Text("From: ")),
                Expanded(
                  flex: 3,
                  child: DropdownButton(
                      dropdownColor: Color.fromRGBO(234, 240, 251, 1),
                      focusColor: Color.fromRGBO(234, 240, 251, 1),
                      underline: Container(),
                      value: firstNumberSystem,
                      items: <String>[
                        'Decimal',
                        'Hexadecimal',
                        'Binary',
                        'Octal'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          firstNumberSystem = newVal!;
                          switch (newVal) {
                            case "Decimal":
                              firstNumber = DecimalNumber();
                              break;
                            case "Binary":
                              firstNumber = BinaryNumber();
                              break;
                            case "Octal":
                              firstNumber = OctalNumber();
                              break;
                            case "Hexadecimal":
                              firstNumber = HexNumber();
                              break;
                          }
                        });
                      }),
                ),
                Expanded(flex: 1, child: Text("To: ")),
                Expanded(
                  flex: 3,
                  child: DropdownButton(
                      dropdownColor: Color.fromRGBO(234, 240, 251, 1),
                      focusColor: Color.fromRGBO(234, 240, 251, 1),
                      underline: Container(),
                      value: secondNumberSystem,
                      items: <String>[
                        'Decimal',
                        'Hexadecimal',
                        'Binary',
                        'Octal'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newVal) {
                        setState(() {
                          secondNumberSystem = newVal!;
                        });
                      }),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.cyan),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 20))),
                    onPressed: convert,
                    child: Text("Convert"))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            if (result != "") ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Result: " + result,
                      style: TextStyle(fontSize: 30),
                      overflow: TextOverflow.visible,
                    ),
                  )
                ],
              )
            ]
          ],
        ),
      ),
    );
  }
}
