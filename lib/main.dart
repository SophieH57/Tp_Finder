import 'package:finder/utils/bachelors_generate.dart';
import 'package:flutter/material.dart';
import 'package:finder/finder_app.dart';
import 'package:provider/provider.dart';

import 'models/bachelor.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => BachelorsFavoritesProvider()),
      ChangeNotifierProvider(create: (context) => BachelorsDislikeProvider()),
    ], child: const FinderApp()),
  );
}

// Provider de la liste des favoris
class BachelorsFavoritesProvider extends ChangeNotifier {
  final List<Bachelor> _list = [];

  List<Bachelor> get getBachelorsFavorites => _list;

  void addFavoritesBachelor(Bachelor newBachelor) {
    _list.add(newBachelor);
    notifyListeners();
  }

  void deleteFavoriteBachelor(Bachelor bachelor) {
    _list.remove(bachelor);
    notifyListeners();
  }
}

// Provider de la liste des dislikes
class BachelorsDislikeProvider extends ChangeNotifier {
  final List<int> _dislikeList = [];
  List<Bachelor> _authorized = allCustomers;

  List<int> get getBachelorsDislike => _dislikeList;
  List<Bachelor> get getAuthorized => _authorized;

  void addDislike(int bachelorId) {
    _dislikeList.add(bachelorId);
    _authorized = _authorized
        .where((customer) => !_dislikeList.contains(customer.id))
        .toList();
    notifyListeners();
  }

  void cleanDislikeList() {
    _dislikeList.clear();
    notifyListeners();
  }
}
