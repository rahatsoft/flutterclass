import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DetailNews.dart';
import 'Categoryclass.dart'; // Import Categoryclass

class Features extends StatefulWidget {
  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  late Future<List<Categoryclass>> futureBlogs;

  @override
  void initState() {
    super.initState();
    futureBlogs = fetchBlogsByCategory('Features');
  }

  Future<List<Categoryclass>> fetchBlogsByCategory(String category) async {
    final response = await http.get(Uri.parse('http://192.168.0.79:8080/category/$category'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((blog) {
        return Categoryclass.fromJson(blog);
      }).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Features News'),
      ),
      body: Center(
        child: FutureBuilder<List<Categoryclass>>(
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
                    child: CategoryclassCard(blog: snapshot.data![index]),
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

class CategoryclassCard extends StatelessWidget {
  final Categoryclass blog;

  CategoryclassCard({required this.blog});

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
