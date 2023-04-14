import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Mini Project 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomeApp(),
    );
  }
}
class MyHomeApp extends StatefulWidget
{
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp>
{

  Widget _buildValue1TextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextField(
        decoration: InputDecoration(border:OutlineInputBorder(), labelText: 'Enter first number'),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _buildValue2TextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextField(
        decoration: InputDecoration(border:OutlineInputBorder(), labelText: 'Enter second number'),
        keyboardType: TextInputType.number,
      ),
    );
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
                child: Text("Result : 0", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
            ),
            _buildValue1TextField(),
            _buildValue2TextField(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.purple)), onPressed: () {
                }, child: Text("ADD"),),
                SizedBox(height: 20,),

                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.purple)), onPressed: () {
                }, child: Text("SUBSTRACT")),
                SizedBox(height: 20,),

                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.purple)), onPressed: () {
                }, child: Text("MULTIPLY")),
                SizedBox(height: 20,),

                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.purple)), onPressed: () {
                }, child: Text("DIVIDE")),

              ],
            )

          ],
        ),
      ),
    );
  }

}