// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Login_TextFormField extends StatelessWidget {
  final String nameOfTextFormField;
  final TextEditingController controller;
  final bool isPassword;
  const Login_TextFormField(
      {super.key,
      required this.nameOfTextFormField,
      required this.controller,
      required this.isPassword});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          labelText: nameOfTextFormField,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "$nameOfTextFormField không được để trống";
          } else {
            return null;
          }
        },
      ),
    );
  }
}

// ignore: camel_case_types
class Custom_TextFormField extends StatelessWidget {
  final String nameOfTextFormField;
  final TextEditingController controller;
  final bool isPassword;
  const Custom_TextFormField(
      {super.key,
      required this.nameOfTextFormField,
      required this.controller,
      required this.isPassword});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 70,
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          labelText: nameOfTextFormField,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return "$nameOfTextFormField không được để trống";
        //   } else {
        //     return null;
        //   }
        // },
      ),
    );
  }
}

// ignore: camel_case_types
class Custom_TextFieldNumberPhone extends StatelessWidget {
  final String nameOfTextFormField;
  final TextEditingController controller;
  final bool isPassword;
  const Custom_TextFieldNumberPhone(
      {super.key,
      required this.nameOfTextFormField,
      required this.controller,
      required this.isPassword});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 70,
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          labelText: nameOfTextFormField,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "$nameOfTextFormField không được để trống";
          } else if (value.length != 9) {
            return "Nhập đủ 9 số";
          } else if (int.tryParse(value) == null) {
            return "Không được nhập chữ";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
