import 'package:finder/custom_widgets/bachelor_preview.dart';
import 'package:flutter/material.dart';

import 'models/bachelor.dart';
import 'utils/bachelors_generate.dart';

class BachelorsMaster extends StatefulWidget {
  const BachelorsMaster({super.key});

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  List<Bachelor> likedBachelorsList = [];

  void addLikedBachelor(Bachelor newBachelor) {
    setState(() {
      likedBachelorsList.add(newBachelor);
    });
  }

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
    );
  }
}
