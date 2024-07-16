import 'package:flutter/material.dart';
import 'package:flutter_newsportal/main.dart';
import 'package:flutter_newsportal/navbar.dart';
import 'package:flutter_newsportal/Page2.dart';
import 'package:flutter_newsportal/Cardnews.dart';

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
        title: const Text('gride'),
      ),
      body: Column(
        children: [
          Text('Page 1'),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(20),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              primary: false,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  child: SizedBox.fromSize(
                    size: Size(80, 80),
                    child: ClipOval(
                      child: Material(
                        color: Colors.green,
                        child: InkWell(
                          splashColor: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.home, size: 30), // Icon size adjusted for professional look
                              Text("Contact", style: TextStyle(fontSize: 20))
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Page1()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: SizedBox.fromSize(
                    size: Size(80, 80),
                    child: ClipOval(
                      child: Material(
                        color: Colors.green,
                        child: InkWell(
                          splashColor: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.home, size: 30), // Icon size adjusted for professional look
                              Text("Contact", style: TextStyle(fontSize: 20))
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Cardnews()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: SizedBox.fromSize(
                    size: Size(80, 80),
                    child: ClipOval(
                      child: Material(
                        color: Colors.green,
                        child: InkWell(
                          splashColor: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.home, size: 30), // Icon size adjusted for professional look
                              Text("Contact", style: TextStyle(fontSize: 20))
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Page2()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: SizedBox.fromSize(
                    size: Size(80, 80),
                    child: ClipOval(
                      child: Material(
                        color: Colors.green,
                        child: InkWell(
                          splashColor: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.home, size: 10), // Icon size adjusted for professional look
                              Text("Contact", style: TextStyle(fontSize: 20))
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Page2()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home, size: 30), // Icon size adjusted for professional look
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
