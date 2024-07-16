import 'package:flutter/material.dart';
import 'package:navigationdrawerflutter/navbar.dart';
import 'package:navigationdrawerflutter/Page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  bool x = false;
  String? g = "";
  String? dd = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _showSnackbar(bool newValue) {
    final snackBar = SnackBar(
      content: Text(newValue ? 'Checkbox is checked' : 'Checkbox is unchecked'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  icon: Icon(Icons.contact_mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),

            Row(
              children: <Widget>[
                Checkbox(
                  value: x,
                  onChanged: (bool? value) {
                    setState(() {
                      x = value ?? false;
                      _showSnackbar(x);
                    });
                  },
                ),
                const Text('Remember me'),
              ],
            ),

            Row(
              children: [
                Radio<String>(
                  value: 'female',
                  groupValue: g,
                  onChanged: (String? value) {
                    setState(() {
                      g = value;
                      SnackBar s = SnackBar(content: Text(g.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(s);
                    });
                  },
                ),
                const Text("Female"),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'male',
                  groupValue: g,
                  onChanged: (String? value) {
                    setState(() {
                      g = value;
                      SnackBar s = SnackBar(content: Text(g.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(s);
                    });
                  },
                ),
                const Text("Male"),
              ],
            ),

            Row(
              children: [
                DropdownButton(
                  value: "web",
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        child: Text('web'),
                        value: 'web',
                      ),

                      DropdownMenuItem<String>(
                        child: Text('image'),
                        value: 'image',
                      ),

                        DropdownMenuItem<String>(
                        child: Text('shopping'),
                        value: 'shopping',
                      ),




                    ],
                    onChanged: (String? value){
                    setState(() {
                      dd=value;
                      SnackBar s = SnackBar(content: Text(dd.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(s);
                    });
                    },
                ),

              ],
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const SizedBox(
                width: 150,
                child: Text(
                  'Submit',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        tooltip: 'Go Home',
onPressed: () {
    Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Page1()),
          );
        },
      ),
    );
  }
}
