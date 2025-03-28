import 'package:flutter/material.dart';

class LifePuzzle extends StatefulWidget {
  @override
  _LifePuzzleState createState() => _LifePuzzleState();
}

class _LifePuzzleState extends State<LifePuzzle> {
  List<String> images = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
    'assets/image4.png',
    'assets/image5.png',
  ];
  Map<String, int> selectionOrder = {};
  int counter = 1;

  void selectImage(String image) {
    setState(() {
      if (selectionOrder.containsKey(image)) {
        int removedOrder = selectionOrder[image]!;
        selectionOrder.remove(image);

        // Adjust order numbers dynamically
        selectionOrder.forEach((key, value) {
          if (value > removedOrder) {
            selectionOrder[key] = value - 1;
          }
        });

        counter--;
      } else {
        selectionOrder[image] = counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SELECT THE IMAGES!!!',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xFFE8B17A), // Golden Sand
        elevation: 4,
        shadowColor: Colors.black26,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF4C7AB), // Soft Peach
              Color(0xFFDA7C5A), // Muted Coral
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1, // Ensures all images are equal size
                  children: [
                    for (int i = 0; i < images.length; i++) _buildImageCard(images[i]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard(String image) {
    return GestureDetector(
      onTap: () => selectImage(image),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFA7B798).withOpacity(0.5), // Gentle Olive shadow
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(2, 4),
            ),
          ],
          border: selectionOrder.containsKey(image)
              ? Border.all(color: Color(0xFFC48E85), width: 3) // Dusty Rose outline
              : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            if (selectionOrder.containsKey(image))
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFC48E85).withOpacity(0.8), // Dusty Rose
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF5E4634).withOpacity(0.3),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(12),
                child: Text(
                  selectionOrder[image].toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
