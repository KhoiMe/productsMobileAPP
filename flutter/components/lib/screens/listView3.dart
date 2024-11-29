import 'package:flutter/material.dart';

class ListView3 extends StatelessWidget {
  const ListView3({Key? key}) : super(key: key);

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
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.separated(
          itemCount: options.length,
          itemBuilder: (context, i) => ListTile(
            title: Text(options[i]),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.yellow,
            ),
          ),
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
