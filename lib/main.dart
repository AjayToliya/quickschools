import 'package:flutter/material.dart';
import 'Screens/Homepage.dart';
import 'Screens/details.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Homepage(),
        'details': (context) => Details(),
      },
    ),
  );
}
