import 'package:flutter/material.dart';

import 'bachelors_generate.dart';

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
      body: ListView.builder(
          itemCount: allCustomers.length,
          itemBuilder: ((context, index) {
            return Card(
              child: Row(
                children: [
                  Image.asset(allCustomers[index].avatar),
                  Text(
                      '${allCustomers[index].firstname} ${allCustomers[index].lastname}')
                ],
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
