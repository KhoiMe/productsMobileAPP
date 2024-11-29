import 'package:flutter/material.dart';

class ListView2 extends StatelessWidget {
  const ListView2({Key? key}) : super(key: key);

  final textThing = "textThing";
  final options = const ['Megaman', 'Metal gear', 'super Smash'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile tipo 1'),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [...options.map((game) => ListTile(
            title: Text(game),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
        ))],
      ),
    );
  }
}
