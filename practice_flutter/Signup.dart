import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'ShowAll.dart';
import 'main.dart';

List<Student> objectsFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String objectsToJson(List<Student> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Signup extends  StatefulWidget{
  Signup({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<Signup> {
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _round = TextEditingController();

  Future<Student> signupStudent() async {
    Student s = Student(
      id: int.parse(_id.text),
      name: _name.text,
      email: _email.text,
      round: _round.text,
    );
    final response = await http.post(
      Uri.parse('http://192.168.0.79:8080/insert'),
      body: jsonEncode(s.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Student.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to sign up");
    }
  }

  int x = 0; // এখানে স্টেট ভ্যারিয়েবল ডিফাইন করা হয়েছে

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Id",
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
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Email",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _round,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Round",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Student st = await signupStudent();
                  if (st != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Signed up successfully!"),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Sign up failed!"),
                      ),
                    );
                  }
                },
                child: Text("Submit"),
              ),

              // এক্সট্রা বোতাম যোগ করা হয়েছে
              // ElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       x++; // স্টেট ভ্যারিয়েবল আপডেট করা হয়েছে
              //     });
              //   },
              //   child: Text("Submit " + x.toString()), // বাটনের লেবেল ডাইনামিক করা হয়েছে
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
