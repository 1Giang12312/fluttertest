// // ignore_for_file: camel_case_types, must_be_immutable, file_names

// import 'package:flutter/material.dart';
// import 'package:vnptapp/Components/Custom_AppBar.dart';
// import 'package:vnptapp/Components/Custom_Data_Rows.dart';
// import 'package:vnptapp/Components/Custom_Text.dart';
// import 'package:vnptapp/Variable/Constant.dart';

// class BieuMau_Detail extends StatefulWidget {
//   BieuMau_Detail({super.key, required this.month, required this.year});
//   String month;
//   String year;
//   @override
//   State<BieuMau_Detail> createState() => _BieuMau_DetailState();
// }

// class DropdownItem {
//   final String value;
//   final String label;
//   DropdownItem(this.value, this.label);
// }

// class _BieuMau_DetailState extends State<BieuMau_Detail> {
//   Future<void> refresh() async {
//     setState(() {});
//   }

//   int soLuongCot = 8;
//   List<DropdownItem> dropdownItems = [
//     DropdownItem('1', 'BRCD'),
//     DropdownItem('2', 'MyTV'),
//   ];
//   String selectedYear = DateTime.now().year.toString();
//   String selectedMonth = DateTime.now().month.toString();
//   // var selectedDate;
//   DropdownItem? selectedValue;
//   // final List<String> indexItems = [
//   //   'Khu vực C3',
//   //   'Chỉ mục 1',
//   //   'Chỉ mục 2',
//   //   'Chỉ mục 3',
//   //   'Chỉ mục 4',
//   //   'Chỉ mục 5',
//   //   'sdfs'
//   // ];
//   // final List<String> dataList = [
//   //   'Long Bình',
//   //   'Vĩnh Hậu',
//   //   'Đa Phước',
//   //   'Trung Tâm',
//   //   'Đa Phước',
//   //   'Vĩnh Hậu',
//   //   'Đa Phước',
//   //   'Long Bình',
//   //   'Long Bình',
//   //   'Trung Tâm',
//   //   'Trung Tâm',
//   //   'Đa Phước',
//   //   'Đa Phước',
//   //   'Vĩnh Hậu',
//   //   'Vĩnh Hậu',
//   //   'Trung Tâm',
//   //   'Vĩnh Hậu',
//   //   'Vĩnh Hậu',
//   //   'Trung Tâm',
//   //   'Trung Tâm',
//   //   'Long Bình',
//   //   'Long Bình',
//   //   'Vĩnh Hậu',
//   //   'Trung Tâm',
//   //   'Đa Phước',
//   //   'Vĩnh Hậu',
//   //   'Trung Tâm',
//   //   'Long Bình',
//   //   'Long Bình',
//   //   'Long Bình',
//   //   'Long Bình',
//   //   'Trung Tâm',
//   //   'Núi Sam',
//   //   'Phường B',
//   //   'Vĩnh Mỹ',
//   //   'Phường A',
//   //   'Phường B',
//   //   'Phường B',
//   //   'Núi Sam',
//   //   'Núi Sam',
//   //   'Vĩnh Mỹ',
//   //   'Vĩnh Mỹ',
//   //   'Phường B',
//   //   'Phường B',
//   //   'Phường B',
//   //   'Phường A',
//   //   'Phường A',
//   //   'Phường A',
//   //   'Vĩnh Mỹ',
//   //   'Núi Sam',
//   //   'Cái Dầu',
//   //   'Mỹ Phú',
//   //   'Bình Mỹ',
//   //   'Vĩnh Thạnh Trung',
//   //   'Bình Mỹ',
//   //   'Mỹ Phú',
//   //   'Mỹ Phú',
//   //   'Vĩnh Thạnh Trung',
//   //   'Vĩnh Thạnh Trung',
//   //   'Bình Mỹ',
//   //   'Vĩnh Thạnh Trung',
//   //   'Mỹ Phú',
//   //   'Mỹ Phú',
//   //   'Bình Mỹ',
//   //   'Vĩnh Thạnh Trung',
//   //   'Cái Dầu',
//   //   'Bình Mỹ',
//   //   'Bình Mỹ',
//   //   'Bình Mỹ',
//   //   'Cái Dầu',
//   //   'Cái Dầu',
//   //   'Bình Mỹ',
//   //   'Mỹ Phú',
//   //   'Mỹ Phú',
//   //   'Mỹ Phú',
//   //   'Mỹ Phú',
//   //   'Vĩnh Thạnh Trung',
//   //   'Vĩnh Thạnh Trung',
//   //   'Vĩnh Thạnh Trung',
//   //   // Thêm dữ liệu hàng sau ở đây
//   // ];
//   // final List<String> indexItems2 = [
//   //   'Khu vực C3',
//   //   'Chỉ mục 4',
//   //   'Chỉ mục 5',
//   //   'Chỉ mục 6',
//   //   'Chỉ mục 41',
//   //   'Chỉ mục 2',
//   //   'sdfs'
//   //       'sdfs'
//   // ];
//   // final List<String> dataList2 = [
//   //   'Dữ liệu 4', 'Dữ liệu 5', 'Dữ liệu 1', 'Dữ liệu 4', 'Dữ liệu 5',
//   //   'Dữ liệu 7',
//   //   'asdf',
//   //   'Dữ liệu 3',
//   //   'Dữ liệu 2',
//   //   'Dữ liệu 5',
//   //   'Dữ liệu 123',
//   //   'Dữ liệu 54',
//   //   'Dữ liệu 1', 'asdf'
//   //   // Thêm dữ liệu hàng sau ở đây
//   // ];
//   @override
//   void initState() {
//     selectedValue = dropdownItems[0];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Custom_AppBar(title: 'Biểu mẫu thông báo'),
//       body: RefreshIndicator(
//           onRefresh: refresh,
//           child: SingleChildScrollView(
//             child: Column(children: [
//               Text_medium_dark(title: 'BÁO CÁO ĐIỀU HÀNH GIẢM HỦY ĐỊA BÀN'),
//               Text_small_dark(
//                   title: 'Từ báo cáo ${widget.month}/${widget.year}'),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 5,
//                     child: SizedBox(
//                       width: 1,
//                       child: Center(
//                         child: DropdownButton<DropdownItem>(
//                           value: selectedValue,
//                           onChanged: (newValue) {
//                             setState(() {
//                               selectedValue = newValue;
//                             });
//                           },
//                           items: dropdownItems
//                               .map<DropdownMenuItem<DropdownItem>>(
//                                   (DropdownItem item) {
//                             return DropdownMenuItem<DropdownItem>(
//                               value: item,
//                               child: Text_medium_dark(title: item.label),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Expanded(
//                   //   flex: 5,
//                   //   child: ElevatedButton(
//                   //     onPressed: () async {
//                   //       String? locale;
//                   //       final localeObj =
//                   //           locale != null ? Locale(locale) : null;
//                   //       final selected = await showMonthYearPicker(
//                   //         context: context,
//                   //         initialDate: selectedDate ?? DateTime.now(),
//                   //         firstDate: DateTime(2019),
//                   //         lastDate: DateTime(2030),
//                   //         locale: localeObj,
//                   //       );
//                   //       if (selected != null) {
//                   //         setState(() {
//                   //           selectedDate = selected;
//                   //           selectedMonth = convertMonth(selectedDate!.month);
//                   //           selectedYear = selectedDate!.year.toString();
//                   //         });
//                   //       }
//                   //     },
//                   //     child: Text('Tháng $selectedMonth năm $selectedYear'),
//                   //   ),
//                   // ),
//                 ],
//               ),
//               selectedValue!.label == 'BRCD'
//                   ? SizedBox(
//                       height: heightOfDevice(context),
//                       width: widthOfDevice(context),
//                       child:
//                           //  FutureBuilder(
//                           //     future: test123(),
//                           //     builder: (context, snapshot) {
//                           //       if (snapshot.data != null) {
//                           //         return SingleChildScrollView(
//                           //             scrollDirection: Axis.horizontal,
//                           //             child: SingleChildScrollView(
//                           //                 scrollDirection: Axis.vertical,
//                           //                 child: Column(
//                           //                   children: [
//                           //                     DataTable(
//                           //                         columnSpacing: 7.0,
//                           //                         columns: const [
//                           //                           DataColumn(
//                           //                             label: Text('Tên C2'),
//                           //                           ),
//                           //                           DataColumn(
//                           //                             label: Text('Tên C3'),
//                           //                           ),
//                           //                           DataColumn(
//                           //                             label: Text('PTM'),
//                           //                           ),
//                           //                           DataColumn(
//                           //                             label: Text('PSC'),
//                           //                           ),
//                           //                           DataColumn(
//                           //                             label: Text('TT'),
//                           //                           ),
//                           //                           DataColumn(
//                           //                             label: Text('Hủy'),
//                           //                           ),
//                           //                           DataColumn(
//                           //                             label: Text('Ngưng PSC'),
//                           //                           ),
//                           //                           DataColumn(
//                           //                             label:
//                           //                                 Text('% Ngưng PSC/PTM'),
//                           //                           ),
//                           //                           DataColumn(
//                           //                             label:
//                           //                                 Text('% Ngưng PSC/PSC'),
//                           //                           ),
//                           //                         ],
//                           //                         rows: [
//                           //                           DataRow(
//                           //                             cells: [
//                           //                                 DataCell(SizedBox(
//                           //                                 width: widthOfDevice(
//                           //                                         context) /
//                           //                                     9,
//                           //                                 child: Text('51'),
//                           //                               )),
//                           //                               DataCell(SizedBox(
//                           //                                 width: widthOfDevice(
//                           //                                         context) /
//                           //                                     9,
//                           //                                 child: Text('51'),
//                           //                               )),
//                           //                               DataCell(SizedBox(
//                           //                                 width: widthOfDevice(
//                           //                                         context) /
//                           //                                     9,
//                           //                                 child: Text('3914'),
//                           //                               )),
//                           //                                  DataCell(SizedBox(
//                           //                                 width: widthOfDevice(
//                           //                                         context) /
//                           //                                     9,
//                           //                                 child: Text('33'),
//                           //                               )),
//                           //                                  DataCell(SizedBox(
//                           //                                 width: widthOfDevice(
//                           //                                         context) /
//                           //                                     9,
//                           //                                 child: Text('15'),
//                           //                               )),
//                           //                                  DataCell(SizedBox(
//                           //                                 width: widthOfDevice(
//                           //                                         context) /
//                           //                                     9,
//                           //                                 child: Text('18'),
//                           //                               )),
//                           //                                  DataCell(SizedBox(
//                           //                                 width: widthOfDevice(
//                           //                                         context) /
//                           //                                     9,
//                           //                                 child: Text('35%'),
//                           //                               )),
//                           //                                  DataCell(SizedBox(
//                           //                                 width: widthOfDevice(
//                           //                                         context) /
//                           //                                     9,
//                           //                                 child: Text('0.46%'),
//                           //                               )),
//                           //                             ],
//                           //                           ),
//                           //                         ]),
//                           //                   ],
//                           //                 )));
//                           //       } else {
//                           //         return LoadingSreen(
//                           //             nameOfLoadingScreen: 'Đang tải dữ liệu');
//                           //       }
//                           //     }
//                           //     )
//                           SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Detail_Rows(
//                                 title: 'Đơn vị: ',
//                                 data: 'Trung tâm Viễn thông An Phú'),
//                             const Divider(),
//                             Detail_Rows(title: 'Địa bàn C2: ', data: 'An Phú'),
//                             const Divider(),
//                             Detail_Rows(
//                                 title: 'Địa bàn C3: ', data: 'Long Bình'),
//                             const Divider(),
//                             Detail_Rows(title: 'PTM:', data: '51'),
//                             const Divider(),
//                             Detail_Rows(title: 'PSC: ', data: '3914'),
//                             const Divider(),
//                             Detail_Rows(title: 'TT: ', data: '33'),
//                             const Divider(),
//                             Detail_Rows(title: 'Hủy: ', data: '15'),
//                             const Divider(),
//                             Detail_Rows(title: 'Ngưng PSC: ', data: '18'),
//                             const Divider(),
//                             Detail_Rows(title: '% Ngưng PSC/PTM ', data: '35%'),
//                             const Divider(),
//                             Detail_Rows(
//                                 title: '% Ngưng PSC/ PSC: ', data: '0.46%'),
//                           ],
//                         ),
//                       ))

