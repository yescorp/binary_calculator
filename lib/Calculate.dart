import 'package:binary_calculator/numeric_systems/BinaryConstants.dart';
import 'package:binary_calculator/numeric_systems/BinaryNumber.dart';
import 'package:binary_calculator/numeric_systems/DecimalNumber.dart';
import 'package:binary_calculator/numeric_systems/HexNumber.dart';
import 'package:binary_calculator/numeric_systems/OctalNumber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'numeric_systems/Number.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  String numericSystem = "Decimal";
  String result = "";
   Number first = DecimalNumber();
   Number second = DecimalNumber();
  TextEditingController controller = TextEditingController();

  void calculate() {

    debugPrint(controller.text);
    RegExp regExp = RegExp(r"[\+\-\/\*]");

    first = first.getNumberFromString(controller.text.split(regExp)[0]);
    second = second.getNumberFromString(controller.text.split(regExp)[1]);

    setState(() {
      if (controller.text.contains("-")) {
        result = (first - second).toString();
      }
      else if (controller.text.contains("+")) {
        result = (first + second).toString();
      }
      else if (controller.text.contains("/")) {
        result = (first / second).toString();
      }
      else if (controller.text.contains("*")) {
        result = (first * second).toString();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Numeric calculation for various systems",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(hintText: "Expression..."),
                    ),
                  ),
                ]
            ),
            SizedBox(height: 16,),
            Text("Write expression with 2 operands only", textAlign: TextAlign.end,),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
            Expanded(
              child: DropdownButton(
              dropdownColor: Color.fromRGBO(234, 240, 251, 1),
          focusColor: Color.fromRGBO(234, 240, 251, 1),
          underline: Container(),
          value: numericSystem,
          items: <String>['Decimal', 'Hexadecimal', 'Binary', 'Octal']
                .map<DropdownMenuItem<String>>((String value) {
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
                numericSystem = newVal!;

                switch(newVal.toLowerCase()){
                  case "decimal":
                    first = DecimalNumber();
                    second = DecimalNumber();
                    break;
                  case "hexadecimal":
                    first = HexNumber();
                    second = HexNumber();
                    break;
                  case "octal":
                    first = OctalNumber();
                    second = OctalNumber();
                    break;
                  case "binary":
                    first = BinaryNumber();
                    second = BinaryNumber();
                    break;
                }
              });
          }),
            ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.cyan),
                        textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20))),
                    onPressed: calculate,
                    child: Text("Calculate"))
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
          ],
        ]),
      ),
    );
  }


}
