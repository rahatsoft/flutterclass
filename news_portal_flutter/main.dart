import 'package:flutter/material.dart';
import 'package:flutter_newsportal/navbar.dart';
import 'package:flutter_newsportal/Page1.dart';
import 'package:flutter_newsportal/Shownewsbycategory.dart';

import 'Login2.dart';
import 'Showall.dart';
import 'UserSignupScreen.dart';
import 'Postnews.dart'; // Import Postnews.dart

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login2(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bangladesh Mail'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10, // Updated length to accommodate Postnews tab
      child: Scaffold(
        drawer: const Navbar(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'All news'),
              Tab(text: 'Bangladesh'),
              Tab(text: 'International'),
              Tab(text: 'Education'),
              Tab(text: 'Sports'),
              Tab(text: 'Opinion'),
              Tab(text: 'Entertainment'),
              Tab(text: 'Features'),
              Tab(text: 'Sign Up'),
              Tab(text: 'Log In'),
               // New tab for Postnews
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Showall(),
            const Shownewsbycategory(category: 'Bangladesh'),
            const Shownewsbycategory(category: 'International'),
            const Shownewsbycategory(category: 'Education'),
            const Shownewsbycategory(category: 'Sports'),
            const Shownewsbycategory(category: 'Opinion'),
            const Shownewsbycategory(category: 'Entertainment'),
            const Shownewsbycategory(category: 'Features'),
            UserSignupScreen(),
            Login2(),
          ],
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
      ),
    );
  }
}
