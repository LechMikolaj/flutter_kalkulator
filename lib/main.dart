import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
final aField = TextEditingController();
final bField = TextEditingController();
final cField = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                const Text("y="),
                SizedBox(
                  width:41,
                  child:TextField(
                    controller: aField,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'A:',
                    ),
                  ),
                ),
                const Text("x^2+"),
                SizedBox(
                  width:41,
                  child:TextField(
                    controller: bField,
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'B:',
                    ),
                  ),
                ),
                const Text("+"),
                SizedBox(
                  width:41,
                  child:TextField(
                    controller: cField,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'C:',
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
                color: Colors.red, // background
                textColor: Colors.white, // foreground
              onPressed: () {
                var content = "";
                try {
                  //calculating
                  var aNumber = double.parse(aField.text);
                  var bNumber = double.parse(bField.text);
                  var cNumber = double.parse(cField.text);
                  var delta = bNumber * bNumber - 4 * aNumber * cNumber;
                  var x1 = (-1 * bNumber - pow(delta, 1 / 2)) / (2 * aNumber);
                  var x2 = (-1 * bNumber + pow(delta, 1 / 2)) / (2 * aNumber);
                  if (aNumber != 0 && delta >= 0) {
                    // ignore: prefer_interpolation_to_compose_strings
                    content = "delta=" + delta.toString() + '\n' + "x1=" + x1.toString() + '\n' + "x2=" + x2.toString();
                  }
                  else {
                    content = "delta=$delta";
                  }
                }
                on Exception catch (e) {
                  content="enter numbers not text";
                }
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(content),
                    );
                  },
                );
                aField.clear();
                bField.clear();
                cField.clear();
              },
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
