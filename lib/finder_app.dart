import 'package:flutter/material.dart';

import 'package:finder/finder_home_page.dart';

class FinderApp extends StatelessWidget {
  const FinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP Finder',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const FinderHomePage(),
    );
  }
}
