import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';


class Getdata extends StatelessWidget {
  const Getdata({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Page1",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage1(
        // title:"Flutter demo Home page",
      ),
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page1 title"),
      ),
      body: Center(
        child: Text("Page1"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: "Go home",
        onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
        },
      ),
    );
  }
}