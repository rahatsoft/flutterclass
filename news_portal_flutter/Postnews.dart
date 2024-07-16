import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main.dart';
import 'navbar.dart';

class Postnews extends StatefulWidget {
  @override
  _PostnewsState createState() => _PostnewsState();
}

class _PostnewsState extends State<Postnews> {
  String title = '';
  String writer = '';
  String description = '';
  String image = '';
  String category = 'Bangladesh';

  // Function to handle form submission
  void submitBlog() async {
    try {
      // Prepare your data
      Map<String, dynamic> blogData = {
        'title': title,
        'writer': writer,
        'description': description,
        'image': image, // Include user-provided imageUrl
        'category': category,
      };

      // Send data to your API endpoint
      final response = await http.post(
        Uri.parse('http://192.168.0.79:8080/saveBlog'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(blogData),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Blog posted successfully')),
        );
        // Clear form fields after submission
        setState(() {
          title = '';
          writer = '';
          description = '';
          image = '';
          category = 'Bangladesh';
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to post blog')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),

      appBar: AppBar(
        title: Text('Post A News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Post A News',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Writer',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    writer = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Enter Your News',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    image = value;
                  });
                },
              ),

              SizedBox(height: 10),
              DropdownButton<String>(
                value: category,
                onChanged: (String? value) {
                  setState(() {
                    category = value!;
                  });
                },
                items: <String>[
                  'Bangladesh',
                  'International',
                  'Education',
                  'Sports',
                  'Opinion',
                  'Business',
                  'Entertainment',
                  'Features'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitBlog,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        tooltip: 'Go Home',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  MyApp()),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Postnews(),
  ));
}
