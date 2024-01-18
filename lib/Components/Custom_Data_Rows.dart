// ignore_for_file: file_names, camel_case_types, must_be_immutable
import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_Text.dart';

class Detail_Rows extends StatelessWidget {
  Detail_Rows({super.key, required this.title, required this.data});
  String title;
  dynamic data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 10,
          child: SizedBox(
            child: Text_medium_dark(title: title),
          ),
        ),
        const Expanded(
            flex: 1,
            child: SizedBox(
              width: 1,
            )),
        Expanded(
          flex: 9,
          child: SizedBox(
            child: Text_medium_dark(title: data.toString()),
          ),
        ),
      ],
    );
  }
}
