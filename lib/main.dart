import 'package:flutter/material.dart';
import 'package:flutter_kalkulator/quadraticFunc.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const QuadraticFunction(title: 'Quadratic Function'),
      },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calculator'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Quadratic Function'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}


// class QuadraticFunction extends StatefulWidget {
//   const QuadraticFunction({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   State<QuadraticFunction> createState() => _QuadraticFunctionState();
// }
// final aField = TextEditingController();
// final bField = TextEditingController();
// final cField = TextEditingController();
//
// class _QuadraticFunctionState extends State<QuadraticFunction> {
//   late String _content = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text("y=", style: const TextStyle(
//                     fontWeight: FontWeight.bold, fontSize: 30)),
//                 SizedBox(
//                   width: 80,
//                   height: 40,
//                   child: TextField(
//                     controller: aField,
//                     style: TextStyle(
//                         fontSize: 20, height: 2.3, color: Colors.black),
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'A:',
//                     ),
//                   ),
//                 ),
//                 const Text("x²+", style: const TextStyle(
//                     fontWeight: FontWeight.bold, fontSize: 30)),
//                 SizedBox(
//                   width: 80,
//                   height: 40,
//                   child: TextField(
//                     controller: bField,
//                     style: TextStyle(
//                         fontSize: 20, height: 2.3, color: Colors.black),
//                     decoration: const InputDecoration(
//                       border: const OutlineInputBorder(),
//                       hintText: 'B:',
//                     ),
//                   ),
//                 ),
//                 const Text("x+", style: const TextStyle(
//                     fontWeight: FontWeight.bold, fontSize: 30)),
//                 SizedBox(
//                   width: 80,
//                   height: 40,
//                   child: TextField(
//                     controller: cField,
//                     style: TextStyle(
//                         fontSize: 20, height: 2.3, color: Colors.black),
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'C:',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             RaisedButton(
//               color: Colors.red, // background
//               textColor: Colors.white, // foreground
//               onPressed: () {
//                 var content = "";
//                 try {
//                   //calculating
//                   var aNumber = double.parse(aField.text);
//                   var bNumber = double.parse(bField.text);
//                   var cNumber = double.parse(cField.text);
//                   var delta = bNumber * bNumber - 4 * aNumber * cNumber;
//                   var x1 = (-1 * bNumber - pow(delta, 1 / 2)) / (2 * aNumber);
//                   var x2 = (-1 * bNumber + pow(delta, 1 / 2)) / (2 * aNumber);
//                   if (aNumber != 0 && delta >= 0) {
//                     // ignore: prefer_interpolation_to_compose_strings
//                     content = "delta=" + delta.toString() + '\n' + "x1=" +
//                         x1.toString() + '\n' + "x2=" + x2.toString();
//                     setState(() {
//                       _content = content;
//                     });
//                   }
//                   else {
//                     content = "delta=$delta";
//                     setState(() {
//                       _content = content;
//                     });
//                   }
//                 }
//                 on Exception catch (e) {
//                   content = "enter numbers not text";
//                   setState(() {
//                     _content = content;
//                   });
//                 }
//                 aField.clear();
//                 bField.clear();
//                 cField.clear();
//               },
//               child: const Text('Calculate'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(_content,
//                   textAlign: TextAlign.center,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//                 ),
//
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
