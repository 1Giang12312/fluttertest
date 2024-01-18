// ignore_for_file: camel_case_types, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:vnptapp/Variable/Constant.dart';
class Custom_RichText extends StatelessWidget {
  Custom_RichText(
      {super.key, required this.normaText, required this.colorText});
  String normaText;
  String colorText;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: normaText,
        style: const TextStyle(fontSize: 20, color: Colors.black),
        // Phong cách văn bản mặc định
        children: <TextSpan>[
          TextSpan(
            text: colorText,
            style: const TextStyle(
              color: Colors.red, // Màu sắc bạn muốn áp dụng
              fontWeight: FontWeight.bold, // Các thuộc tính văn bản khác
            ),
          ),
        ],
      ),
    );
  }
}

class Custom_HugeRichText extends StatelessWidget {
  Custom_HugeRichText(
      {super.key, required this.colorText,required this.normaText,});
  String normaText;
  String colorText;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: colorText,
        style: TextStyle(fontSize: FontSizemedium, color: Colors.red),
        children: <TextSpan>[
          TextSpan(
            text: normaText,
            style: TextStyle(
             //color: textDarkColor, // Màu sắc bạn muốn áp dụng
              fontSize: FontSizemedium, // Các thuộc tính văn bản khác
            ),
          ),
        ],
      ),
    );
  }
}
