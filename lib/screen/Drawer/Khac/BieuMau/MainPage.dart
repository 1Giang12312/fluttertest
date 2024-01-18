// // ignore_for_file: camel_case_types, file_names, unnecessary_null_comparison

// import 'package:flutter/material.dart';
// import 'package:month_year_picker/month_year_picker.dart';
// import 'package:vnptapp/Components/Custom_AppBar.dart';
// import 'package:vnptapp/Components/Custom_Data_Rows.dart';
// import 'package:vnptapp/Components/Custom_Page_Transition.dart';
// import 'package:vnptapp/Components/Custom_Text.dart';
// import 'package:vnptapp/Variable/Constant.dart';
// import 'package:vnptapp/screen/Drawer/Khac/BieuMau/Detail.dart';

// class BieuMau_MainPage extends StatefulWidget {
//   const BieuMau_MainPage({super.key});

//   @override
//   State<BieuMau_MainPage> createState() => _BieuMau_MainPageState();
// }

// int pageNumber = 1;
// int pageSized = 10;
// // ignore: prefer_typing_uninitialized_variables
// var selectedDate;
// // ignore: prefer_typing_uninitialized_variables
// var selectedDonVi;
// String selectedYear = DateTime.now().year.toString();
// String selectedMonth = DateTime.now().month.toString();

// class _BieuMau_MainPageState extends State<BieuMau_MainPage> {
//   @override
//   void initState() {
//     selectedDonVi = null;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     String convertMonth(int month) {
//       if (month < 10) {
//         return '0${month.toString()}';
//       } else {
//         return month.toString();
//       }
//     }

//     Future<void> refresh() async {
//       setState(() {});
//     }

