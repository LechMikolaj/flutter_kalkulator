import 'package:flutter/material.dart';
import 'dart:math';

class RectangularTriangle extends StatefulWidget {
  const RectangularTriangle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<RectangularTriangle> createState() => _QuadraticFunctionState();
}
final aField = TextEditingController();
final bField = TextEditingController();
final cField = TextEditingController();

class _QuadraticFunctionState extends State<RectangularTriangle> {
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
            Image.asset('assets/images/rectangularTriagle.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
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
                  num cNumber = 0.0;
                  if (aNumber > 0 && bNumber> 0) {
                    // ignore: prefer_interpolation_to_compose_strings
                    cNumber=pow(aNumber*aNumber+bNumber*bNumber,1/2);
                    var sinAlpha=aNumber/cNumber;
                    var cosAlpha=bNumber/cNumber;
                    var tanAlpha=aNumber/bNumber;

                    content = "c="+cNumber.toString()+'\n'+"sin ALPHA="+sinAlpha.toString()
                        +'\n'+"cos ALPHA="+cosAlpha.toString()+'\n'+"tan ALPHA="+tanAlpha.toString();
                    setState(()
                    {
                      _content = content;
                    });
                  }
                  else {
                    content = "enter correct numbers";
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
                aField.clear();
                bField.clear();
                cField.clear();
              },
              child: const Text('Calculate'),
            ),
            // RaisedButton(
            //   color: Colors.red, // background
            //   textColor: Colors.white, // foreground
            //   onPressed: () {
            //     var content = "";
            //     try {
            //       //calculating
            //       var aNumber = double.parse(aField.text);
            //       var bNumber = double.parse(bField.text);
            //       var cNumber = double.parse(cField.text);
            //       var delta = bNumber * bNumber - 4 * aNumber * cNumber;
            //       var x1 = (-1 * bNumber - pow(delta, 1 / 2)) / (2 * aNumber);
            //       var x2 = (-1 * bNumber + pow(delta, 1 / 2)) / (2 * aNumber);
            //       if (aNumber != 0 && delta >= 0) {
            //         // ignore: prefer_interpolation_to_compose_strings
            //         content = "delta=" + delta.toString() + '\n' + "x1=" + x1.toString() + '\n' + "x2=" + x2.toString();
            //         setState(()
            //         {
            //           _content = content;
            //         });
            //       }
            //       else {
            //         content = "delta=$delta";
            //         setState(()
            //         {
            //           _content = content;
            //         });
            //       }
            //     }
            //     on Exception catch (e) {
            //       content="enter numbers not text";
            //       setState(()
            //       {
            //         _content = content;
            //       });
            //     }
            //     aField.clear();
            //     bField.clear();
            //     cField.clear();
            //   },
            //   child: const Text('Calculate'),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                Text(_content,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}