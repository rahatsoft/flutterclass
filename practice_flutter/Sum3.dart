// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Simple Calculator',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: const MyHomePage(title: 'Simple Calculator'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController num1Controller = TextEditingController();
//   TextEditingController num2Controller = TextEditingController();
//   TextEditingController resultController = TextEditingController(readOnly: true);
//
//   // List of operation functions with descriptive names
//   List<Function(double, double)> operations = [
//         (double x, double y) => x + y, // Add
//         (double x, double y) => x - y, // Subtract
//         (double x, double y) => x * y, // Multiply
//         (double x, double y) {
//       if (y == 0) {
//         // Handle division by zero error
//         return double.nan; // Not a Number
//       } else {
//         return x / y;
//       }
//     }, // Divide
//   ];
//
//   // Dropdown items and default selected item
//   String selectedOperation = 'Add';
//   List<String> dropdownItems = ['Add', 'Subtract', 'Multiply', 'Divide'];
//
//   void calculateResult() {
//     double num1 = double.tryParse(num1Controller.text) ?? 0.0;
//     double num2 = double.tryParse(num2Controller.text) ?? 0.0;
//
//     // Find the index of the selected operation
//     int selectedIndex = dropdownItems.indexOf(selectedOperation);
//
//     // Perform the selected operation and handle potential errors
//     double result;
//     try {
//       result = operations[selectedIndex](num1, num2);
//     } catch (e) {
//       // Handle exceptions like division by zero
//       result = double.nan;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error: ${e.toString()}'),
//         ),
//       );
//     }
//
//     // Update the result TextField
//     resultController.text = result.toStringAsFixed(2); // Show result with 2 decimal places
//
//     // Show a SnackBar with the result
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Result: $result')),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: SingleChildScrollView( // Allow scrolling if content overflows
//         padding: const EdgeInsets.all(20.0),
//     child: Column(
//     children: <Widget>[
//     TextField(
//     controller: num1Controller,
//     keyboardType: TextInputType.number,
//     decoration: InputDecoration(
//     labelText: "First Number",
//     hintText: "Enter first number",
//     border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//     ),
//     ),
//     ),
//     SizedBox(height: 10.0),
//     TextField(
//     controller: num2Controller,
//     keyboardType: TextInputType.number,
//     decoration: InputDecoration(
//     labelText: "Second Number",
//     hintText: "Enter second number",
//     border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//     ),
//     ),
//     ),
//     SizedBox(height: 10.0),
//     TextField(
//     controller: resultController,
//     decoration: InputDecoration(
//     labelText: "Result",
//     hintText: "Result will be displayed here",
//     border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//     ),
//     ),
//     ),
//     SizedBox(height: 10.0),
//     Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//     DropdownButton<String
