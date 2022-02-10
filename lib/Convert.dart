import 'package:flutter/material.dart';

class Convert extends StatefulWidget {
  const Convert({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Convert> createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  String firstNumberSystem = "Decimal";
  String secondNumberSystem = "Binary";
  String result = "";
  String number = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Color.fromRGBO(234, 240, 251, 1),
            title: Padding(
              padding: const EdgeInsets.only(top: 27),
              child: Text(
                "Calculator 3000 Ultra Max Pro",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(

            child: Column(
              children: [
                Text(
                  "Number convertator",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration:
                            InputDecoration(hintText: "Number to convert"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text("From: ")),
                    Expanded(
                      flex: 3,
                      child: DropdownButton(
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
                            });
                          }),
                    ),
                    
                    Expanded(
                        flex: 1, child: Text("To: ")),
                    
                    Expanded(
                      flex: 3,
                      child: DropdownButton(
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
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Result: " + result,
                    style: TextStyle(fontSize: 30),)
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
