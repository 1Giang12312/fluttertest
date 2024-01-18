// // ignore_for_file: camel_case_types, file_names

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:vnptapp/Components/Custom_AppBar.dart';
// import 'package:vnptapp/Components/Custom_Data_Rows.dart';
// import 'package:vnptapp/Variable/Constant.dart';
// import 'package:vnptapp/screen/Drawer/Khac/QuanLyPhanQuyen/Logic.dart';

// // ignore: must_be_immutable
// class QuanLyPhanQuyen_Detail extends StatefulWidget {
//   QuanLyPhanQuyen_Detail(
//       {super.key,
//       required this.hoTen,
//       required this.iD,
//       required this.sdt,
//       required this.maNV,
//       required this.donViID});
//   String hoTen;
//   int iD;
//   String sdt;
//   String maNV;
//   int donViID;
//   @override
//   State<QuanLyPhanQuyen_Detail> createState() => _QuanLyPhanQuyen_DetailState();
// }

// class _QuanLyPhanQuyen_DetailState extends State<QuanLyPhanQuyen_Detail> {
//   Future<void> refresh() async {
//     setState(() {});
//   }

//   int soLuongCot = 6;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
// var c1Provider = StateProvider<bool>((ref) => false);
// var c2Provider = StateProvider<bool>((ref) => false);
// var c3Provider = StateProvider<bool>((ref) => false);
// var c4Provider = StateProvider<bool>((ref) => false);

//     return Scaffold(
//       appBar: Custom_AppBar(title: 'Chi tiết phân quyền'),
//       body: RefreshIndicator(
//           onRefresh: refresh,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Consumer(builder: (context, watch, child) {
//                   return FutureBuilder(
//                       future: getPhanQuyen(widget.iD),
//                       builder: (context, snapshot) {
//                         if (snapshot.data != null &&
//                             snapshot.connectionState !=
//                                 ConnectionState.waiting) {
//                           WidgetsBinding.instance.addPostFrameCallback((_) {
//                             watch.read(c1Provider.notifier).state =
//                                 snapshot.data!.c1!;
//                             watch.read(c2Provider.notifier).state =
//                                 snapshot.data!.c2!;
//                             watch.read(c3Provider.notifier).state =
//                                 snapshot.data!.c3!;
//                             watch.read(c4Provider.notifier).state =
//                                 snapshot.data!.c4!;
//                           });

//                           return Column(
//                             children: [
//                               Detail_Rows(
//                                   title: 'ID', data: widget.iD.toString()),
//                               Detail_Rows(title: 'Họ tên', data: widget.hoTen),
//                               Detail_Rows(
//                                   title: 'Số điện thoại', data: widget.sdt),
//                               Detail_Rows(
//                                   title: 'Mã nhân viên', data: widget.maNV),
//                               DataTable(columnSpacing: 7.0, columns: const [
//                                 DataColumn(
//                                   label: Text(''),
//                                 ),
//                                 DataColumn(
//                                   label: Text('Xem C1'),
//                                 ),
//                                 DataColumn(
//                                   label: Text('Xem C2'),
//                                 ),
//                                 DataColumn(
//                                   label: Text('Xem C3'),
//                                 ),
//                                 DataColumn(
//                                   label: Text('Xem C4'),
//                                 ),
//                               ], rows: <DataRow>[
//                                 DataRow(cells: <DataCell>[
//                                   DataCell(SizedBox(
//                                     width: widthOfDevice(context) / soLuongCot,
//                                     child: const Text('Phân quyền'),
//                                   )),
//                                   DataCell(Custom_CheckBox(
//                                     provider: c1Provider,
//                                     soLuongCot: soLuongCot,
//                                   )),
//                                   DataCell(Custom_CheckBox(
//                                     provider: c2Provider,
//                                     soLuongCot: soLuongCot,
//                                   )),
//                                   DataCell(Custom_CheckBox(
//                                     provider: c3Provider,
//                                     soLuongCot: soLuongCot,
//                                   )),
//                                   DataCell(Custom_CheckBox(
//                                     provider: c4Provider,
//                                     soLuongCot: soLuongCot,
//                                   )),
//                                 ]),
//                               ]),
//                             ],
//                           );
//                         } else {
//                           return const Text('waitting....');
//                         }
//                       });
//                 })
//               ],
//             ),
//           )),
//     );
//   }
// }
// // ignore: must_be_immutable
// class Custom_CheckBox extends ConsumerWidget {
//   Custom_CheckBox(
//       {super.key, required this.provider, required this.soLuongCot});
//   int soLuongCot;
//   dynamic provider;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     Color getColor(Set<MaterialState> states) {
//       return Colors.white;
//     }
//     return Consumer(builder: (context, watch, child) {
//       var c1 = watch.watch(provider);
//       return SizedBox(
//         width: widthOfDevice(context) / soLuongCot,
//         child: Checkbox(
//           checkColor: Colors.black,
//           fillColor: MaterialStateProperty.resolveWith(getColor),
//           value: c1,
//           onChanged: (bool? value) {
//             watch.read(provider.notifier).state = value!;
//             //gọi api update data
//             //print(value.toString());
//           },
//         ),
//       );
//     });
//   }
// }
// // class Custom_checkbox extends StatefulWidget {
// //   Custom_checkbox(
// //       {super.key,
// //       required this.soLuongCot,
// //       required this.data,
// //       required this.temp,
// //       required this.updateState});
// //   int soLuongCot;
// //   bool data;
// //   bool temp;
// //   Function() updateState;
// //   @override
// //   State<Custom_checkbox> createState() => _Custom_checkboxState();
// // }

// // class _Custom_checkboxState extends State<Custom_checkbox> {
// //   Color getColor(Set<MaterialState> states) {
// //     return Colors.white;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       width: widthOfDevice(context) / widget.soLuongCot,
// //       child: Checkbox(
// //         checkColor: Colors.black,
// //         fillColor: MaterialStateProperty.resolveWith(getColor),
// //         value: widget.temp == widget.data
// //             ? widget.temp = widget.data
// //             : widget.temp = widget.temp,
// //         onChanged: (bool? value) {
// //           setState(() {
// //             widget.temp = value!;
// //             widget.updateState();
// //           });
// //         },
// //       ),
// //     );
// //   }
// // }
