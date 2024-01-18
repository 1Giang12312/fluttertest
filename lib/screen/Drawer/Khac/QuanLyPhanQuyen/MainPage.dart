// // ignore_for_file: camel_case_types, file_names, prefer_typing_uninitialized_variables

// import 'package:flutter/material.dart';
// import 'package:pager/pager.dart';
// import 'package:vnptapp/Components/Custom_AppBar.dart';
// import 'package:vnptapp/Components/Custom_Card.dart';
// import 'package:vnptapp/Components/Custom_Data_Rows.dart';
// import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
// import 'package:vnptapp/Components/Custom_Page_Transition.dart';
// import 'package:vnptapp/Components/Custom_Text.dart';
// import 'package:vnptapp/GlobalFunction/GetDonVi.dart';
// import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
// import 'package:vnptapp/Models/DonVi.dart';
// import 'package:vnptapp/screen/Drawer/Khac/QuanLyPhanQuyen/Details.dart';
// import 'package:vnptapp/screen/Drawer/Khac/QuanLyPhanQuyen/Logic.dart';
// import 'package:vnptapp/screen/Drawer/Khac/QuanLyPhanQuyen/Variable.dart';

// class QuanLyPhanQuyen_MainPage extends StatefulWidget {
//   const QuanLyPhanQuyen_MainPage({super.key});

//   @override
//   State<QuanLyPhanQuyen_MainPage> createState() =>
//       _QuanLyPhanQuyen_MainPageState();
// }

// var searchkey;
// var selectedDonVi;
// int pageNumber = 1;
// int pageSize = 10;
// class _QuanLyPhanQuyen_MainPageState extends State<QuanLyPhanQuyen_MainPage> {
//   Future<void> refresh() async {
//     setState(() {});
//   }

