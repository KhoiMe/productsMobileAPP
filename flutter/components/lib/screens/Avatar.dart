import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

  final options = const [
    'Megaman',
    'Metal gear',
    'super Smash Bros',
    'Mario Kart'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile tipo 3 con separated'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              child: const Text("SL"),
              backgroundColor: Colors.lightBlue,
            ),
          ),
        ],
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 110,
          backgroundImage: NetworkImage("https://images.app.goo.gl/ocmqTk69LeffBH2X7"),
        ),
      ),
    );
  }
}
