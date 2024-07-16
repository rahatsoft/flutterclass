import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'DetailNews.dart'; // Assuming this file contains the detail page for each blog

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

class Shownewsbycategory extends StatefulWidget {
  final String category;

  const Shownewsbycategory({Key? key, required this.category}) : super(key: key);

  @override
  _ShownewsbycategoryState createState() => _ShownewsbycategoryState();
}

class _ShownewsbycategoryState extends State<Shownewsbycategory> {
  late Future<List<Blog>> futureBlogs;

  @override
  void initState() {
    super.initState();
    futureBlogs = fetchBlogsByCategory(widget.category);
  }

  Future<List<Blog>> fetchBlogsByCategory(String category) async {
    final response = await http.get(Uri.parse('http://192.168.0.79:8080/category/$category'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((blog) {
        return Blog.fromJson(blog);
      }).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category), // Display the category name in the app bar
      ),
      body: Center(
        child: FutureBuilder<List<Blog>>(
          future: futureBlogs,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text("No blogs available");
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailNews(blogId: snapshot.data![index].blog_id!),
                        ),
                      );
                    },
                    child: BlogCard(blog: snapshot.data![index]),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final Blog blog;

  BlogCard({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            blog.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                height: 200,
                child: Center(
                  child: Text(
                    'Error loading image',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  blog.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'By ${blog.writer} | ${blog.publ_date}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 10),
                Text(
                  blog.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
