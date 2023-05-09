import 'package:flutter/material.dart';

import 'src/multi_child_render.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMultiChildWidget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MyMultiChildWidget Demo'),
        ),
        body: Center(
          child: MyMultiChildWidget(
            children: [
              Container(
                width: 100,
                height: 50,
                color: Colors.red,
              ),
              Container(
                width: 50,
                height: 100,
                color: Colors.green,
              ),
              Container(
                width: 75,
                height: 75,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
