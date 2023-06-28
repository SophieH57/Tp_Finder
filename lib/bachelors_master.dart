import 'package:finder/custom_widgets/bachelor_preview.dart';
import 'package:flutter/material.dart';

import 'models/bachelor.dart';
import 'utils/bachelors_generate.dart';

class BachelorsMaster extends StatefulWidget {
  final List<Bachelor> likedBachelorsList = [];
  BachelorsMaster({super.key});

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  void setLikedBachelorsList() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Finder'),
      ),
      body: ListView.builder(
          itemCount: allCustomers.length,
          itemBuilder: ((context, index) {
            return BachelorPreview(bachelor: allCustomers[index]);
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
