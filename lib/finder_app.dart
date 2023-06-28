import 'package:flutter/material.dart';

import 'package:finder/bachelors_master.dart';

class FinderApp extends StatelessWidget {
  const FinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP Finder',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BachelorsMaster(),
    );
  }
}