//   @override
//   void initState() {
//     selectedDonVi = null;
//     searchkey = null;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Custom_AppBar(title: 'Quản lý phân quyền'),
//       body: RefreshIndicator(
//           onRefresh: refresh,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: 50,
//                   child: TextField(
//                     decoration: const InputDecoration(
//                       hintText: 'Tìm kiếm(Họ tên)...',
//                       prefixIcon: Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(19.0)),
//                       ),
//                     ),
//                     onChanged: (text) {
//                       setState(() {
//                         searchkey = text;
//                       });
//                     },
//                   ),
//                 ),
//                 FutureBuilder<List<DonVi>>(
//                     future: checkLocalConnectionApi()
//                         .then((value) => listDonVi(value)),
//                     builder: ((context, snapshot) {
//                       if (snapshot.data != null &&
//                           snapshot.connectionState != ConnectionState.waiting) {
//                         return DropdownButton(
//                           hint: const Text('Chọn đơn vị'),
//                           value: selectedDonVi,
//                           items: snapshot.data!.map((e) {
//                             return DropdownMenuItem(
//                               value: e.donvi_id.toString(),
//                               child: e.donvi_ten == null
//                                   ? const Text('Tất cả đơn vị')
//                                   : Text(e.donvi_ten.toString()),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               selectedDonVi = value;
//                             });
//                           },
//                         );
//                       } else {
//                         return const Text('');
//                       }
//                     })),
//                 // FutureBuilder(
//                 //     future: Future.delayed(Duration(seconds: awaitTime),
//                 //         () => checkLocalConnectionApi()),
//                 //     builder: (context, snapshot1) {
//                 //       if (snapshot1.data != null &&
//                 //           snapshot1.connectionState !=
//                 //               ConnectionState.waiting) {
//                 //         return
//                 SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SingleChildScrollView(
//                         child: FutureBuilder(
//                             future: checkLocalConnectionApi().then((value) =>
//                                 getListNhanVien(pageNumber, pageSize,
//                                     selectedDonVi, searchkey, value)),
//                             builder: ((context, snapshot) {
//                               return Custom_FutureBuilder(
//                                   contextParam: context,
//                                   snapshot: snapshot,
//                                   widgetParam: snapshot.hasData
//                                       ? SingleChildScrollView(
//                                           child: Column(
//                                           children: [
//                                             for (var item in snapshot.data!)
//                                               Custom_Card(
//                                                   item: item,
//                                                   list: snapshot.data,
//                                                   widget: Column(
//                                                     children: [
//                                                       Detail_Rows(
//                                                           title: 'ID',
//                                                           data: item.nhanvien_id
//                                                               .toString()),
//                                                       Detail_Rows(
//                                                           title: 'Mã nhân viên',
//                                                           data: item
//                                                               .nhanvien_manv!),
//                                                       Detail_Rows(
//                                                           title: 'Họ tên:',
//                                                           data: item
//                                                               .nhanvien_hoten!),
//                                                       Detail_Rows(
//                                                           title:
//                                                               'Số điện thoại:',
//                                                           data: item
//                                                               .nhanvien_didong!),
//                                                               Detail_Rows(
//                                                           title:
//                                                               'Đơn vị id:',
//                                                           data: item
//                                                               .nhanvien_donvi.toString()),
//                                                                 Detail_Rows(
//                                                           title:
//                                                               'Chức danh id:',
//                                                           data: item
//                                                               .nhanvien_chucdanh.toString()),
//                                                       MaterialButton(
//                                                         onPressed: () {
//                                                           {
//                                                             pageTrasition(
//                                                               context,
//                                                               QuanLyPhanQuyen_Detail(
//                                                                 iD: item
//                                                                     .nhanvien_id!,
//                                                                 sdt: item
//                                                                     .nhanvien_didong
//                                                                     .toString(),
//                                                                 hoTen: item
//                                                                     .nhanvien_hoten!,
//                                                                 maNV: item
//                                                                     .nhanvien_manv!,
//                                                                 donViID: item
//                                                                     .nhanvien_donvi!,
//                                                               ),
//                                                             );
//                                                           }
//                                                         },
//                                                         child: Text_medium_dark(
//                                                             title:
//                                                                 'Xem phân quyền'),
//                                                       )
//                                                     ],
//                                                   )),
//                                             // Card(
//                                             //     color: snapshot.data!.indexOf(
//                                             //                     item) %
//                                             //                 2 ==
//                                             //             0
//                                             //         ? isDarkMode
//                                             //             ? Card_colors_dark_1
//                                             //             : Card_colors_1
//                                             //         : isDarkMode
//                                             //             ? Card_colors_dark_2
//                                             //             : Card_colors_2,
//                                             //     clipBehavior: Clip.hardEdge,
//                                             //     child: InkWell(
//                                             //         splashColor: Colors.blue
//                                             //             .withAlpha(30),
//                                             //         onTap: () {},
//                                             //         child:
//                                             //         Column(
//                                             //           children: [
//                                             //             Detail_Rows(
//                                             //                 title: 'ID',
//                                             //                 data: item
//                                             //                     .nhanvien_id
//                                             //                     .toString()),
//                                             //             Detail_Rows(
//                                             //                 title:
//                                             //                     'Mã nhân viên',
//                                             //                 data: item
//                                             //                     .nhanvien_manv!),
//                                             //             Detail_Rows(
//                                             //                 title: 'Họ tên:',
//                                             //                 data: item
//                                             //                     .nhanvien_hoten!),
//                                             //             Detail_Rows(
//                                             //                 title:
//                                             //                     'Số điện thoại:',
//                                             //                 data: item
//                                             //                     .nhanvien_didong!),
//                                             //             MaterialButton(
//                                             //               onPressed: () {
//                                             //                 {
//                                             //                   pageTrasition(
//                                             //                     context,
//                                             //                     QuanLyPhanQuyen_Detail(
//                                             //                       iD: item
//                                             //                           .nhanvien_id
//                                             //                           .toString(),
//                                             //                       sdt: item
//                                             //                           .nhanvien_didong
//                                             //                           .toString(),
//                                             //                       hoTen: item
//                                             //                           .nhanvien_hoten!,
//                                             //                       maNV: item
//                                             //                           .nhanvien_manv!,
//                                             //                       donViID: item
//                                             //                           .nhanvien_donvi!,
//                                             //                     ),
//                                             //                   );
//                                             //                 }
//                                             //               },
//                                             //               child: Text_medium_dark(
//                                             //                   title:
//                                             //                       'Xem phân quyền'),
//                                             //             )
//                                             //           ],
//                                             //         ))),
//                                             Align(
//                                               alignment: Alignment.topLeft,
//                                               child: Text(
//                                                   '$pageNumber/${QuanLyPhanQuyen_Variable.totalPages} trang, ${QuanLyPhanQuyen_Variable.totalRecords} mục'),
//                                             ),
//                                             QuanLyPhanQuyen_Variable
//                                                         .totalPages !=
//                                                     0
//                                                 ? SingleChildScrollView(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     child: Pager(
//                                                       currentPage: pageNumber,
//                                                       totalPages:
//                                                           QuanLyPhanQuyen_Variable
//                                                               .totalPages,
//                                                       onPageChanged: (page) {
//                                                         setState(() {
//                                                           pageNumber = page;
//                                                         });
//                                                       },
//                                                     ),
//                                                   )
//                                                 : const Text(''),
//                                           ],
//                                         ))
//                                       : const Text('a'));
//                             })),
//                       ),

//                       // return Custom_FutureBuilder(
//                       //     contextParam: context,
//                       //     snapshot: snapshot,
//                       //     widgetParam: snapshot.hasData
//                       //         ?
//                     ],
//                   ),
//                 )
//                 // } else {
//                 //   return LoadingSreen(
//                 //       nameOfLoadingScreen: 'Đang tải dữ liệu');
//                 // }
//                 //  }
//                 //  )
//               ],
//             ),
//           )),
//     );
//   }
// }
