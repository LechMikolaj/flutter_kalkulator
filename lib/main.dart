import 'dart:core';

import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

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
            const Text("y=Ax^2+Bx+C",style:TextStyle(fontSize:30)),

            TextField(
              controller: aField,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter A:',
              ),
            ),
            TextField(
              controller: bField,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter B:',
              ),
            ),
            TextField(
              controller: cField,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter C:',
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var content = "";
          try {
            var aNumber = double.parse(aField.text);
            var bNumber = double.parse(bField.text);
            var cNumber = double.parse(cField.text);
            var delta = bNumber * bNumber - 4 * aNumber * cNumber;
            var x1 = (-1 * bNumber - pow(delta, 1 / 2)) / (2 * aNumber);
            var x2 = (-1 * bNumber + pow(delta, 1 / 2)) / (2 * aNumber);
            if (aNumber != 0 && delta >= 0) {
              content =
                  "delta=" + delta.toString() + '\n' + "x1=" + x1.toString() +
                      '\n' + "x2=" + x2.toString();
            }
            else {
              content = "delta=" + delta.toString();
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
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
