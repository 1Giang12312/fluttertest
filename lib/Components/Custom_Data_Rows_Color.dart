// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:vnptapp/Variable/Constant.dart';

class Custom_Data_Rows_Color extends StatelessWidget {
  Custom_Data_Rows_Color({required this.indexCount, required this.widget});
  bool indexCount;
  Widget widget;
  @override
  Widget build(BuildContext context) {
    Color color_temp_light;
    Color color_temp_dark;
    indexCount == true
        ? color_temp_light = Card_colors_1
        : color_temp_light = Card_colors_2;
    indexCount == true
        ? color_temp_dark = Card_colors_dark_1
        : color_temp_dark = Card_colors_dark_2;
    return Container(
        color: isDarkMode ? color_temp_dark : color_temp_light,
        alignment: Alignment.center,
        child: widget);
  }
}

class Custom_Data_Rows_Color_SmallData extends StatelessWidget {
  Custom_Data_Rows_Color_SmallData(
      {required this.indexCount,
      required this.title,
      required this.data});
  String title;
  dynamic data;
  bool indexCount;
  @override
  Widget build(BuildContext context) {
    Color color_temp_light;
    Color color_temp_dark;
    indexCount == true
        ? color_temp_light = Card_colors_1
        : color_temp_light = Card_colors_2;
    indexCount == true
        ? color_temp_dark = Card_colors_dark_1
        : color_temp_dark = Card_colors_dark_2;
    return Container(
        color: isDarkMode ? color_temp_dark : color_temp_light,
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 10,
              child: SizedBox(
                child: Text(title),
              ),
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  width: 1,
                )),
            Expanded(
              flex: 9,
              child: SizedBox(
                child: Text(data.toString()),
              ),
            ),
          ],
        ));
  }
}
class Custom_Data_Rows_Color_SmallTile extends StatelessWidget {
  Custom_Data_Rows_Color_SmallTile(
      {required this.indexCount,
      required this.title,
      required this.data});
  String title;
  dynamic data;
  bool indexCount;
  @override
  Widget build(BuildContext context) {
    Color color_temp_light;
    Color color_temp_dark;
    indexCount == true
        ? color_temp_light = Card_colors_1
        : color_temp_light = Card_colors_2;
    indexCount == true
        ? color_temp_dark = Card_colors_dark_1
        : color_temp_dark = Card_colors_dark_2;
    return Container(
        color: isDarkMode ? color_temp_dark : color_temp_light,
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 6,
              child: SizedBox(
                child: Text(title),
              ),
            ),
            Expanded(
                flex: 2,
                child: SizedBox(
                  width: 1,
                )),
            Expanded(
              flex: 12,
              child: SizedBox(
                child: Text(data.toString()),
              ),
            ),
          ],
        ));
  }
}