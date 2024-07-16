import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main.dart';
import 'navbar.dart';

class Blog {
  final int? blog_id;
  final String writer;
  final String title;
  final String description;
  final String publ_date;
  final String image;
  final String category;

  Blog({
    this.blog_id,
    required this.writer,
    required this.title,
    required this.description,
    required this.publ_date,
    required this.image,
    required this.category,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      blog_id: json['blog_id'],
      writer: json['writer'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      publ_date: json['publ_date'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
    );
  }
}

class DetailNews extends StatelessWidget {
  final int blogId;

  DetailNews({required this.blogId});

  Future<Blog?> fetchBlogDetails() async {
    final response = await http.get(Uri.parse('http://192.168.0.79:8080/getBlogById/$blogId'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Blog.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load blog details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: Text('Blog Details'),
      ),
      body: FutureBuilder<Blog?>(
        future: fetchBlogDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No data available"));
          } else {
            Blog blog = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300, // আপনি এখানে উচ্চতা নির্ধারণ করতে পারেন
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(blog.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: blog.image.isEmpty
                        ? Container(
                      color: Colors.grey[300],
                      child: Center(
                        child: Text(
                          'Error loading image',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    )
                        : null,
                  ),
                  SizedBox(height: 10),
                  Text(
                    blog.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'By ${blog.writer} | ${blog.publ_date}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 10),
                  Text(
                    blog.description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }
        },
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
    );
  }
}
