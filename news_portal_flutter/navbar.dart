import 'package:flutter/material.dart';
import 'package:flutter_newsportal/Login2.dart';
import 'package:flutter_newsportal/UserSignupScreen.dart';
import 'package:flutter_newsportal/main.dart';
import 'package:flutter_newsportal/Page1.dart';
import 'package:flutter_newsportal/Bangladesh.dart';
import 'package:flutter_newsportal/International.dart';
import 'package:flutter_newsportal/Education.dart';
import 'package:flutter_newsportal/Sports.dart';
import 'package:flutter_newsportal/Opinion.dart';
import 'package:flutter_newsportal/Entertainment.dart';
import 'package:flutter_newsportal/Features.dart';

import 'Postnews.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Rahat'),
            accountEmail: const Text('rahat@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/profile.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              image: DecorationImage(
                image: AssetImage('images/back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),





          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Login2()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('Sign Up'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  UserSignupScreen()),
              );
            },
          ),
           ListTile(
            leading: const Icon(Icons.pages),
            title: const Text('Post News'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Login2()),
              );
            },
          ),



          // ListTile(
          //   leading: const Icon(Icons.pages),
          //   title: const Text('Sports'),
          //   onTap: () {
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(builder: (context) => const Sports()),
          //     // );
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.pages),
          //   title: const Text('Opinion'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) =>  Opinion()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.pages),
          //   title: const Text('Entertainment'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) =>  Entertainment()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.pages),
          //   title: const Text('Features'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) =>  Features()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.file_upload),
          //   title: const Text('Upload'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) =>  Postnews()),
          //     );
          //
          //
          //     // Add onTap functionality for Upload page if needed
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.abc),
          //   title: const Text('ABC'),
          //   onTap: () {
          //     // Add onTap functionality for ABC page if needed
          //   },
          // ),
        ],
      ),
    );
  }
}
