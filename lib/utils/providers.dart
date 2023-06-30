// Provider de la liste des favoris
import 'package:flutter/material.dart';

import '../models/bachelor.dart';
import 'bachelors_generate.dart';

class BachelorsFavoritesProvider extends ChangeNotifier {
  final List<Bachelor> _list = [];

  List<Bachelor> get getBachelorsFavorites => _list;

  void toggleFavoritesBachelor(Bachelor newBachelor) {
    if (_list.contains(newBachelor)) {
      _list.remove(newBachelor);
    } else {
      _list.add(newBachelor);
    }
    notifyListeners();
  }

  void deleteFavoriteBachelor(Bachelor bachelor) {
    _list.remove(bachelor);
    notifyListeners();
  }
}

// Provider de la liste des bachelors avec filtres
class BachelorsProvider extends ChangeNotifier {
  final List<String> _dislikeList = [];
  List<Bachelor> _authorized = [];
  bool _femaleSelected = true;
  bool _maleSelected = true;

  List<String> get getBachelorsDislike => _dislikeList;

  List<Bachelor> get getAuthorized => _authorized
      .where((customer) => !_dislikeList.contains(customer.id))
      .toList();

  bool get getFemaleSelect => _femaleSelected;
  bool get getMaleSelect => _maleSelected;

  void fillBachelors(List<Bachelor> bachelors) {
    _authorized = bachelors;
  }

  void addDislike(Bachelor bachelor) {
    _dislikeList.add(bachelor.id!);
    notifyListeners();
  }

  void toggleGender(Gender gender) {
    if (gender == Gender.female) {
      _femaleSelected = !_femaleSelected;
    } else {
      _maleSelected = !_maleSelected;
    }
    updateBachelorsList();
    notifyListeners();
  }

  void updateBachelorsList() {
    _authorized = allCustomers();
    if (_femaleSelected && !_maleSelected) {
      _authorized = _authorized
          .where((element) => element.gender == Gender.female)
          .toList();
    } else if (!_femaleSelected && _maleSelected) {
      _authorized = _authorized
          .where((element) => element.gender == Gender.male)
          .toList();
    } else if (!_femaleSelected && !_maleSelected) {
      _authorized = [];
    }
    notifyListeners();
  }

  void cleanList() {
    _authorized = allCustomers();
    _femaleSelected = true;
    _maleSelected = true;
    notifyListeners();
  }
}
