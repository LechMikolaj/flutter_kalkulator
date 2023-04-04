import 'package:flutter/material.dart';
import 'dart:math';

class AreaAndVolumeOfTheSphere extends StatefulWidget {
  const AreaAndVolumeOfTheSphere({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<AreaAndVolumeOfTheSphere> createState() => _AreaAndVolumeOfTheSphere();
}
final aField = TextEditingController();
final bField = TextEditingController();
final cField = TextEditingController();

class _AreaAndVolumeOfTheSphere extends State<AreaAndVolumeOfTheSphere> {
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
            Image.asset('assets/images/ball.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                SizedBox(
                  width:90,
                  height:40,
                  child:TextField(
                    controller: aField,
                    style: TextStyle(fontSize: 20, height: 2.3, color: Colors.black),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'R:(cm)',
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

                  if (aNumber > 0 ) {
                    // ignore: prefer_interpolation_to_compose_strings
                    var area=4*3.14*pow(aNumber,2);
                    var volume=(4/3)*3.14*pow(aNumber,3);


                    content = "Area="+ area.toString()+"cm^2"'\n'+"Volume="+ volume.toString()+"cm^3";
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}