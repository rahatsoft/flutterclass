import 'package:flutter/material.dart';
import 'package:navigationdrawerflutter/main.dart';
import 'package:navigationdrawerflutter/Page2.dart';
import 'package:navigationdrawerflutter/Page1.dart';

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
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.pages),
            title: const Text('page1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page1()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.pages),
            title: const Text('page2'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page2()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.file_upload),
            title: const Text('Upload'),
          ),
          ListTile(
            leading: const Icon(Icons.abc),
            title: const Text('ABC'),
          ),
        ],
      ),
    );
  }
}
