import 'package:flutter/material.dart';
import 'package:navigationdrawerflutter/main.dart';
import 'package:navigationdrawerflutter/navbar.dart';


class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Page 2',
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
  List<String> student =[
    "rahim","monir","samir","ilias", "rahim","monir","samir","ilias",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 2'),
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: student.length,
        itemBuilder: (BuildContext context,int index){
          return Container(
            margin: EdgeInsets.all(5),
            height: 50,
            color: Colors.amber[500],
            child: Center(
              child: Text(student[index]),

            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home) ,
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
