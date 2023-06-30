import 'dart:math';

import 'package:finder/data/avatars.dart';
import 'package:finder/data/firstnames.dart';

import '../models/bachelor.dart';
import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';

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
  List<Bachelor> persons = [];
  for (var i = 0; i < 15; i++) {
    Bachelor newBachelor = Bachelor(
      firstname: getFirstname(gender),
      lastname: faker.person.lastName(),
      gender: gender,
      avatar: gender == Gender.male ? menAvatars[i] : womenAvatars[i],
      searchFor: getSearchFor(),
      job: faker.job.title(),
      id: const Uuid().v4(),
      description: faker.lorem.sentence(),
    );
    persons.add(newBachelor);
  }
  return persons;
}

List<Bachelor> men = generateFifteenPersonsWithGender(Gender.male);
List<Bachelor> women = generateFifteenPersonsWithGender(Gender.female);
List<Bachelor> allCustomers() => [...men, ...women];
