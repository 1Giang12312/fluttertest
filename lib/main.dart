// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:vnptapp/screen/homepage/HomePage_MainPage.dart';
import 'package:vnptapp/screen/login/LoginScreen_MainPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  shared_preferences = prefs;
  prefs.setString('jwt',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaGFudmllbl9zbWNzIjoiZ2lhbmd2dC5hZ2ciLCJkb252aV9tb3RhIjoiUGjDsm5nIMSQSE5WIiwidGVuZG9udmkyIjoibnVsbCIsInRlbkRvblZpIjoiUGjDsm5nIMSQaeG7gXUgaMOgbmggLSBOZ2hp4buHcCB24bulIiwibmhhbnZpZW5faWQiOiI4ODQiLCJjaHVjZGFuaCI6IjEwIiwibWFuaGFudmllbiI6ImdpYW5ndnQuYWdnIiwiaWQiOiI4ODQiLCJob3RlbiI6IlbGsMahbmcgVHLGsOG7nW5nIEdpYW5nIiwic2R0IjoiMDgzNjI4MzE2OCIsImRvbnZpX2lkIjoiMTMiLCJkaWFjaGkiOiI2OC81RSDEkMO0bmcgVGjhu4tuaCAyLCBN4bu5IFBoxrDhu5tjLCBMb25nIFh1ecOqbiwgdOG7iW5oIEFuIEdpYW5nIiwibWFfTmhhblZpZW5fVEhOUyI6IkNUVjA4Mzk0OSIsIm1hZG9udmlfcHR0YiI6IjAiLCJkb252aV9tYSI6IkRITlYiLCJleHAiOjE3MDU0NjY3MTIsImlzcyI6IlZOUFQtQlNDQVBQIiwiYXVkIjoiQlNDQVBQIn0.YSmTLRIyHpx_MOlQal_4utvFRcF1JbJB2BxJTIccj5I');
  // prefs.setString('jwt','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuaGFudmllbl9zbWNzIjoiZ2lhbmd2dC5hZ2ciLCJkb252aV9tb3RhIjoiUGjDsm5nIMSQSE5WIiwidGVuZG9udmkyIjoibnVsbCIsInRlbkRvblZpIjoiUGjDsm5nIMSQaeG7gXUgaMOgbmggLSBOZ2hp4buHcCB24bulIiwibmhhbnZpZW5faWQiOiI4ODQiLCJjaHVjZGFuaCI6IjEwIiwibWFuaGFudmllbiI6ImdpYW5ndnQuYWdnIiwiaWQiOiI4ODQiLCJob3RlbiI6IlbGsMahbmcgVHLGsOG7nW5nIEdpYW5nIiwic2R0IjoiMDgzNjI4MzE2OCIsImRvbnZpX2lkIjoiMTMiLCJkaWFjaGkiOiI2OC81RSDEkMO0bmcgVGjhu4tuaCAyLCBN4bu5IFBoxrDhu5tjLCBMb25nIFh1ecOqbiwgdOG7iW5oIEFuIEdpYW5nIiwibWFfTmhhblZpZW5fVEhOUyI6IkNUVjA4Mzk0OSIsImV4cCI6MTcwMTY5Mjc4NywiaXNzIjoiVk5QVC1CU0NBUFAiLCJhdWQiOiJCU0NBUFAifQ.2Cdk9uukRckCzR_Vp2JDLoCwhSIJn7tHtFyylMnnGyo');
  if (shared_preferences.getBool('darklightmode') == null ||
      prefs.getString('jwt') == null) {
    shared_preferences.setBool('darklightmode', false);
    prefs.setString('jwt',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0ZW5Eb25WaSI6IlBow7JuZyDEkGnhu4F1IGjDoG5oIC0gTmdoaeG7h3AgduG7pSIsIm5oYW52aWVuX2lkIjoiODg0IiwiY2h1Y2RhbmgiOiIxMCIsIm1hbmhhbnZpZW4iOiJnaWFuZ3Z0LmFnZyIsImlkIjoiODg0IiwiaG90ZW4iOiJWxrDGoW5nIFRyxrDhu51uZyBHaWFuZyIsInNkdCI6IjA4MzYyODMxNjgiLCJkb252aV9pZCI6IjEzIiwiZGlhY2hpIjoiNjgvNUUgxJDDtG5nIFRo4buLbmggMiwgTeG7uSBQaMaw4bubYywgTG9uZyBYdXnDqm4sIHThu4luaCBBbiBHaWFuZyIsIm1hX05oYW5WaWVuX1RITlMiOiJDVFYwODM5NDkiLCJleHAiOjE3MDA2ODAzNTEsImlzcyI6IlZOUFQtQlNDQVBQIiwiYXVkIjoiQlNDQVBQIn0.WPRnFja1MdhqKpBZfEJVkynKN_E8I1-CjZnRtC316ao');
  }
  // print(shared_preferences.getBool('darklightmode').toString());
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: MyApp(prefs: prefs)));
  //   MaterialApp(
  //       theme: ThemeData(
  //           colorSchemeSeed: const Color(0x00005aab), useMaterial3: true),
  //       // home: LoginScreen_MainPage(
  //       //   thongBao: '',
  //       //   prefs: prefs,
  //       // )),
  // localizationsDelegates: [
  //   GlobalWidgetsLocalizations.delegate,
  //   GlobalMaterialLocalizations.delegate,
  //   MonthYearPickerLocalizations.delegate,
  // ],
  //       debugShowCheckedModeBanner: false,
  //       home: const HomePage_MainPage()),
  //       //   home: LoginScreen_MainPage(thongBao: 'Unauthorized',)),
  // home: LoginScreen_MainPage(
  //   thongBao: '',
  //   prefs: prefs,
  // )),
  // );
}

