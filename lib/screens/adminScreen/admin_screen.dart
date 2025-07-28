import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auth/login_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Screen'),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Icon(Icons.logout_rounded),
          ),
        ],
      ),

      // Insert,Delete and Edit data through firebase......
      body: Column(children: [
        ],
      ),
    );
  }
}
