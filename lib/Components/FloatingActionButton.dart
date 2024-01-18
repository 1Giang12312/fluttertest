// ignore_for_file: file_names
// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// class MyFABWithMenu extends StatelessWidget {
//   const MyFABWithMenu({super.key});
//   void _showMenu(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return const EndDrawer_HomePage(); // Sử dụng widget MyMenuContent để hiển thị menu
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: () {
//         _showMenu(context); // Gọi hàm hiển thị menu
//       },
//       child: const Icon(Icons.book),
//     );
//   }
// }

// // ignore: camel_case_types
// class EndDrawer_HomePage extends StatelessWidget {
//   const EndDrawer_HomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
      

//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     String title1 = '1.Gói cước DTTT';
//     String title2 = '2.Gói cước DĐTS';
//     String title3 = '3.Gói cước BRCĐ';
//     String title4 = '4.Gói cước MyTV';
//     String title5 = '5.Hướng dẫn xử lý BRCĐ/MyTV';
//     String title6 =
//         '6.Hướng dẫn xử lý lỗi trên OneBSS,CCBS,VNPT Money';
//     String title7 = '7.Xử lý lỗi SIM bị khóa';
//     String title8 = '8.Cú pháp đăng ký, hủy, tra cước';
//     return SizedBox(
//       width: width / 1.5,
//       child: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             SizedBox(
//               height: height / 7,
//               child: const DrawerHeader(
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                   ),
//                   child: Text(
//                     'Cẩm nang',
//                   )
//                   ),
//             ),
//             // ExpansionTile(
//             //   leading: const Icon(Icons.book_online_outlined),
//             //   title: const Text( 'Cẩm nang nghiệp vụ'),
//             //   children: <Widget>[
//             //     ListTile(
//             //       title: Text( title1),
//             //       onTap: () {
//             //         // Thực hiện hành động khi bấm vào mục con 1
//             //       },
//             //     ),
//             //     ListTile(
//             //       title: Text(
//             //          title2,
//             //       ),
//             //       onTap: () {
//             //         // Thực hiện hành động khi bấm vào mục con 2
//             //       },
//             //     ),
//             //     ListTile(
//             //       title: Text(
//             //          title3,
//             //       ),
//             //       onTap: () {
//             //         // Thực hiện hành động khi bấm vào mục con 2
//             //       },
//             //     ),
//             //     ListTile(
//             //       title: Text(
//             //          title4,
//             //       ),
//             //       onTap: () {
//             //         // Thực hiện hành động khi bấm vào mục con 2
//             //       },
//             //     ),
//             //     ListTile(
//             //       title: Text(
//             //          title5,
//             //       ),
//             //       onTap: () {
//             //          Navigator.push(
//             //             context,
//             //             MaterialPageRoute(
//             //                 builder: (context) => PDFViwer(
//             //                       url: '5.Hướng dẫn xử lý BRCĐ cho NVKD.pdf',
//             //                       title: title5,
//             //                     )));
//             //       },
//             //     ),
//             //     ListTile(
//             //       title: Text(
//             //          title6,
//             //       ),
//             //       onTap: () {
//             //         Navigator.push(
//             //             context,
//             //             MaterialPageRoute(
//             //                 builder: (context) => PDFViwer(
//             //                       url: '6.Xử lý lỗi Di động-CCBS-Money.pdf',
//             //                       title: title6,
//             //                     )));
//             //       },
//             //     ),
//             //     ListTile(
//             //       title: Text(
//             //          title7,
//             //       ),
//             //       onTap: () {
//             //         // Thực hiện hành động khi bấm vào mục con 2
//             //          Navigator.push(
//             //             context,
//             //             MaterialPageRoute(
//             //                 builder: (context) => PDFViwer(
//             //                       url: '7.Xử lý lỗi SIM bị khoá.pdf',
//             //                       title: title7,
//             //                     )));
//             //       },
//             //     ),
//             //     ListTile(
//             //       title: Text(
//             //          title8,
//             //       ),
//             //       onTap: () {
//             //         // Thực hiện hành động khi bấm vào mục con 2
//             //       },
//             //     ),
//             //     // Thêm các mục con khác nếu cần
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
