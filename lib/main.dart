import 'package:finder/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:finder/finder_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => BachelorsFavoritesProvider()),
      ChangeNotifierProvider(create: (context) => BachelorsProvider()),
    ], child: const FinderApp()),
  );
}
