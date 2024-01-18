// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vnptapp/Variable/Constant.dart';

// ignore: must_be_immutable
class LoadingScreen extends StatefulWidget {
  LoadingScreen({super.key, required this.nameOfLoadingScreen});
  String nameOfLoadingScreen;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 5,
        ),
        LoadingAnimationWidget.inkDrop(
          color: primaryColors,
          size: widthOfDevice(context) / 8,
        ),
        Text(
          widget.nameOfLoadingScreen,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            //  color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    ));
  }
}
