import 'package:components/routes/routes.dart';
import 'package:flutter/material.dart';

class SegmentedView extends StatelessWidget {
  const SegmentedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReordableListEXP(),
    );
  }
}

class ReordableListEXP extends StatefulWidget {
  const ReordableListEXP({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ReordableListEXPState createState() => _ReordableListEXPState();
}

class _ReordableListEXPState extends State<ReordableListEXP> {
  final List<String> _items = [
    '1',
    '2',
    '3',
    '4n',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ReordableListEXP "),
        ),
        body: ReorderableListView(
          onReorder: _onReorder,
          children: _items.map((item) => _buildListTile(item)).toList(),
        ));
  }

  Widget _buildListTile(String item) {
    return ListTile(
      key: ValueKey(item),
      title: Text(item),
      leading: Icon(Icons.numbers),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final String item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }
}
