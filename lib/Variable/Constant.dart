// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

int waitOfTimeOut() {
  return 5; //5s
}

double heightOfDevice(context) {
  return MediaQuery.of(context).size.height;
}

double widthOfDevice(context) {
  return MediaQuery.of(context).size.width;
}

double heightOfAppBar(context) {
  return AppBar().preferredSize.height;
}

bool isLandScape(BuildContext context) {
  return MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;
}

dynamic shared_preferences;
dynamic isDarkMode = shared_preferences.getBool('darklightmode');
final appThemeProvider =
    StateProvider<bool>((ref) => shared_preferences.getBool('darklightmode'));
// Color textLightColor = const Color(0xFFE1F5FE);
// Color textDarkColor = const Color(0xFF212121);
Color primaryColors = const Color.fromRGBO(90, 171, 255, 1.0);
Color secondDaryColors = const Color.fromARGB(255, 61, 113, 168);

Color Card_colors_1 = const Color.fromARGB(255, 219, 236, 255);
Color Card_colors_2 = const Color.fromARGB(255, 198, 216, 233);
Color Card_colors_dark_1 = const Color.fromARGB(255, 135, 144, 156);
Color Card_colors_dark_2 = const Color.fromARGB(255, 111, 118, 127);
double FontSizesmall = 12;
double FontSizemedium = 14;
double FontSizenorma = 18;
double FontSizelarge = 20;
double FontSizehuge = 24;
double paddingSized = 5;
int awaitTime = 0;
List<Color> themes = [Colors.blue, Colors.black];
String jwt = shared_preferences.getString('jwt');
Map<String, String> get requestHeader => <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt',
      //'Authorization':'Bearer ',
    }; 
// AppColors colors(context) => Theme.of(context).extension<AppColors>()!;
// ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
//   return ThemeData(
//       extensions: <ThemeExtension<AppColors>>[
//         AppColors(
//           color1: isDarkTheme
//               ? const Color.fromARGB(255, 27, 124, 204)
//               : const Color.fromARGB(255, 153, 206, 250),
//           color2: isDarkTheme ? Colors.pink : Colors.blue,
//           color3: isDarkTheme ? Colors.yellow : Colors.red,
//         ),
//       ],
//       scaffoldBackgroundColor:
//           isDarkTheme ? Color.fromARGB(255, 101, 101, 101) : Colors.white,
//       textTheme: Theme.of(context)
//           .textTheme
//           .copyWith(
//             titleSmall:
//                 Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12),
//           )
//           .apply(
//             bodyColor: isDarkTheme
//                 ? Color.fromARGB(255, 0, 0, 0)
//                 : Color.fromARGB(255, 0, 0, 0),
//             displayColor: Colors.grey,
//           ),
//       switchTheme: SwitchThemeData(
//         thumbColor: MaterialStateProperty.all(isDarkTheme
//             ? const Color.fromARGB(255, 27, 124, 204)
//             : const Color.fromRGBO(90, 171, 255, 1.0)),
//       ),
//       listTileTheme: ListTileThemeData(
//           iconColor: isDarkTheme
//               ? const Color.fromARGB(255, 27, 124, 204)
//               : const Color.fromRGBO(90, 171, 255, 1.0)),
//       appBarTheme: AppBarTheme(
//           backgroundColor: isDarkTheme ? Colors.black : Colors.white,
//           iconTheme: IconThemeData(
//               color: isDarkTheme ? Colors.white : Colors.black54)),
//       canvasColor:
//           isDarkTheme ? Color.fromARGB(255, 101, 101, 101) : Colors.white);
// }
// @immutable
// class AppColors extends ThemeExtension<AppColors> {
//   final Color? color1;
//   final Color? color2;
//   final Color? color3;

//   const AppColors({
//     required this.color1,
//     required this.color2,
//     required this.color3,
//   });

//   @override
//   AppColors copyWith({
//     Color? color1,
//     Color? color2,
//     Color? color3,
//   }) {
//     return AppColors(
//       color1: color1 ?? this.color1,
//       color2: color2 ?? this.color2,
//       color3: color3 ?? this.color3,
//     );
//   }

//   @override
//   AppColors lerp(ThemeExtension<AppColors>? other, double t) {
//     if (other is! AppColors) {
//       return this;
//     }
//     return AppColors(
//       color1: Color.lerp(color1, other.color1, t),
//       color2: Color.lerp(color2, other.color2, t),
//       color3: Color.lerp(color3, other.color3, t),
//     );
//   }
// }
