import 'package:flutter/material.dart';

// EX 1 – The hobbies (handout page: EX 1)
// Part 1: build ONE hobby card.
// Part 2: extract it into a StatelessWidget called HobbyCard, then show several cards.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Hobbies'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HobbyCard(
                title: 'Travelling',
                icon: Icons.travel_explore,
                backgroundColor: Colors.green,
              ),

              SizedBox(height: 20),

              HobbyCard(
                title: 'Skating',
                icon: Icons.skateboarding,
                backgroundColor: Colors.blueGrey,
              ),

            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  // Properties
  final String title;
  final IconData icon;
  final Color backgroundColor;

  // Constructor
  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),

          const SizedBox(width: 20),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