//     return Scaffold(
//         appBar: Custom_AppBar(title: 'Biểu mẫu'),
//         body: RefreshIndicator(
//             onRefresh: refresh,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () async {
//                       // selectedDate =
//                       //     await SimpleMonthYearPicker.showMonthYearPickerDialog(
//                       //   context: context,
//                       //   titleTextStyle: const TextStyle(),
//                       //   monthTextStyle: const TextStyle(),
//                       //   yearTextStyle: const TextStyle(),
//                       // );
//                       // setState(() {
//                       //   selectedMonth = convertMonth(selectedDate.month);
//                       //   selectedYear = selectedDate.year.toString();
//                       //   print(selectedYear + selectedMonth);
//                       // });
//                       //String? locale;
//                       //  final localeObj = locale != null ? Locale(locale) : null;
//                       final selected = await showMonthYearPicker(
//                         context: context,
//                         initialDate: selectedDate ?? DateTime.now(),
//                         firstDate: DateTime(2019),
//                         lastDate: DateTime(2030),
//                         locale: const Locale('vi', 'VN'),
//                       );
//                       if (selected != null) {
//                         setState(() {
//                           selectedDate = selected;
//                           selectedMonth = convertMonth(selectedDate!.month);
//                           selectedYear = selectedDate!.year.toString();
//                         });
//                       }
//                     },
//                     child: Text('Tháng $selectedMonth năm $selectedYear'),
//                   ),
//                   Card(
//                       color: Card_colors_2,
//                       clipBehavior: Clip.hardEdge,
//                       child: InkWell(
//                           splashColor: Colors.blue.withAlpha(30),
//                           onTap: () {},
//                           child: Column(
//                             children: [
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Detail_Rows(
//                                       title: 'Đơn vị:',
//                                       data: 'Trung tâm viễn thông An Phú'),
//                                   Detail_Rows(
//                                       title: 'Địa bàn C2:', data: 'An Phú'),
//                                   Detail_Rows(
//                                       title: 'Địa bàn C3:', data: 'Long Bình'),
//                                   // Detail_Rows(
//                                   //     title:
//                                   //         'PTM:',
//                                   //     data: item
//                                   //         .nhanvienChucdanh!),
//                                   // Detail_Rows(
//                                   //     title:
//                                   //         'PSC:',
//                                   //     data: item
//                                   //         .soluongDuq!
//                                   //         .toString()),
//                                   // Detail_Rows(
//                                   //     title:
//                                   //         'TT:',
//                                   //     data: NumberFormat(
//                                   //             '#,###')
//                                   //         .format(
//                                   //             item.bangoiDoanhThu)),
//                                   // Detail_Rows(
//                                   //     title:
//                                   //         'Hủy:',
//                                   //     data: NumberFormat(
//                                   //             '#,###')
//                                   //         .format(
//                                   //             item.bangoiThulao)),
//                                   // Detail_Rows(
//                                   //     title:
//                                   //         'Ngưng PSC:',
//                                   //     data: NumberFormat(
//                                   //             '#,###')
//                                   //         .format(
//                                   //             item.tongThuLao)),
//                                   // Detail_Rows(
//                                   //     title:
//                                   //         '% Ngưng PSC/PTM:',
//                                   //     data: NumberFormat(
//                                   //             '#,###')
//                                   //         .format(
//                                   //             item.tongThuLao)),
//                                   // Detail_Rows(
//                                   //     title:
//                                   //         '% Ngưng PSC/PSC:',
//                                   //     data: NumberFormat(
//                                   //             '#,###')
//                                   //         .format(
//                                   //             item.tongThuLao)),
//                                   MaterialButton(
//                                     onPressed: () {
//                                       pageTrasition(
//                                         context,
//                                         BieuMau_Detail(
//                                           month: selectedMonth,
//                                           year: selectedYear,
//                                         ),
//                                       );
//                                     },
//                                     child:
//                                         Text_medium_dark(title: 'Xem chi tiết'),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ))),
//                   // FutureBuilder(
//                   //     future: Future.delayed(Duration(seconds: awaitTime),
//                   //         () => checkLocalConnectionApi()),
//                   //     builder: (context, snapshot1) {
//                   //       if (snapshot1.data != null &&
//                   //           snapshot1.connectionState !=
//                   //               ConnectionState.waiting) {
//                   //         return FutureBuilder(
//                   //             future: listThuLao(
//                   //                 pageNumber,
//                   //                 10,
//                   //                 selectedMonth.toString(),
//                   //                 selectedYear.toString(),
//                   //                 selectedDonVi,
//                   //                 tenDonVi,
//                   //                 localNhanVien.nhanvien_manv!,
//                   //                 localNhanVien.nhanvien_chucdanh.toString(),
//                   //                 snapshot1.data!),
//                   //             builder: ((context, snapshot) {
//                   //               return Custom_FutureBuilder(
//                   //                   contextParam: context,
//                   //                   snapshot: snapshot,
//                   //                   widgetParam: snapshot.hasData
//                   //                       ? SingleChildScrollView(
//                   //                           child: Column(
//                   //                             crossAxisAlignment:
//                   //                                 CrossAxisAlignment.start,
//                   //                             children: [
//                   //                               localNhanVien.nhanvien_donvi ==
//                   //                                       13
//                   //                                   ? Row(
//                   //                                       children: [
//                   //                                         const TinyWidthSizedBox(),
//                   //                                         SingleChildScrollView(
//                   //                                           child: FutureBuilder<
//                   //                                                   List<
//                   //                                                       DonVi>>(
//                   //                                               future: listDonVi(
//                   //                                                   snapshot1
//                   //                                                       .data!),
//                   //                                               builder: ((context,
//                   //                                                   snapshot) {
//                   //                                                 if (snapshot
//                   //                                                     .hasData) {
//                   //                                                   return DropdownButton(
//                   //                                                     hint: const Text(
//                   //                                                         'Chọn đơn vị'),
//                   //                                                     value:
//                   //                                                         selectedDonVi,
//                   //                                                     items: snapshot
//                   //                                                         .data!
//                   //                                                         .map(
//                   //                                                             (e) {
//                   //                                                       return DropdownMenuItem(
//                   //                                                         value: e
//                   //                                                             .donvi_ten
//                   //                                                             .toString(),
//                   //                                                         child: e.donvi_ten == null
//                   //                                                             ? const Text('Tất cả đơn vị')
//                   //                                                             : Text(e.donvi_ten.toString()),
//                   //                                                       );
//                   //                                                     }).toList(),
//                   //                                                     onChanged:
//                   //                                                         (value) {
//                   //                                                       setState(
//                   //                                                           () {
//                   //                                                         selectedDonVi =
//                   //                                                             value;
//                   //                                                       });
//                   //                                                     },
//                   //                                                   );
//                   //                                                 } else {
//                   //                                                   return const CircularProgressIndicator();
//                   //                                                 }
//                   //                                               })),
//                   //                                         ),
//                   //                                       ],
//                   //                                     )
//                   //                                   : const SizedBox(),
//                   //                               for (var item in snapshot.data!)
//                   //                                 Card(
//                   //                                     color: snapshot.data!
//                   //                                                     .indexOf(
//                   //                                                         item) %
//                   //                                                 2 ==
//                   //                                             0
//                   //                                         ? Card_colors_1
//                   //                                         : Card_colors_2,
//                   //                                     clipBehavior:
//                   //                                         Clip.hardEdge,
//                   //                                     child: InkWell(
//                   //                                         splashColor: Colors
//                   //                                             .blue
//                   //                                             .withAlpha(30),
//                   //                                         onTap: () {},
//                   //                                         child: Column(
//                   //                                           children: [
//                   //                                             Column(
//                   //                                               mainAxisAlignment:
//                   //                                                   MainAxisAlignment
//                   //                                                       .center,
//                   //                                               children: [
//                   //                                                 Detail_Rows(
//                   //                                                     title:
//                   //                                                         'Đơn vị:',
//                   //                                                     data: item
//                   //                                                         .donvi!),
//                   //                                                 Detail_Rows(
//                   //                                                     title:
//                   //                                                         'Địa bàn C2:',
//                   //                                                     data: item
//                   //                                                         .nhanvienHoten!),
//                   //                                                 Detail_Rows(
//                   //                                                     title:
//                   //                                                         'Địa bàn C3:',
//                   //                                                     data: item
//                   //                                                         .nhanvienSmcs!),
//                   //                                                 // Detail_Rows(
//                   //                                                 //     title:
//                   //                                                 //         'PTM:',
//                   //                                                 //     data: item
//                   //                                                 //         .nhanvienChucdanh!),
//                   //                                                 // Detail_Rows(
//                   //                                                 //     title:
//                   //                                                 //         'PSC:',
//                   //                                                 //     data: item
//                   //                                                 //         .soluongDuq!
//                   //                                                 //         .toString()),
//                   //                                                 // Detail_Rows(
//                   //                                                 //     title:
//                   //                                                 //         'TT:',
//                   //                                                 //     data: NumberFormat(
//                   //                                                 //             '#,###')
//                   //                                                 //         .format(
//                   //                                                 //             item.bangoiDoanhThu)),
//                   //                                                 // Detail_Rows(
//                   //                                                 //     title:
//                   //                                                 //         'Hủy:',
//                   //                                                 //     data: NumberFormat(
//                   //                                                 //             '#,###')
//                   //                                                 //         .format(
//                   //                                                 //             item.bangoiThulao)),
//                   //                                                 // Detail_Rows(
//                   //                                                 //     title:
//                   //                                                 //         'Ngưng PSC:',
//                   //                                                 //     data: NumberFormat(
//                   //                                                 //             '#,###')
//                   //                                                 //         .format(
//                   //                                                 //             item.tongThuLao)),
//                   //                                                 // Detail_Rows(
//                   //                                                 //     title:
//                   //                                                 //         '% Ngưng PSC/PTM:',
//                   //                                                 //     data: NumberFormat(
//                   //                                                 //             '#,###')
//                   //                                                 //         .format(
//                   //                                                 //             item.tongThuLao)),
//                   //                                                 // Detail_Rows(
//                   //                                                 //     title:
//                   //                                                 //         '% Ngưng PSC/PSC:',
//                   //                                                 //     data: NumberFormat(
//                   //                                                 //             '#,###')
//                   //                                                 //         .format(
//                   //                                                 //             item.tongThuLao)),
//                   //                                                 MaterialButton(
//                   //                                                   onPressed:
//                   //                                                       () {
//                   //                                                     pageTrasition(
//                   //                                                       context,
//                   //                                                       BieuMau_Detail(
//                   //                                                         month:
//                   //                                                             selectedMonth,
//                   //                                                         year:
//                   //                                                             selectedYear,
//                   //                                                       ),
//                   //                                                     );
//                   //                                                   },
//                   //                                                   child: Text_medium_dark(
//                   //                                                       title:
//                   //                                                           'Xem chi tiết'),
//                   //                                                 )
//                   //                                               ],
//                   //                                             ),
//                   //                                           ],
//                   //                                         ))),
//                   //                               Align(
//                   //                                 alignment: Alignment.topLeft,
//                   //                                 child: Text(
//                   //                                     '$pageNumber/${ThuLaoPhatTrienChamSocDUQ_Variable.totalPage} trang, ${ThuLaoPhatTrienChamSocDUQ_Variable.totalItem} mục'),
//                   //                               ),
//                   //                               ThuLaoPhatTrienChamSocDUQ_Variable
//                   //                                           .totalPage !=
//                   //                                       0
//                   //                                   ? SingleChildScrollView(
//                   //                                       scrollDirection:
//                   //                                           Axis.horizontal,
//                   //                                       child: Pager(
//                   //                                         currentPage:
//                   //                                             pageNumber,
//                   //                                         totalPages:
//                   //                                             ThuLaoPhatTrienChamSocDUQ_Variable
//                   //                                                 .totalPage,
//                   //                                         onPageChanged:
//                   //                                             (page) {
//                   //                                           setState(() {
//                   //                                             pageNumber = page;
//                   //                                           });
//                   //                                         },
//                   //                                       ),
//                   //                                     )
//                   //                                   : const Text(''),
//                   //                             ],
//                   //                           ),
//                   //                         )
//                   //                       : const Text(''));
//                   //             }));
//                   //       } else {
//                   //         return LoadingSreen(
//                   //             nameOfLoadingScreen: 'Đang lấy dữ liệu...');
//                   //       }
//                   //     })
//                 ],
//               ),
//             )));
//   }
// }
