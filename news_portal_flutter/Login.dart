import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Postnews.dart';

class Signup {
  int id;
  String name;
  String email;
  String password;
  String role;
  String image;

  Signup({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.image,
  });

  factory Signup.fromJson(Map<String, dynamic> json) {
    return Signup(
      id: json['id'] != null ? json['id'] : 0, // Handle missing key with default value
      name: json['name'] != null ? json['name'] : '',
      email: json['email'] != null ? json['email'] : '',
      password: json['password'] != null ? json['password'] : '',
      role: json['role'] != null ? json['role'] : '',
      image: json['image'] != null ? json['image'] : '',
    );
  }
}

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _showSpinner = false;
  bool _wrongCredentials = false;

  Future<Signup?> login(int id, String password) async {
    setState(() {
      _showSpinner = true;
      _wrongCredentials = false;
    });

    final response = await http.get(
      Uri.parse('http://192.168.0.79:8080/$id/$password'), // Replace with actual URL
    );

    setState(() {
      _showSpinner = false;
    });

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) { // Check for empty response body
        try {
          return Signup.fromJson(json.decode(response.body));
        } catch (e) {
          throw Exception('Failed to parse response body ($e)');
        }
      } else {
        throw Exception('Empty response body received from server');
      }
    } else {
      throw Exception('Failed to load data (Status Code: ${response.statusCode})');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50.0),
              ),
              SizedBox(height: 30.0),
              TextField(
                controller: _idController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'ID',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  int id = int.tryParse(_idController.text) ?? 0;
                  String password = _passwordController.text.trim();

                  try {
                    Signup? signup = await login(id, password);
                    if (signup != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Postnews()),
                      );
                    } else {
                      setState(() {
                        _wrongCredentials = true;
                      });
                    }
                  } catch (e) {
                    print("Login error: $e");
                    setState(() {
                      _wrongCredentials = true;
                    });
                  }
                },
                child: _showSpinner
                    ? CircularProgressIndicator()
                    : Text('Login'),
              ),
              SizedBox(height: 10.0),
              if (_wrongCredentials)
                Text(
                  'Invalid ID or password',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}
