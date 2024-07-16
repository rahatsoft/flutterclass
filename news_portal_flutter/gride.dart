import 'package:flutter/material.dart';
import 'package:flutter_newsportal/main.dart';
import 'package:flutter_newsportal/navbar.dart';


class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Page 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key});

  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 1'),
      ),
      body: const Center(
        child: Text('Page 1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        tooltip: 'Go Home',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
      ),


    );
  }
}
