// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class Searchid extends StatefulWidget {
//   @override
//   State<Searchid> createState() => _SearchidState();
// }
//
// class _SearchidState extends State<Searchid> {
//   TextEditingController _idController = TextEditingController();
//   late Student _student = Student(id: 0, name: '', email: '', round: '');
//   bool _isLoading = false;
//   String _errorMessage = '';
//
//   Future<Student> searchStudent(int id) async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = '';
//     });
//
//     try {
//       final response = await http.get(
//         Uri.parse('http://192.168.0.79:8080/search/$id'),
//       );
//       if (response.statusCode == 200) {
//         return Student.fromJson(jsonDecode(response.body));
//       } else {
//         throw Exception('Failed to load student');
//       }
//     } catch (error) {
//       setState(() {
//         _errorMessage = 'Error: $error';
//       });
//       throw Exception('Error: $error');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Student by ID'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextFormField(
//               controller: _idController,
//               decoration: InputDecoration(
//                 labelText: 'Enter Student ID',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter a student ID';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 int id = int.tryParse(_idController.text) ?? 0;
//                 if (id != 0) {
//                   searchStudent(id).then((student) {
//                     setState(() {
//                       _student = student;
//                     });
//                   }).catchError((error) {
//                     print('Error: $error');
//                   });
//                 }
//               },
//               child: Text('Search'),
//             ),
//             SizedBox(height: 20),
//             _isLoading
//                 ? CircularProgressIndicator()
//                 : _errorMessage.isNotEmpty
//                 ? Text(_errorMessage)
//                 : _student.id != 0
//                 ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('ID: ${_student.id}'),
//                 Text('Name: ${_student.name}'),
//                 Text('Email: ${_student.email}'),
//                 Text('Round: ${_student.round}'),
//               ],
//             )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Student {
//   final int id;
//   final String name;
//   final String email;
//   final String round;
//
//   Student({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.round,
//   });
//
//   factory Student.fromJson(Map<String, dynamic> json) {
//     return Student(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       round: json['round'],
//     );
//   }
//
//
// void main() {
//   runApp(MaterialApp(
//     home: Searchid(),
//   ));
// }
