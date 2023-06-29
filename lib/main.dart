import 'package:finder/utils/bachelors_generate.dart';
import 'package:flutter/material.dart';
import 'package:finder/finder_app.dart';
import 'package:provider/provider.dart';

import 'models/bachelor.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => BachelorsFavoritesProvider()),
      ChangeNotifierProvider(create: (context) => BachelorsProvider()),
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
class BachelorsProvider extends ChangeNotifier {
  final List<int> _dislikeList = [];
  List<Bachelor> _authorized = allCustomers;
  bool _femaleSelected = true;
  bool _maleSelected = true;

  List<int> get getBachelorsDislike => _dislikeList;
  List<Bachelor> get getAuthorized => _authorized;
  bool get getFemaleSelect => _femaleSelected;
  bool get getMaleSelect => _maleSelected;

  void addDislike(int bachelorId) {
    _dislikeList.add(bachelorId);
    _authorized = _authorized
        .where((customer) => !_dislikeList.contains(customer.id))
        .toList();
    notifyListeners();
  }

  void selectGender(Gender gender) {
    if (gender == Gender.female) {
      _femaleSelected = !_femaleSelected;
    } else if (gender == Gender.male) {
      _maleSelected = !_maleSelected;
    }
    updateBachelorsList();
    notifyListeners();
  }

  void updateBachelorsList() {
    if (_femaleSelected && !_maleSelected) {
      _authorized = _authorized
          .where((element) => element.gender == Gender.female)
          .toList();
    } else if (!_femaleSelected && _maleSelected) {
      _authorized = _authorized
          .where((element) => element.gender == Gender.male)
          .toList();
    } else if (_femaleSelected && _maleSelected) {
      _authorized = allCustomers;
    } else {
      _authorized = [];
    }
    notifyListeners();
  }

  void cleanList() {
    _authorized = allCustomers;
    _femaleSelected = true;
    _maleSelected = true;
    notifyListeners();
  }
}
