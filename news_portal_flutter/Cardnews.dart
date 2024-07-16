import 'package:flutter/material.dart';
import 'package:flutter_newsportal/main.dart';
import 'package:flutter_newsportal/navbar.dart';
import 'package:flutter_newsportal/Student_class.dart';

class Cardnews extends StatelessWidget {
  const Cardnews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Student> stlist = [
      Student(
        "rahat",
        "Drive in 6 to 8 hours of direct sun, especially morning sunlight, and they benefit from protection from wind. Consider their ...",
        "https://www.whiteflowerfarm.com/mas_assets/cache/image/5/2/6/8/21096.Jpg",
      ),
      Student(
        "rahat",
        "Drive in 6 to 8 hours of direct sun, especially morning sunlight, and they benefit from protection from wind. Consider their ...",
        "https://www.whiteflowerfarm.com/mas_assets/cache/image/5/2/6/8/21096.Jpg",
      ),
      Student(
        "rahat",
        "Drive in 6 to 8 hours of direct sun, especially morning sunlight, and they benefit from protection from wind. Consider their ...",
        "https://www.whiteflowerfarm.com/mas_assets/cache/image/5/2/6/8/21096.Jpg",
      ),
    ];

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
  const MyHomePage1({Key? key}) : super(key: key);

  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  @override
  Widget build(BuildContext context) {
    List<Student> stlist = [
      Student(
        "rahat",
        "Drive in 6 to 8 hours of direct sun, especially morning sunlight, and they benefit from protection from wind. Consider their ...",
        "https://www.whiteflowerfarm.com/mas_assets/cache/image/5/2/6/8/21096.Jpg",
      ),
      Student(
        "kamal",
        "Drive in 6 to 8 hours of direct sun, especially morning sunlight, and they benefit from protection from wind. Consider their ...",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj-YBJKa1Zcgg0NXGyjZ8sVadGE1AHsU63Eg&s",
      ),
      Student(
        "rahat",
        "Drive in 6 to 8 hours of direct sun, especially morning sunlight, and they benefit from protection from wind. Consider their ...",
        "https://www.whiteflowerfarm.com/mas_assets/cache/image/5/2/6/8/21096.Jpg",
      ),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   // title: const Text('Card'),
      // ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: stlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.amber[500],
              child: SizedBox(
                height: 500,
                width: 300,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                          stlist[index].photo.toString(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        stlist[index].name .toString(),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        stlist[index].details.toString(),
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:<Widget> [
                              Text("Back"),
                              
                            ],
                          ),
                          onPressed: () { },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(Colors.green)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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
