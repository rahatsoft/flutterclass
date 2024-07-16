import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_flutter/Showall.dart';
import 'package:practice_flutter/Signup.dart';

import 'Login.dart';
// import 'package:practice_3_2/Getdata.dart';
// import 'package:practice_3_2/Signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration:   const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Flutter.png"),
                  fit: BoxFit.fill
              ),
            ),
            
            child: const Center(
              child: Icon(Icons.play_circle_fill,color: Colors.green, size: 60,),
            ),
          ),


          const Column(
            mainAxisAlignment: MainAxisAlignment.start,

          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),

                child:  ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Showall() ));
                  },
                  child: const Text('Showall'),

                ),
              ),

              Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child:  ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup() ));
                  },
                  child: const Text('Signup'),

                ),
              ),

              Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child:  ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login() ));
                  },
                  child: const Text('Login'),

                ),
              ),

            ],
          ),



        ],
      )


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
