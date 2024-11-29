import 'package:components/routes/routes.dart';
import 'package:flutter/material.dart';

class DismissibleListVIEW extends StatelessWidget {
  const DismissibleListVIEW({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('lista con snooze')),
        body: const DismissibleList(),
      ),
    );
  }
}

class DismissibleList extends StatefulWidget {
  const DismissibleList({super.key});

  @override
  State<DismissibleList> createState() => _DismissibleList();
}

class _DismissibleList extends State<DismissibleList> {
  List<int> items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(color: Colors.red),
          key: ValueKey<int>(items[index]),
          onDismissed: (DismissDirection direction) {
            setState(() {
              items.removeAt(index);
            });
          },
          child: ListTile(
            title: Text('Item ${items[index]}'),
          ),
        );
      },
    );
  }
}
