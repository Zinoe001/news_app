import 'package:flutter/material.dart';
// defined the primaryColor of the app
Map<int, Color> _primaryColor = {
  50 : const Color(0XFF1ABC9C).withOpacity(0.1),
  100 : const Color(0XFF1ABC9C).withOpacity(0.2),
  200 : const Color(0XFF1ABC9C).withOpacity(0.3),
  300 : const Color(0XFF1ABC9C).withOpacity(0.4),
  400 : const Color(0XFF1ABC9C).withOpacity(0.5),
  500 : const Color(0XFF1ABC9C).withOpacity(0.6),
  600 : const Color(0XFF1ABC9C).withOpacity(0.7),
  700 : const Color(0XFF1ABC9C).withOpacity(0.8),
  800 : const Color(0XFF1ABC9C).withOpacity(0.9),
  900 : const Color(0XFF1ABC9C),
};

final MaterialColor kPrimaryColor = MaterialColor(0XFF1ABC9C, _primaryColor);

Map<int, Color> _secondaryColor = {
  50 : const Color(0XFF0E6251).withOpacity(0.1),
  100 : const Color(0XFF0E6251).withOpacity(0.2),
  200 : const Color(0XFF0E6251).withOpacity(0.3),
  300 : const Color(0XFF0E6251).withOpacity(0.4),
  400 : const Color(0XFF0E6251).withOpacity(0.5),
  500 : const Color(0XFF0E6251).withOpacity(0.6),
  600 : const Color(0XFF0E6251).withOpacity(0.7),
  700 : const Color(0XFF0E6251).withOpacity(0.8),
  800 : const Color(0XFF0E6251).withOpacity(0.9),
  900 : const Color(0XFF0E6251),
};

final MaterialColor kSecondaryColor = MaterialColor(0XFF0E6251, _secondaryColor);
