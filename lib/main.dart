import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Week6 Simple Hello World',
      theme: ThemeData(
          primarySwatch: Colors.green, canvasColor: Colors.green.shade100),
      home: const MyHomePage(title: 'Flutter Week6 Simple Hello World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listMessages = [];

  var lineEditController = TextEditingController();
  // String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: lineEditController,
            onSubmitted: (value) => setState(() {
              listMessages.add(value);
              lineEditController.clear();
              // name = value;
            }),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your message',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  child: const Text('Clear'),
                  onPressed: () {
                    setState(() {
                      listMessages.clear();
                    });
                  }),
              TextButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    setState(() {
                      listMessages.add(lineEditController.text);
                      // name = lineEditController.text;
                    });
                  }),
            ],
          ),
          for (var name in listMessages) Text('Hello $name'),
        ],
      ),
    );
  }
}
