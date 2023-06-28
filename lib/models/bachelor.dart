import 'package:faker/faker.dart';

enum Gender { male, female }

class Bachelor {
  String firstname;
  String lastname;
  Gender gender;
  String avatar;
  List<Gender>? searchFor;
  Job? job;
  String? description;

  Bachelor(this.firstname, this.lastname, this.gender, this.avatar,
      [this.searchFor, this.job, this.description]);
}
