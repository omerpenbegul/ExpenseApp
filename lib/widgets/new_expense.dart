import 'package:expenceapp/models/expense.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.onnAdd, {Key? key}) : super(key: key);
  final void Function(Expense expense) onnAdd;

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.Food;

  void _openDate() async {
    DateTime today = DateTime.now();
    DateTime oneYearAgo = DateTime(today.year - 1, today.month, today.day);
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: oneYearAgo,
        lastDate: today);
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(children: [
          TextField(
            controller: _expenseNameController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: "Harcama Adı"),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expensePriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Harcama Miktarı", prefixText: "₺"),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_month),
                onPressed: () => _openDate(),
              ),
              Text(_selectedDate == null
                  ? "Tarih Seciniz"
                  : DateFormat.yMd().format(_selectedDate!)),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category.name));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) _selectedCategory = value;
                    });
                  })
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Vazgec")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    double? price =
                        double.tryParse(_expensePriceController.text);

                    Expense expense = Expense(
                        name: _expenseNameController.text,
                        price: price!,
                        date: _selectedDate!,
                        category: _selectedCategory);
                    widget.onnAdd(expense);
                    Navigator.pop(context);
                  },
                  child: const Text("Ekle")),
            ],
          ),
        ]),
      ),
    );
  }
}
