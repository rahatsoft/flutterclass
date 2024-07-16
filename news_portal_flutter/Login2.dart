import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Postnews.dart';
import 'UserSignup.dart'; // Only import this file for UserSignup
//import 'UserSignupScreen.dart'; // Remove this line to avoid conflict

import 'UserSignupScreen.dart';
import 'main.dart';
List<UserSignup> objectsFromJson(String str) =>
    List<UserSignup>.from(
        json.decode(str).map((x) => UserSignup.fromJson(x)));
String objectsToJson(List<UserSignup> data) =>
    json.encode(List<UserSignup>.from(data).map((x) => x.toJson()));

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login2(),
  ));
}

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _LoginState();
}

class _LoginState extends State<Login2> {
  TextEditingController _id = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future<UserSignup> login() async {
    UserSignup s = UserSignup(id: int.parse(_id.text), name: "", email: "", password: _password.text, role: "", image: "");
    final response = await http.post(
        Uri.parse('http://192.168.0.79:8080/login2'),
        body: jsonEncode(s.toJson()),
        headers: {"content-type": "application/json"}
    );

    if (response.statusCode == 200) {
      return UserSignup.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _id,
                      decoration: InputDecoration(
                        labelText: 'Id',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Login', style: TextStyle(fontSize: 18)),
                      onPressed: () async {
                        UserSignup s = await login();
                        if (s != null && s.id == int.parse(_id.text) && s.password == _password.text) {
                          if(s.role=="Admin"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Postnews()),
                            );
                          } else if(s.role=="Visitor"){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          }
                        } else {
                          SnackBar snk = SnackBar(content: Text('Enter correct information'));
                          ScaffoldMessenger.of(context).showSnackBar(snk);
                        }
                      },
                    ),
                    Spacer(),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserSignupScreen()),
                          );
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
