// ignore_for_file: file_names, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:vnptapp/Variable/Constant.dart';

class Text_medium_light extends StatelessWidget {
  Text_medium_light({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$title ',
      style: TextStyle(
          fontSize: FontSizemedium,
          //color: textLightColor
          ),
    );
  }
}
// // ignore: must_be_immutable, camel_case_types
// class Text_small_light extends StatelessWidget {
//   Text_small_light({super.key, required this.title});
//   String title;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       '$title ',
//       style: TextStyle(
//           fontSize: FontSizesmall,
//           //color: textLightColor
//           ),
//     );
//   }
// }
// // ignore: must_be_immutable, camel_case_types
// class Text_large_light extends StatelessWidget {
//   Text_large_light({super.key, required this.title});
//   String title;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       '$title ',
//       style: TextStyle(
//           fontSize: FontSizelarge,
//           //color: textLightColor
//           ),
//     );
//   }
// }
// // ignore: must_be_immutable, camel_case_types
// class Text_huge_light extends StatelessWidget {
//   Text_huge_light({super.key, required this.title});
//   String title;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       '$title ',
//       style: TextStyle(
//           fontSize: FontSizehuge,
//          // color: textLightColor
//           ),
//     );
//   }
// }
// //dark
class Text_medium_dark extends StatelessWidget {
  Text_medium_dark({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$title ',
      style: TextStyle(
          fontSize: FontSizemedium,
        //  color: textDarkColor
          ),
    );
  }
}
class Text_small_dark extends StatelessWidget {
  Text_small_dark({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$title ',
      style: TextStyle(
          fontSize: FontSizesmall,
         // color: textDarkColor
          ),
    );
  }
}
class Text_large_dark extends StatelessWidget {
  Text_large_dark({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$title ',
      style: TextStyle(
          fontSize: FontSizelarge,
          //color: textDarkColor
          ),
    );
  }
}
class Text_huge_dark extends StatelessWidget {
  Text_huge_dark({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$title ',
      style: TextStyle(
          fontSize: FontSizehuge,
          //color: textDarkColor
          ),
    );
  }
}
class Text_norma_dark extends StatelessWidget {
  Text_norma_dark({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$title ',
      style: TextStyle(
          fontSize: FontSizenorma,
          //color: textDarkColor
          ),
    );
  }
}