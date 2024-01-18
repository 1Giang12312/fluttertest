// ignore_for_file: camel_case_types, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:vnptapp/Variable/Constant.dart';

class Custom_Card extends StatelessWidget {
  Custom_Card(
      {super.key,
      required this.item,
      required this.list,
      required this.widget});
  dynamic item;
  dynamic list;
  dynamic widget;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: list.indexOf(item) % 2 == 0
            ? isDarkMode
                ? Card_colors_dark_1
                : Card_colors_1
            : isDarkMode
                ? Card_colors_dark_2
                : Card_colors_2,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {},
            child: widget));
  }
}
