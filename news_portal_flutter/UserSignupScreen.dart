import 'package:flutter/material.dart';
import 'package:flutter_newsportal/Login2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupUser {
  int? id;
  String? name;
  String? email;
  String? password;
  String? role;
  String? image;

  SignupUser({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.image,
  });

  factory SignupUser.fromJson(Map<String, dynamic> json) {
    return SignupUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'image': image,
    };
  }
}

class UserSignupScreen extends StatefulWidget {
  @override
  _UserSignupScreenState createState() => _UserSignupScreenState();
}

class _UserSignupScreenState extends State<UserSignupScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedRole;

  Future<SignupUser> signupUser() async {
    final SignupUser signup = SignupUser(
      id: int.parse(_idController.text),
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      role: _selectedRole,
    );

    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.79:8080/insertdata'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(signup.toJson()),
      );

      if (response.statusCode == 200) {
        return SignupUser.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create signup. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to create signup: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: "ID",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Name",
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedRole,
              items: [
                DropdownMenuItem(
                  child: Text("Admin"),
                  value: "Admin",
                ),
                DropdownMenuItem(
                  child: Text("Visitor"),
                  value: "Visitor",
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedRole = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Role',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  final newUser = await signupUser();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Signup Successful")),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Signup Failed: $e")),
                  );
                }
              },
              child: Text("Submit"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login2()),
                );
              },
              child: Text(
                "Already have an account? Login",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
