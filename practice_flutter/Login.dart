import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:practice_flutter/main.dart';

import 'ShowAll.dart'; // Replace with actual import path

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Page1",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLogInactivity();
}

class _MyLogInactivity extends State<MyLoginPage> {
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();

  Future<Student> loginstudent() async {
    final response = await http.post(
      Uri.parse('http://192.168.0.79:8080/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': int.parse(_id.text),
        'name': _name.text,
      }),
    );

    if (response.statusCode == 200) {
      return Student.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _id,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "ID",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Name",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Student s = await loginstudent();
                  if (s != null && s.id == int.parse(_id.text) && s.name == _name.text) {

                    if(s.round=="57"){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Showall()),
                      );
                    }else if(s.round=="58"){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Login failed")),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
