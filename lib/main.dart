import 'package:expenceapp/models/expense.dart';
import 'package:expenceapp/pages/expenses_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 252, 161, 24),
          centerTitle: true,
          title: const Text(
            "Expense App",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_sharp),
              iconSize: 25,
            )
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          elevation: 8,
        ),
        body: ExpensesPage(),
      ),
    ),
  );
}
