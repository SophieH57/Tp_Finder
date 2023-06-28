import 'dart:math';

import 'package:finder/utils/avatars.dart';
import 'package:finder/utils/firstnames.dart';

import '../models/bachelor.dart';
import 'package:faker/faker.dart';

String getFirstname(Gender gender) {
  return gender == Gender.male
      ? maleFirstnames[Random().nextInt(17)]
      : femaleFirstnames[Random().nextInt(21)];
}

List<Gender> getSearchFor() {
  List<Gender> search = [];
  for (var i = 0; i < Random().nextInt(2); i++) {
    Gender gender = Random().nextInt(1) == 0 ? Gender.male : Gender.female;
    search.add(gender);
  }
  return search;
}

List<Bachelor> generateFifteenPersonsWithGender(Gender gender) {
  List<Bachelor> men = [];
  List<Bachelor> women = [];
  for (var i = 0; i < 15; i++) {
    Bachelor newBachelor = Bachelor(
        getFirstname(gender),
        faker.person.lastName(),
        gender,
        gender == Gender.male ? menAvatars[i] : womenAvatars[i],
        getSearchFor(),
        faker.job.title(),
        faker.lorem.sentence());
    gender == Gender.male ? men.add(newBachelor) : women.add(newBachelor);
  }
  return gender == Gender.male ? men : women;
}

List<Bachelor> men = generateFifteenPersonsWithGender(Gender.male);
List<Bachelor> women = generateFifteenPersonsWithGender(Gender.female);
List<Bachelor> allCustomers = [...men, ...women];
