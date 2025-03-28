import 'package:flutter/material.dart';

class AvatarSelection extends StatelessWidget {
  final List<String> avatars = [
    "assets/avatar1.png",
    "assets/avatar2.png",
    "assets/avatar3.png",
    "assets/avatar4.png",
    "assets/avatar5.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Avatar"),
        backgroundColor: Color(0xFFFD8A48F),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: avatars.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, avatars[index]);
            },
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(avatars[index]),
            ),
          );
        },
      ),
    );
  }
}
