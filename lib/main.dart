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
      home: const MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
void count()
{

}
final aField = TextEditingController();
final bField = TextEditingController();
final cField = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  late double _deltaNumber=0.0;
  late double _x1Number=0.0;
  late double _x2Number=0.0;
  late String _content="";
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
                const Text("y=", style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                SizedBox(
                  width:80,
                  height:40,
                  child:TextField(
                    controller: aField,
                    style: TextStyle(fontSize: 20, height: 2.3, color: Colors.black),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'A:',
                    ),
                  ),
                ),
                const Text("x²+",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                SizedBox(
                  width:80,
                  height:40,
                  child:TextField(
                    controller: bField,
                    style: TextStyle(fontSize: 20, height: 2.3, color: Colors.black),
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'B:',
                    ),
                  ),
                ),
                const Text("x+",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                SizedBox(
                  width:80,
                  height:40,
                  child:TextField(
                    controller: cField,
                    style: TextStyle(fontSize: 20, height: 2.3, color: Colors.black),
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
                    setState(()
                        {
                          _content = content;
                        });
                  }
                  else {
                    content = "delta=$delta";
                    setState(()
                    {
                      _content = content;
                    });
                  }
                }
                on Exception catch (e) {
                  content="enter numbers not text";
                  setState(()
                  {
                    _content = content;
                  });
                }
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //       content: Text(content),
                //     );
                //   },
                // );
                aField.clear();
                bField.clear();
                cField.clear();
              },
              child: const Text('Calculate'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                  Text(_content,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                  ),
                  // Text(_deltaNumber.toString(),
                  //   textAlign: TextAlign.center,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                  // ),
                ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children:  <Widget>[
            //     Text('x1=',
            //       textAlign: TextAlign.center,
            //       overflow: TextOverflow.ellipsis,
            //       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            //     ),
            //     Text(_x1Number.toString(),
            //       textAlign: TextAlign.center,
            //       overflow: TextOverflow.ellipsis,
            //       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children:  <Widget>[
            //     Text('x2=',
            //       textAlign: TextAlign.center,
            //       overflow: TextOverflow.ellipsis,
            //       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            //     ),
            //     Text(_x2Number.toString(),
            //       textAlign: TextAlign.center,
            //       overflow: TextOverflow.ellipsis,
            //       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            //     ),
            //   ],
            // ),


          ],
        ),
      ),
    );
  }
}
