import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'student.dart'; // Ensure this import is correct




// JSON থেকে Student অবজেক্টে কনভার্ট করা
List<Student> objectsFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

// Student অবজেক্ট থেকে JSON এ কনভার্ট করা
String objectsToJson(List<Student> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Signupbyid extends StatefulWidget {
  const Signupbyid({super.key});

  @override
  State<Signupbyid> createState() => _SignupbyidState();
}

class _SignupbyidState extends State<Signupbyid> {
  TextEditingController _idController = TextEditingController();
  String searchid = "";
  late List<Student> _students = [];

  // সমস্ত Student দেখানোর জন্য ফাংশন
  Future<List<Student>> showall() async {
    final response = await http.get(
      Uri.parse('http://192.168.0.70:8080/students'),
    );
    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void show() async {
    _students = await showall();
    setState(() {});
  }

  // নির্দিষ্ট আইডি অনুযায়ী Student দেখানোর জন্য ফাংশন
  Future<List<Student>> showallbyid(String id) async {
    var response;
    if (id.isEmpty) {
      response = await http.get(
        Uri.parse('http://192.168.0.79:8080/students'),
      );
    } else {
      response = await http.get(
        Uri.parse('http://192.168.0.79:8080/search/' + id),
      );
    }
    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  void showbyid() async {
    _students = await showallbyid(_idController.text);
    setState(() {});
  }

  @override
  void initState() {
    show();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search By Id"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Form(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _idController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter id';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'id',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_idController.text.isEmpty) {
                            showall();
                          } else {
                            searchid = _idController.text;
                          }
                          showbyid();
                          setState(() {});
                        },
                        child: Text("Search"),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: _students.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: _students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(_students[index].id.toString()),
                  title: Text(_students[index].name.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: Signupbyid(),
  ));
}