var Riverpod_Instance = riverpod_instance();

// ignore: must_be_immutable
class MyApp extends ConsumerWidget {
  MyApp({super.key, required this.prefs});
  SharedPreferences prefs;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          MonthYearPickerLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        // theme: getAppTheme(context, ref.watch(appThemeProvider)),
        theme: ref.watch(appThemeProvider)
            ? ThemeData.dark(useMaterial3: true)
            // .copyWith(
            //     pageTransitionsTheme: const PageTransitionsTheme(
            //       builders: <TargetPlatform, PageTransitionsBuilder>{
            //         TargetPlatform.android: ZoomPageTransitionsBuilder(),
            //       },
            //     ),
            //   )
            : ThemeData(
                colorSchemeSeed: const Color(0x00005aab), useMaterial3: true)
        //  colorSchemeSeed: const Color(0x00005aab), useMaterial3: true)
        //   .copyWith(
        //   pageTransitionsTheme: const PageTransitionsTheme(
        //     builders: <TargetPlatform, PageTransitionsBuilder>{
        //       TargetPlatform.android: ZoomPageTransitionsBuilder(),
        //     },
        //   ),
        // )
        ,
       //  theme: getAppTheme(context, ref.watch(appThemeProvider)),
        // home: LoginScreen_MainPage(
        //   thongBao: '',    
        // ));
     home: HomePage_MainPage());
  }
}
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vnptapp/Components/theme.dart';
// import 'package:vnptapp/screen/homepage/HomePage_MainPage.dart';
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Hive.initFlutter();
//   // Hive.registerAdapter(AccountAdapter());
//   HttpOverrides.global = MyHttpOverrides();
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs1 = await SharedPreferences.getInstance();
//   final indexTheme = prefs1.getInt('themeMode') ?? 0;
//   int indexColor = prefs1.getInt('theme') ?? 0;
//   runApp(MyApp(indexTheme: indexTheme, indexColor: indexColor));
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key, required this.indexTheme, required this.indexColor});
//   final indexTheme;
//   final indexColor;
//   @override
//   Widget build(BuildContext context) => ChangeNotifierProvider(
//         create: (context) => ThemeProvider(indexTheme, indexColor),
//         builder: (context, child) {
//           final themeProvider = Provider.of<ThemeProvider>(context);
//           return MaterialApp(
//             darkTheme: ThemeClass.darkTheme,
//             theme: ThemeClass.lightTheme,
//             themeMode: themeProvider.themeMode,
//             debugShowCheckedModeBanner: false,
//             home: HomePage_MainPage(),
//           );
//         },
//       );
// }
