import 'package:flutter/material.dart';

class FinderHomePage extends StatefulWidget {
  const FinderHomePage({super.key});

  @override
  State<FinderHomePage> createState() => _FinderPageState();
}

class _FinderPageState extends State<FinderHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Finder'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
