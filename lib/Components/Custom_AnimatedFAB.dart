// ignore_for_file: file_names, unused_element, unused_field

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_SizedBox.dart';
class ScaffoldDraggable extends StatefulWidget {
  const ScaffoldDraggable(
      {super.key, required this.child, required this.button});
  final Widget button;
  final Widget child;
  @override
  State<ScaffoldDraggable> createState() => _ScaffoldDraggableState();
}

class _ScaffoldDraggableState extends State<ScaffoldDraggable>
    with SingleTickerProviderStateMixin {
  Offset position = const Offset(0.0, 0.0);
  late AnimationController _animationController;
  late Animation<double> _buttonAnimatedIcon;
  late Animation<double> _translateButton;
  bool _isExpanded = false;
  @override
  initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });

    _buttonAnimatedIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _translateButton = Tween<double>(
      begin: 100,
      end: -20,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _toggle() {
    if (_isExpanded) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    _isExpanded = !_isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            widget.child,
          ],
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Transform(
              transform: Matrix4.translationValues(
                0,
                _translateButton.value * 3,
                0,
              ),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 61, 61, 61),
                      offset: Offset(
                        5.0,
                        5.0,
                      ), //Offset
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Color.fromRGBO(94, 157, 224, 1),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: MaterialButton(
                  onPressed: () {/* Do something */},
                  child: const Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                ),
              )),
          const MediumHeightSizedBox(),
          Transform(
              transform: Matrix4.translationValues(
                0,
                _translateButton.value * 3,
                0,
              ),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 61, 61, 61),
                      offset: Offset(
                        5.0,
                        5.0,
                      ), //Offset
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Color.fromRGBO(94, 157, 224, 1),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: MaterialButton(
                  onPressed: () {/* Do something */},
                  child: const Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                ),
              )),
          const MediumHeightSizedBox(),
          Transform(
              transform: Matrix4.translationValues(
                0,
                _translateButton.value * 3,
                0,
              ),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 61, 61, 61),
                      offset: Offset(
                        5.0,
                        5.0,
                      ), //Offset
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Color.fromRGBO(94, 157, 224, 1),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),
                child: MaterialButton(
                  onPressed: () {/* Do something */},
                  child: const Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                ),
              )),
          // This is the primary FAB
          // FloatingActionButton(
          //   onPressed: _toggle,
          //   child: AnimatedIcon(
          //     icon: AnimatedIcons.menu_close,
          //     progress: _buttonAnimatedIcon,
          //   ),
          // ),
        ]));
  }
}
