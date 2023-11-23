import 'package:expenceapp/models/expense.dart';
import 'package:expenceapp/pages/expenses_page.dart';
import 'package:expenceapp/pages/main_page.dart';
import 'package:flutter/material.dart';

ColorScheme colorScheme1 = ColorScheme.fromSeed(seedColor: Colors.deepOrange);
ColorScheme colorScheme2 = ColorScheme.fromSeed(seedColor: Colors.grey);
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme1,
          appBarTheme:
              AppBarTheme(backgroundColor: colorScheme1.onPrimaryContainer),
          cardTheme: CardTheme(
              color: colorScheme2.onPrimary, margin: EdgeInsets.all(8))),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    ),
  );
}
