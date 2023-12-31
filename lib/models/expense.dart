// id => identifier => kimlik belirleyici

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { Work, Travel, Food, Dress }

const categoryIcons = {
  Category.Work: Icons.work,
  Category.Travel: Icons.place_outlined,
  Category.Dress: Icons.abc,
  Category.Food: Icons.food_bank,
};

class Expense {
  Expense(
      {required this.name,
      required this.price,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String name;
  final double price;
  final DateTime date;
  final Category category;
}

// int,long => 1,2,3,4,5,99999999

// String => 2c7cf20e-5dbb-41ad-a9d0-124635f347ef, d1b6ee05-73c0-4924-9ed7-f3b2e50ee0a9