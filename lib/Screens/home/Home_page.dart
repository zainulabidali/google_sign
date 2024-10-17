import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_login/auth_service.dart';
import 'package:google_login/const/const.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService(); // Initialize AuthService

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch the User from Provider
    final user = context.watch<User?>();

    return Scaffold(
      appBar: AppBar(
        leading: user != null
            ? Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.network(user.photoURL!),
              )
            : SizedBox(),
        title: Text(
            user?.displayName ?? "Guest"), // Display user's name or 'Guest'
        backgroundColor: KprimaryColor,
        actions: [
          IconButton(
            onPressed: () async {
              // Call signOut method on AuthService
              await _authService.signOut();
            },
            icon: Icon(Icons.output_rounded),
          ),
        ],
      ),
      body: Center(
        child: Text(
            'Welcome, ${user?.displayName ?? 'Guest'}!'), // Display welcome message
      ),
    );
  }
}
