import 'package:flutter/material.dart';
import "package:binary_calculator/numeric_systems/Number.dart";

class Expressions extends StatefulWidget {
  const Expressions({Key? key}) : super(key: key);

  @override
  _ExpressionsState createState() => _ExpressionsState();
}

class _ExpressionsState extends State<Expressions> {
  TextEditingController controller = TextEditingController();
  String result = "";

  void calculateExpression() {
    setState(() {
      result = (Number.evaluateExpression(controller.text)).toString();
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
              "Evaluate Expression",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: "Your expression..."),
                ))
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: calculateExpression,
              child: Text("Calculate Expression"),),
            SizedBox(height: 20,),
            if(result != "")...[
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
