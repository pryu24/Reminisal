import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Color(0xFFFFE5D9),
        elevation: 4,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNavigationButton(
                context,
                title: "Life Puzzle",
                icon: Icons.extension,
                route: '/puzzle',
              ),
              SizedBox(height: 20),
              _buildNavigationButton(
                context,
                title: "User Profile",
                icon: Icons.person,
                route: '/profile',
              ),
              SizedBox(height: 20),
              _buildNavigationButton(
                context,
                title: "Login",
                icon: Icons.login,
                route: '/WarmLoginPage',
              ),
              SizedBox(height: 20),
              _buildNavigationButton(
                context,
                title: "Chatbot", // Added chatbot button
                icon: Icons.chat,
                route: '/ChatScreen',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context,
      {required String title, required IconData icon, required String route}) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      icon: Icon(icon, size: 28, color: Colors.white),
      label: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        backgroundColor: Color(0xFF6B705C),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 6,
      ),
    );
  }
}
