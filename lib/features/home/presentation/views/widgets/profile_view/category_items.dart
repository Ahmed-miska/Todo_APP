import 'package:flutter/material.dart';

class CategoryItems {
  String text = 'Grocery';
  Color color = Color(0xffCCFF80);
  Icon icon = Icon(Icons.food_bank);
}

class DateItem {
  TimeItem? timeItem;
  String? day;
}

class TimeItem {
  String hour = "12";
  String minute = "0";
  String m = 'AM';
}

class EditTitle {
  TextEditingController titcont = TextEditingController();
  TextEditingController discont = TextEditingController();
}
