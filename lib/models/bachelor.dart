import 'package:uuid/uuid.dart';

enum Gender { male, female }

class Bachelor {
  String firstname;
  String lastname;
  Gender gender;
  String avatar;
  String? id;
  List<Gender>? searchFor;
  String? job;
  String? description;

  Bachelor({
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.avatar,
    this.description,
    this.job,
    this.searchFor,
    this.id,
  }) {
    id ?? const Uuid().v4();
  }

  @override
  String toString() {
    return 'Bachelor("firstname":"$firstname","lastname":"$lastname"';
  }
}
