import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Mini Project Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  late TextEditingController _value1Controller, _value2Controller;
  late String _message;

  @override
  void initState() {
    super.initState();
    _message = "0";
    _value1Controller = TextEditingController();
    _value2Controller = TextEditingController();
  }

  Widget _buildValue1TextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextField(
        controller: _value1Controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: 'Enter first number'),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _buildValue2TextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextField(
        controller: _value2Controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: 'Enter second number'),
        keyboardType: TextInputType.number,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _value1Controller.dispose();
    _value2Controller.dispose();
  }

  void _calcUpdate(String opr) {
    setState(() {
      final double value1 = double.parse(_value1Controller.text);
      final double value2 = double.parse(_value2Controller.text);
      switch (opr) {
        case "+":
          {
            _message = (value1 + value2).toString();
          }
          break;
        case "-":
          {
            _message = (value1 - value2).toString();
          }
          break;
        case "*":
          {
            _message = (value1 * value2).toString();
          }
          break;
        case "/":
          {
            _message = (value1 / value2).toString();
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Result : $_message",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
              ),

              _buildValue1TextField(),
              _buildValue2TextField(),

              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple)),
                onPressed: () {
                  _calcUpdate("+");
                },
                child: Text("ADD"),
              ),
              
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple)),
                  onPressed: () {
                    _calcUpdate("-"); 
                  },
                  child: Text("SUBSTRACT")),
              
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple)),
                  onPressed: () {
                    _calcUpdate("*");
                  },
                  child: Text("MULTIPLY")),
              
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple)),
                  onPressed: () {
                    _calcUpdate("/");
                  },
                  child: Text("DIVIDE")),
            ],
          )),
    );
  }
}
