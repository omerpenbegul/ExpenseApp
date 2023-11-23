import 'package:expenceapp/models/expense.dart';
import 'package:expenceapp/pages/expenses_page.dart';
import 'package:expenceapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Expense> expenses = [
    Expense(
        name: "Yemek",
        price: 500.529,
        date: DateTime.now(),
        category: Category.Food),
    Expense(
        name: "Udemy Kursu",
        price: 200,
        date: DateTime.now(),
        category: Category.Work),
  ];
  addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  removeExpense(Expense expense) {
    final deletingIndex = expenses.indexOf(expense);
    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Harcama başarıyla silindi"),
      action: SnackBarAction(
          label: 'Geri Al',
          onPressed: () {
            setState(() {
              expenses.insert(deletingIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Expense App",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return NewExpense(addExpense);
                  });
            },
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
      body: ExpensesPage(expenses, removeExpense),
    );
  }
}
