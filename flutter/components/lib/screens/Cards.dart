import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

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
      ),
      body: ListView
      (
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: const
          [
              Card
              (
                child: Column
                (
                    children: 
                    [
                        ListTile
                        (
                            leading: Icon
                            (
                            Icons.photo_album_outlined,
                            color: Colors.red
                            ), 
                            title: Text ("hi"),
                            subtitle: Text(
                            "Soy una descripcion muy larga"
                        ),
                    ),
                  ]
                )
              )
            ],
          ),
       );
  }
}
