// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => MyAppState();
// }
//
// class MyAppState extends State<MyApp> {
//   Color backgroundColor = Colors.blueGrey;
//
//   void changeColor(Color color) {
//     setState(() {
//       backgroundColor = color;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           backgroundColor: backgroundColor,
//
//         body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ElevatedButton(
//               onPressed: () => changeColor(Colors.white),
//               child: const Text('Customer'),
//             ),
//             ElevatedButton(
//               onPressed: () => changeColor(Colors.redAccent),
//               child: const Text('Agent'),
//             ),
//             ElevatedButton(
//               onPressed: () => changeColor(Colors.green),
//               child: const Text('Merchant'),
//             ),
//           ],
//         ),
//       ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final controller = StreamController<Color>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Builder'),
      ),
      body: StreamBuilder<Color>(
        stream: controller.stream,
        initialData: Colors.blue,
        builder: (context, snapshot) {
          return Container(
            color: snapshot.data,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      controller.sink.add(Colors.white);
                    },
                    child: const Text('Customer'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.sink.add(Colors.red);
                    },
                    child: const Text('Agent'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.sink.add(Colors.green);
                    },
                    child: const Text('Merchant'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}




