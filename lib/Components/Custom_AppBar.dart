// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Variable/Constant.dart';

class Custom_AppBar extends StatelessWidget implements PreferredSizeWidget{
   // ignore: prefer_const_constructors_in_immutables
   Custom_AppBar({super.key,required this.title});
 final String title;
 
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
       backgroundColor: isDarkMode? secondDaryColors: primaryColors,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
          //color: Colors.white,
        ),
        title: Text_norma_dark(title: title),
      );
  }
}