//                   // GridView.builder(
//                   //   gridDelegate:
//                   //       SliverGridDelegateWithFixedCrossAxisCount(
//                   //           crossAxisCount: 6),
//                   //   itemCount: dataList.length +
//                   //       6, // Số cột hàng đầu + số dòng dữ liệu
//                   //   itemBuilder: (context, index) {
//                   //     if (index < 6) {
//                   //       // Dòng đầu tiên chứa chỉ mục
//                   //       return Container(
//                   //         color: Colors.blue,
//                   //         alignment: Alignment.center,
//                   //         padding: EdgeInsets.all(8.0),
//                   //         child: Text(
//                   //           indexItems[index],
//                   //           style: TextStyle(color: Colors.white),
//                   //         ),
//                   //       );
//                   //     } else {
//                   //       // Các hàng dữ liệu
//                   //       return Container(
//                   //         color: Colors.white,
//                   //         alignment: Alignment.center,
//                   //         padding: EdgeInsets.all(8.0),
//                   //         child: Text(dataList[index - 6]),
//                   //       );
//                   //     }
//                   //   },
//                   // )

//                   :
//                   //  SizedBox(
//                   //     height: heightOfDevice(context),
//                   //     width: widthOfDevice(context),
//                   //     child: SingleChildScrollView(
//                   //         scrollDirection: Axis.horizontal,
//                   //         child: SingleChildScrollView(
//                   //           scrollDirection: Axis.vertical,
//                   //           child:
//                   //               DataTable(columnSpacing: 7.0, columns: const [
//                   //             DataColumn(
//                   //               label: Text('Tên C2'),
//                   //             ),
//                   //             DataColumn(
//                   //               label: Text('Tên C3'),
//                   //             ),
//                   //             DataColumn(
//                   //               label: Text('Mục 1'),
//                   //             ),
//                   //             DataColumn(
//                   //               label: Text('Mục 2'),
//                   //             ),
//                   //             DataColumn(
//                   //               label: Text('Mục 3'),
//                   //             ),
//                   //             DataColumn(
//                   //               label: Text('Mục 4'),
//                   //             ),
//                   //             DataColumn(
//                   //               label: Text('Tổng điểm'),
//                   //             ),
//                   //           ], rows: <DataRow>[
//                   //             DataRow(cells: <DataCell>[
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text(
//                   //                     'Trung tâm Viễn thông An Phú'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('Long Bình'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('1.4'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('5.4'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('3.1'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('4.5'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('10.4'),
//                   //               ))
//                   //             ]),
//                   //             DataRow(cells: <DataCell>[
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text(
//                   //                     'Trung tâm Viễn thông An Phú'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('Vĩnh Hậu'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('1.4'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('5.4'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('3.1'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('4.5'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('10.4'),
//                   //               ))
//                   //             ]),
//                   //             DataRow(cells: <DataCell>[
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text(
//                   //                     'Trung tâm Viễn thông An Phú'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('Đa Phước'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('1.4'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('5.4'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('3.1'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('4.5'),
//                   //               )),
//                   //               DataCell(SizedBox(
//                   //                 width: widthOfDevice(context) / soLuongCot,
//                   //                 child: const Text('10.4'),
//                   //               ))
//                   //             ]),
//                   //           ]),
//                   //         )
//                   //         // Detail_Rows_FormThongBao(
//                   //         //     title: 'Tên C3',
//                   //         //     data: 'Mục 1',
//                   //         //     data1: 'Mục 2',
//                   //         //     data2: 'Mục 3',
//                   //         //     data3: 'Mục 4',
//                   //         //     data4: 'Mục 5',
//                   //         //     data5: 'Mục 6'),
//                   //         // Detail_Rows_FormThongBao(
//                   //         //     title: 'Long Xuyên',
//                   //         //     data: 'Mục 1',
//                   //         //     data1: 'Mục 2',
//                   //         //     data2: 'Mục 3',
//                   //         //     data3: 'Mục 4',
//                   //         //     data4: 'Mục 5',
//                   //         //     data5: 'Mục 6')
//                   //         ))

//                   SingleChildScrollView(
//                       child: Column(
//                       children: [
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Detail_Rows(
//                             title: 'Đơn vị: ',
//                             data: 'Trung tâm Viễn thông An Phú'),
//                         const Divider(),

//                         Detail_Rows(title: 'Địa bàn C2: ', data: 'An Phú'),
//                         const Divider(),

//                         Detail_Rows(title: 'Địa bàn C3: ', data: 'Long Bình'),
//                         const Divider(),

//                         Detail_Rows(title: 'PTM:', data: '32'),
//                         const Divider(),

//                         Detail_Rows(title: 'PSC: ', data: '2011'),
//                         const Divider(),
//                         Detail_Rows(title: 'TT: ', data: '19'),
//                         const Divider(),
//                         Detail_Rows(title: 'Hủy: ', data: '22'),
//                         const Divider(),
//                         Detail_Rows(title: 'Ngưng PSC: ', data: '13'),
//                         const Divider(),
//                         Detail_Rows(title: '% Ngưng PSC/PTM ', data: '40.63%'),
//                         const Divider(),
//                         Detail_Rows(title: '% Ngưng PSC/ PSC: ', data: '0.65%'),

//                         // FutureBuilder(
//                         //     future: test123(),
//                         //     builder: (context, snapshot) {
//                         //       if (snapshot.data != null) {
//                         //         return SingleChildScrollView(
//                         //             child: Column(
//                         //           children: [
//                         //             for (var item in snapshot.data!)
//                         //               Card(
//                         //                   color:
//                         //                       snapshot.data!.indexOf(item) %
//                         //                                   2 ==
//                         //                               0
//                         //                           ? Card_colors_1
//                         //                           : Card_colors_2,
//                         //                   clipBehavior: Clip.hardEdge,
//                         //                   child: InkWell(
//                         //                       splashColor:
//                         //                           Colors.blue.withAlpha(30),
//                         //                       onTap: () {},
//                         //                       child: Column(
//                         //                         children: [
//                         //                           Detail_Rows(
//                         //                               title: 'Tên C2',
//                         //                               data: item.api
//                         //                                   .toString()),
//                         //                           Detail_Rows(
//                         //                               title: 'Tên C3',
//                         //                               data: item.auth!),
//                         //                           Detail_Rows(
//                         //                               title: 'Mục 1:',
//                         //                               data: item.category!),
//                         //                           Detail_Rows(
//                         //                               title: 'Mục 2:',
//                         //                               data: item.cors!),
//                         //                           Detail_Rows(
//                         //                               title: 'Mục 3:',
//                         //                               data: item.https
//                         //                                   .toString()),
//                         //                           Detail_Rows(
//                         //                               title: 'Mục 4:',
//                         //                               data: item.https
//                         //                                   .toString()),
//                         //                           Detail_Rows(
//                         //                               title: 'Mục 5:',
//                         //                               data: item.https
//                         //                                   .toString()),
//                         //                         ],
//                         //                       ))),
//                         //           ],
//                         //         ));
//                         //       } else {
//                         //         return LoadingSreen(
//                         //             nameOfLoadingScreen: 'Đang tải');
//                         //       }
//                         //     }),
//                         // Card(
//                         //     color: Card_colors_1,
//                         //     clipBehavior: Clip.hardEdge,
//                         //     child: InkWell(
//                         //         splashColor: Colors.blue.withAlpha(30),
//                         //         onTap: () {},
//                         //         child: Column(
//                         //           children: [
//                         //             Detail_Rows(
//                         //                 title: 'Tên C2',
//                         //                 data: 'Trung tâm Viễn thông An Phú'),
//                         //             Detail_Rows(
//                         //                 title: 'Tên C3', data: 'Long Bình'),
//                         //             Detail_Rows(title: 'Mục 1:', data: '3.4'),
//                         //             Detail_Rows(title: 'Mục 2:', data: '5.4'),
//                         //             Detail_Rows(title: 'Mục 3:', data: '5.5'),
//                         //             Detail_Rows(title: 'Mục 4:', data: '4.1'),
//                         //           ],
//                         //         ))),
//                         // Card(
//                         //     color: Card_colors_2,
//                         //     clipBehavior: Clip.hardEdge,
//                         //     child: InkWell(
//                         //         splashColor: Colors.blue.withAlpha(30),
//                         //         onTap: () {},
//                         //         child: Column(
//                         //           children: [
//                         //             Detail_Rows(
//                         //                 title: 'Tên C2',
//                         //                 data: 'Trung tâm Viễn thông An Phú'),
//                         //             Detail_Rows(
//                         //                 title: 'Tên C3', data: 'Đa Phước'),
//                         //             Detail_Rows(title: 'Mục 1:', data: '3.4'),
//                         //             Detail_Rows(title: 'Mục 2:', data: '5.4'),
//                         //             Detail_Rows(title: 'Mục 3:', data: '5.5'),
//                         //             Detail_Rows(title: 'Mục 4:', data: '4.1'),
//                         //           ],
//                         //         ))),
//                         // Card(
//                         //     color: Card_colors_1,
//                         //     clipBehavior: Clip.hardEdge,
//                         //     child: InkWell(
//                         //         splashColor: Colors.blue.withAlpha(30),
//                         //         onTap: () {},
//                         //         child: Column(
//                         //           children: [
//                         //             Detail_Rows(
//                         //                 title: 'Tên C2',
//                         //                 data: 'Trung tâm Viễn thông An Phú'),
//                         //             Detail_Rows(
//                         //                 title: 'Tên C3', data: 'Vĩnh Hậu'),
//                         //             Detail_Rows(title: 'Mục 1:', data: '3.4'),
//                         //             Detail_Rows(title: 'Mục 2:', data: '5.4'),
//                         //             Detail_Rows(title: 'Mục 3:', data: '5.5'),
//                         //             Detail_Rows(title: 'Mục 4:', data: '4.1'),
//                         //           ],
//                         //         ))),
//                       ],
//                     ))
//             ]),
//           )),
//     );
//   }
// }

// class Detail_Rows_FormThongBao extends StatelessWidget {
//   Detail_Rows_FormThongBao(
//       {super.key,
//       required this.title,
//       required this.data,
//       required this.data1,
//       required this.data2,
//       required this.data3,
//       required this.data4,
//       required this.data5});
//   String title;
//   String data;
//   String data1;
//   String data2;
//   String data3;
//   String data4;
//   String data5;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         const SizedBox(
//           width: 20,
//         ),
//         Expanded(
//           flex: 1,
//           child: SizedBox(
//             child: Text_medium_dark(title: title),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: SizedBox(
//             child: Text_medium_dark(title: data),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: SizedBox(
//             child: Text_medium_dark(title: data1),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: SizedBox(
//             child: Text_medium_dark(title: data2),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: SizedBox(
//             child: Text_medium_dark(title: data3),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: SizedBox(
//             child: Text_medium_dark(title: data4),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: SizedBox(
//             child: Text_medium_dark(title: data5),
//           ),
//         ),
//       ],
//     );
//   }
// }
