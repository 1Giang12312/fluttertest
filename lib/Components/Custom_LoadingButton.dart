// ignore_for_file: must_be_immutable, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';
class Custom_LoadingButtonLight extends StatelessWidget {
  Custom_LoadingButtonLight(
      {super.key, required this.nameOfLoadingButton, required this.func});
  String nameOfLoadingButton;
  Function() func;

  @override
  Widget build(BuildContext context) {
    return LoadingBtn(
      //color: Colors.white,
      height: 50,
      borderRadius: 8,
      animate: true,
      width: MediaQuery.of(context).size.width * 0.45,
      loader: Container(
        padding: const EdgeInsets.all(10),
        width: 40,
        height: 40,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      child: Text(nameOfLoadingButton),
      onTap: (startLoading, stopLoading, btnState) async {
        if (btnState == ButtonState.idle) {
          startLoading();
          await func();
          stopLoading();
        }
      },
    );
  }
}

class Custom_LoadingTextButton extends StatelessWidget {
  Custom_LoadingTextButton(
      {super.key,
      required this.nameOfLoadingButton,
      required this.func});
  String nameOfLoadingButton;
  Function() func;
  @override
  Widget build(BuildContext context) {
    return LoadingBtn(
     // color: colors(context).color1,
      height: 50,
      borderRadius: 8,
      animate: true,
      width: MediaQuery.of(context).size.width * 0.45,
      loader: Container(
        padding: const EdgeInsets.all(10),
        width: 40,
        height: 40,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      child: //Text_medium_light(title: nameOfLoadingButton),
      Text(nameOfLoadingButton),
      onTap: (startLoading, stopLoading, btnState) async {
        if (btnState == ButtonState.idle) {
          startLoading();
          await func();
          stopLoading();
        }
      },
    );
  }
}
