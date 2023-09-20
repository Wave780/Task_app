
import 'package:flutter/material.dart';

enum TaskCategories {
  education(Icons.school, Colors.blueGrey),

  health(Icons.favorite, Colors.orange),
  home(Icons.home, Colors.green),
  others(Icons.calendar_month, Colors.purple),
  personal(Icons.person, Colors.lightBlue),
  shopping(Icons.shopping_bag, Colors.pink),
  people(Icons.people, Colors.brown),
  social(Icons.flight, Colors.deepOrange);

  static TaskCategories stringToCategory(String name) {
    try {
      return TaskCategories.values
          .firstWhere((category) => category.name == name);
    } catch (e) {
      return TaskCategories.others;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategories(this.icon, this.color);
}
