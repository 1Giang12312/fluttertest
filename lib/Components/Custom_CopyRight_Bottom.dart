// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Variable/Constant.dart';

// class Custom_CopyRight_Bottom extends StatelessWidget {
//   const Custom_CopyRight_Bottom({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //print(isDarkMode.toString());
//     return

//      Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//           height: 30,
//           width: widthOfDevice(context),
//           color: isDarkMode ? secondDaryColors : primaryColors,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text_small_light(
//                 title: "@Copyright by Phòng Điều hành Nghiệp vụ",
//               ),
//             ],
//           )),
//     );
//   }
// }
class Custom_CopyRight_Bottom extends StatefulWidget {
  const Custom_CopyRight_Bottom({super.key});
  @override
  State<Custom_CopyRight_Bottom> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Custom_CopyRight_Bottom> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      isDarkMode = ref.watch(appThemeProvider);
        return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: 30,
            width: widthOfDevice(context),
            color: isDarkMode ? secondDaryColors : primaryColors,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text_small_dark(
                  title: "@Copyright by Phòng Điều hành Nghiệp vụ",
                ),
              ],
            )),
      );
    });
  }
}
