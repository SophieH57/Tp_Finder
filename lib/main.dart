import 'package:flutter/material.dart';
import 'package:finder/finder_app.dart';
import 'package:provider/provider.dart';

import 'models/bachelor.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => LikedList(), child: const FinderApp()),
  );
}

class LikedList extends ChangeNotifier {
  final List<Bachelor> _list = [];

  List<Bachelor> get getLikedList => _list;

  void addLikeBachelor(Bachelor newBachelor) {
    _list.add(newBachelor);
    notifyListeners();
  }
}
