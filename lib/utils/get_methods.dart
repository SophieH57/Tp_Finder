import 'package:flutter/material.dart';

import '../models/bachelor.dart';

Color getBackgroundColorAccordingToGender(Gender gender) {
  return gender == Gender.male
      ? Colors.lightGreen.shade100
      : Colors.red.shade100;
}

Color getTextColorAccordingToGender(Gender gender) {
  return gender == Gender.male ? Colors.lightGreen : Colors.red;
}
