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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  bool x = false;
  String? g = "";
  String? dd = "";

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

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
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Bangladesh'),
            Tab(text: 'International'),
            Tab(text: 'Education'),
            Tab(text: 'Sports'),
            Tab(text: 'Opinion'),
            Tab(text: 'Entertainment'),
            Tab(text: 'Features'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Bangladesh Content')),
          Center(child: Text('International Content')),
          Center(child: Text('Education Content')),
          Center(child: Text('Sports Content')),
          Center(child: Text('Opinion Content')),
          Center(child: Text('Entertainment Content')),
          Center(child: Text('Features Content')),
        ],
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
