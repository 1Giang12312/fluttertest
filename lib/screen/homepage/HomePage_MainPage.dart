// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vnptapp/Components/Custom_CopyRight_Bottom.dart';
import 'package:vnptapp/Components/Custom_AnimatedFAB.dart';
import 'package:vnptapp/screen/Drawer/Drawer_MainPage.dart';

import '../../Variable/Constant.dart';

// // ignore: camel_case_types
class HomePage_MainPage extends ConsumerWidget {
  const HomePage_MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    isDarkMode = ref.watch(appThemeProvider);
    return ScaffoldDraggable(
      button: TextButton(
        child: const Text('asdf'),
        onPressed: () {},
      ),
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                 // color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            backgroundColor: isDarkMode ? secondDaryColors : primaryColors,
            centerTitle: true,
            title: const Text(
              'Hệ thống BSC/KPI',
             // style: TextStyle(color: Colors.white),
            ),
            // actions: const <Widget>[
            //   Padding(
            //     padding: EdgeInsets.only(right: 16.0),
            //     child: Icon(Icons.add_alert,
            //    //  color: Colors.white
            //      ),
            //   ),
            // ],
          ),
          body: Stack(
            children: [
              // Image.asset(
              //   'assets/homepage.jpg',
              // ),
              Container(
                width: widthOfDevice(context),
                height: heightOfDevice(context),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/homepage.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
               const Custom_CopyRight_Bottom()
            ],
          ),
          drawer: const Drawer_HomePage(),
        ),
      ),
    );
  }
}

// class HomePage_MainPage extends StatefulWidget {
//   const HomePage_MainPage({super.key});
//   @override
//   State<HomePage_MainPage> createState() => _HomePage_MainPageState();
// }
// class _HomePage_MainPageState extends State<HomePage_MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldDraggable(
//       button: TextButton(
//         child: Text('asdf'),
//         onPressed: () {},
//       ),
//       child: DefaultTabController(
//         length: 6,
//         child: Scaffold(
//           appBar: AppBar(
//             leading: Builder(
//               builder: (context) => IconButton(
//                 icon: const Icon(
//                   Icons.menu_rounded,
//                   color: Colors.white,
//                 ),
//                 onPressed: () => Scaffold.of(context).openDrawer(),
//               ),
//             ),
//             backgroundColor: primaryColors,
//             centerTitle: true,
//             title: const Text(
//               'Hệ thống BSC/KPI',
//               style: TextStyle(color: Colors.white),
//             ),
//             actions: const <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(right: 16.0),
//                 child: Icon(Icons.add_alert, color: Colors.white),
//               ),
//             ],
//           ),
//           body: Stack(
//             children: [
//               Container(
//                 width: widthOfDevice(context),
//                 height: heightOfDevice(context),
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/homepage.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   MaterialButton(
//                     onPressed: () async {
//                       SharedPreferences prefs1 =
//                           await SharedPreferences.getInstance();
//                       final setTheme = prefs1.setInt('themeMode', 0);
//                       final setColor = prefs1.setInt('theme', 0);
//                       final indexTheme = prefs1.getInt('themeMode');
//                       final indexColor = prefs1.getInt('themeMode');
//                       setState(() {});
//                       ThemeProvider(indexTheme!, indexColor!)
//                           .toggleTheme(indexTheme);
//                     },
//                     child: Text('sdfa'),
//                   ),
//                   MaterialButton(
//                     onPressed: () async {
//                       SharedPreferences prefs1 =
//                           await SharedPreferences.getInstance();
//                       final setTheme = prefs1.setInt('themeMode', 1);
//                       final setColor = prefs1.setInt('theme', 1);
//                       final indexTheme = prefs1.getInt('themeMode');
//                       final indexColor = prefs1.getInt('themeMode');
//                       setState(() {});
//                       ThemeProvider(indexTheme!, indexColor!)
//                           .toggleTheme(indexTheme);
//                     },
//                     child: Text('asda'),
//                   ),
//                 ],
//               ),
//               const Custom_CopyRight_Bottom()
//             ],
//           ),
//           drawer: const Drawer_HomePage(),
//         ),
//       ),
//     );
//   }
// }
