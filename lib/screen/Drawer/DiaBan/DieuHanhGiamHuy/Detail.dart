// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Data_Rows_Color.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/DieuHanhGiamHuy/Logic.dart';

class DropdownItem {
  final String value;
  final String label;
  DropdownItem(this.value, this.label);
}

List<DropdownItem> dropdownItems = [
  DropdownItem('Fiber', 'Fiber(BRCĐ)'),
  DropdownItem('MyTV', 'MyTV'),
  DropdownItem('Mesh/Cam', 'Mesh/Cam'),
  // DropdownItem('CoDinh', 'Cố định'),
  DropdownItem('FiberMyTVMesh/CamCoDinh', 'Tất cả'),
];
DropdownItem? selectedValue;
var selectedLoaiHinh = StateProvider<dynamic>((ref) => null);

// class DieuHanhGiamHuy_Detail extends StatefulWidget {
//   DieuHanhGiamHuy_Detail({
//     super.key,
//     required this.timeKey,
//     required this.tenKhuVucC3,
//     required this.tamDungThanhLyPtm,
//   });
//   String timeKey;
//   String tenKhuVucC3;
//   TamDungThanhLyPtm tamDungThanhLyPtm;
//   @override
//   State<DieuHanhGiamHuy_Detail> createState() => _DieuHanhGiamHuy_DetailState();
// }

// class _DieuHanhGiamHuy_DetailState extends State<DieuHanhGiamHuy_Detail> {
//   @override
//   void initState() {
//     selectedValue = dropdownItems[0];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: Custom_AppBar(title: 'Chi tiết KV ${widget.tenKhuVucC3}'),
//         body: FutureBuilder(
//             future: checkLocalConnectionApi(),
//             builder: (context, snapshot) {
//               if (snapshot.data != null &&
//                   snapshot.connectionState != ConnectionState.waiting) {
//                 return FutureBuilder(
//                     future: ngungPsc(widget.timeKey,
//                         widget.tamDungThanhLyPtm.khuvucC3Id, snapshot.data!),
//                     builder: (context, snapshot1) {
//                       // if (snapshot1.data != null &&
//                       //     snapshot1.connectionState != ConnectionState.waiting) {
//                       return Custom_FutureBuilder(
//                           snapshot: snapshot1,
//                           contextParam: snapshot1,
//                           widgetParam: snapshot1.hasData
//                               ? SingleChildScrollView(
//                                   child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           right: 8, left: 8, bottom: 8),
//                                       child: Consumer(
//                                           builder: (context, ref, child) {
//                                         var selectedValueLoaiHinh =
//                                             ref.watch(selectedLoaiHinh);
//                                         return Column(
//                                           children: [
//                                             const SizedBox(
//                                               height: 10,
//                                             ),
//                                             SizedBox(
//                                               child: Center(
//                                                 child: DropdownButton<
//                                                     DropdownItem>(
//                                                   borderRadius:
//                                                       const BorderRadius.all(
//                                                           Radius.circular(20)),
//                                                   value: selectedValueLoaiHinh,
//                                                   onChanged: (newValue) {
//                                                     ref
//                                                         .read(selectedLoaiHinh
//                                                             .notifier)
//                                                         .state = newValue!;
//                                                   },
//                                                   items: dropdownItems.map<
//                                                           DropdownMenuItem<
//                                                               DropdownItem>>(
//                                                       (DropdownItem item) {
//                                                     return DropdownMenuItem<
//                                                         DropdownItem>(
//                                                       value: item,
//                                                       child: Text(item.label),
//                                                     );
//                                                   }).toList(),
//                                                 ),
//                                               ),
//                                             ),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: true,
//                                               widget: Detail_Rows(
//                                                 title: 'Tên khu vực c3: ',
//                                                 data: widget.tenKhuVucC3,
//                                               ),
//                                             ),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title: 'PTM: ',
//                                                         data: snapshot1
//                                                             .data!.ptmFiber
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title: 'PSC: ',
//                                                         data: snapshot1
//                                                             .data!.pscFiber
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'thực tăng :  ',
//                                                         data: snapshot1
//                                                             .data!.ttFiber
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'thanh lý : ',
//                                                         data: snapshot1
//                                                             .data!.ttFiber
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'ngưng PSC : ',
//                                                         data: snapshot1
//                                                             .data!.ngungPscFiber
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV Box PTM : ',
//                                                         data: snapshot1
//                                                             .data!.ptmMytvBox
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title: 'MyTV Box PSC  ',
//                                                         data: snapshot1
//                                                             .data!.pscMytvBox
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTv Box thực tăng : ',
//                                                         data: snapshot1
//                                                             .data!.ttMytvBox
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTv Box thanh lý: ',
//                                                         data: snapshot1.data!
//                                                             .thanhlyMytvbox
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV Box ngưng PSC : ',
//                                                         data: snapshot1.data!
//                                                             .ngungPscMytvBox
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV App PTM : ',
//                                                         data: snapshot1
//                                                             .data!.ptmMytvApp
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTv App thực tăng : ',
//                                                         data: snapshot1
//                                                             .data!.ttMytvApp
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTv App thanh lý : ',
//                                                         data: snapshot1.data!
//                                                             .thanhlyMytvapp
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTv App ngưng PSC : ',
//                                                         data: snapshot1.data!
//                                                             .ngungPscMytvApp
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'Tổng MyTV PTM: ',
//                                                         data: snapshot1
//                                                             .data!.ptmMytvTong
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'Tổng MyTV PSC: ',
//                                                         data: snapshot1
//                                                             .data!.pscMytvTong
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'Tổng MyTV thực tăng : ',
//                                                         data: snapshot1
//                                                             .data!.ttMytvTong
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTv thanh lý : ',
//                                                         data: snapshot1
//                                                             .data!.thanhlyMytv
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'Tổng MyTV PSC cước: ',
//                                                         data: snapshot1.data!
//                                                             .ngungPscMytvTong
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: true,
//                                               widget: Detail_Rows(
//                                                   title: 'Tháng: ',
//                                                   data: timeKeyToMonthYear(
//                                                       snapshot1.data!.timeKey
//                                                           .toString())),
//                                             ),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: false,
//                                               widget: Detail_Rows(
//                                                   title: 'Ngày cập nhật: ',
//                                                   data: DateFormat(
//                                                                   'HH:mm dd/MM/yyyy')
//                                                               .format(snapshot1
//                                                                   .data!
//                                                                   .ngayCapNhat!)
//                                                               .toString() ==
//                                                           "00:00 01/01/0001"
//                                                       ? ""
//                                                       : DateFormat(
//                                                               'HH:mm dd/MM/yyyy')
//                                                           .format(snapshot1
//                                                               .data!
//                                                               .ngayCapNhat!)
//                                                           .toString()),
//                                             ),
//                                             Divider(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'PTM dùng thử  ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmDungthuFiber
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'PTM dùng thật  : ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmDungthatFiber
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'PTM NVKD : ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmKinhdoanhFiber
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'PTM NVKT  : ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmKythuatFiber
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'PTM mạng khác chuyển sang: ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmFiberMk
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV PTM dùng thử : ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmDungthuMytv
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV PTM dùng thật : ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmDungthatMytv
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV PTM NVKD : ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmKinhdoanhMytv
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV PTM NVKT : ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmKythuatMytv
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV PTM mạng khác chuyển sang: ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmMytvMk
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV PTM - hiện hữu: ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmMytvFiberHh
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV PTM - PTM: ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .ptmMytvFiberPtm
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'Khôi phục : ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .khoiphucFiber
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV Khôi phục : ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .khoiphucMytv
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: false,
//                                               widget: Detail_Rows(
//                                                   title: 'Mesh PTM : ',
//                                                   data: widget
//                                                       .tamDungThanhLyPtm.ptmMesh
//                                                       .toString()),
//                                             ),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: true,
//                                               widget: Detail_Rows(
//                                                   title: 'Camera PTM : ',
//                                                   data: widget.tamDungThanhLyPtm
//                                                       .ptmCamera
//                                                       .toString()),
//                                             ),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: false,
//                                               widget: Detail_Rows(
//                                                   title: 'Tháng: ',
//                                                   data: timeKeyToMonthYear(
//                                                       widget.tamDungThanhLyPtm
//                                                           .timeKey
//                                                           .toString())),
//                                             ),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: true,
//                                               widget: Detail_Rows(
//                                                   title: 'Ngày cập nhật: ',
//                                                   data: DateFormat(
//                                                                   'HH:mm dd/MM/yyyy')
//                                                               .format(widget
//                                                                   .tamDungThanhLyPtm
//                                                                   .ngayCapNhat!)
//                                                               .toString() ==
//                                                           "00:00 01/01/0001"
//                                                       ? ""
//                                                       : DateFormat(
//                                                               'HH:mm dd/MM/yyyy')
//                                                           .format(widget
//                                                               .tamDungThanhLyPtm
//                                                               .ngayCapNhat!)
//                                                           .toString()),
//                                             ),
//                                             Divider(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'tạm dừng: ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .fiberTamdung
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "Fiber" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'thanh lý: ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .fiberThanhly
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV tạm dừng : ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .mytvTamdung
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             selectedValueLoaiHinh.value ==
//                                                         "MyTV" ||
//                                                     selectedValueLoaiHinh
//                                                             .value ==
//                                                         "null"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: false,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'MyTV thanh lý: ',
//                                                         data: widget
//                                                             .tamDungThanhLyPtm
//                                                             .mytvThanhly
//                                                             .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: true,
//                                               widget: Detail_Rows(
//                                                   title: 'Mesh tạm dừng: ',
//                                                   data: widget.tamDungThanhLyPtm
//                                                       .meshTamdung
//                                                       .toString()),
//                                             ),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: false,
//                                               widget: Detail_Rows(
//                                                   title: 'Mesh thanh lý: ',
//                                                   data: widget.tamDungThanhLyPtm
//                                                       .meshThanhly
//                                                       .toString()),
//                                             ),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: true,
//                                               widget: Detail_Rows(
//                                                   title: 'Cố định tạm dừng: ',
//                                                   data: widget.tamDungThanhLyPtm
//                                                       .codinhTamdung
//                                                       .toString()),
//                                             ),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: false,
//                                               widget: Detail_Rows(
//                                                   title: 'Cố định thanh lý: ',
//                                                   data: widget.tamDungThanhLyPtm
//                                                       .codinhThanhly
//                                                       .toString()),
//                                             ),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: true,
//                                               widget: Detail_Rows(
//                                                   title: 'Tháng: ',
//                                                   data: timeKeyToMonthYear(
//                                                       widget.tamDungThanhLyPtm
//                                                           .timeKey2
//                                                           .toString())),
//                                             ),
//                                             Custom_Data_Rows_Color_SmallData(
//                                               indexCount: false,
//                                               widget: Detail_Rows(
//                                                   title: 'Ngày cập nhật: ',
//                                                   data: DateFormat(
//                                                                   'HH:mm dd/MM/yyyy')
//                                                               .format(widget
//                                                                   .tamDungThanhLyPtm
//                                                                   .ngayCapNhat2!)
//                                                               .toString() ==
//                                                           "00:00 01/01/0001"
//                                                       ? ""
//                                                       : DateFormat(
//                                                               'HH:mm dd/MM/yyyy')
//                                                           .format(widget
//                                                               .tamDungThanhLyPtm
//                                                               .ngayCapNhat2!)
//                                                           .toString()),
//                                             ),
//                                             //ngày cập nhật fiber
//                                             selectedValueLoaiHinh.value ==
//                                                     "Fiber"
//                                                 ? Custom_Data_Rows_Color_SmallData(
//                                                     indexCount: true,
//                                                     widget: Detail_Rows(
//                                                         title:
//                                                             'Ngày lấy dữ liệu : ',
//                                                         data: DateFormat('HH:mm dd/MM/yyyy')
//                                                                     .format(soSanh3DateTime(
//                                                                         snapshot1
//                                                                             .data!
//                                                                             .ngayCapNhat!,
//                                                                         widget
//                                                                             .tamDungThanhLyPtm
//                                                                             .ngayCapNhat!,
//                                                                         widget
//                                                                             .tamDungThanhLyPtm
//                                                                             .ngayCapNhat2!))
//                                                                     .toString() ==
//                                                                 "00:00 01/01/0001"
//                                                             ? ""
//                                                             : DateFormat('HH:mm dd/MM/yyyy')
//                                                                 .format(soSanh3DateTime(
//                                                                     snapshot1
//                                                                         .data!
//                                                                         .ngayCapNhat!,
//                                                                     widget
//                                                                         .tamDungThanhLyPtm
//                                                                         .ngayCapNhat!,
//                                                                     widget
//                                                                         .tamDungThanhLyPtm
//                                                                         .ngayCapNhat2!))
//                                                                 .toString()),
//                                                   )
//                                                 : const SizedBox(),
//                                           ],
//                                         );
//                                       })))
//                               : const Text(
//                                   "Lỗi xác thực vui lòng đăng nhập lại"));
//                       // } else {
//                       //   return LoadingScreen(
//                       //       nameOfLoadingScreen: "Đang tải dữ liệu");
//                       // }
//                     });
//               } else {
//                 return LoadingScreen(nameOfLoadingScreen: "Đang kiểm tra mạng");
//               }
//             }));
//   }
// }

class DieuHanhGiamHuy_Detail extends StatefulWidget {
  DieuHanhGiamHuy_Detail(
      {super.key,
      required this.timeKey,
      required this.tenKhuVucC3,
      required this.kvC3id});
  String timeKey;
  String tenKhuVucC3;
  int kvC3id;
  @override
  State<DieuHanhGiamHuy_Detail> createState() => _DieuHanhGiamHuy_DetailState();
}

class _DieuHanhGiamHuy_DetailState extends State<DieuHanhGiamHuy_Detail> {
  @override
  void initState() {
    selectedValue = dropdownItems[3];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(title: 'Chi tiết địa bàn ${widget.tenKhuVucC3}'),
        body: FutureBuilder(
            future: checkLocalConnectionApi(),
            builder: (context, snapshot) {
              if (snapshot.data != null &&
                  snapshot.connectionState != ConnectionState.waiting) {
                return FutureBuilder(
                    future: detailDhgh(widget.timeKey, snapshot.data!,
                        widget.kvC3id, localNhanVien.nhanvien_donvi.toString()),
                    builder: (context, snapshot1) {
                      return Custom_FutureBuilder(
                          snapshot: snapshot1,
                          contextParam: snapshot1,
                          widgetParam: snapshot1.hasData
                              ? SingleChildScrollView(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8, left: 8, bottom: 8),
                                      child: Consumer(
                                          builder: (context, ref, child) {
                                        var selectedValueLoaiHinh =
                                            ref.watch(selectedLoaiHinh);
                                        selectedValueLoaiHinh == null
                                            ? selectedValueLoaiHinh =
                                                selectedValue
                                            : selectedValueLoaiHinh =
                                                selectedValueLoaiHinh;
                                        return Column(
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: 'Báo cáo tháng ',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                // Phong cách văn bản mặc định
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: timeKeyToMonthYear(
                                                        widget.timeKey
                                                            .toString()),
                                                    style: const TextStyle(
                                                      color: Colors
                                                          .red, // Màu sắc bạn muốn áp dụng
                                                      fontWeight: FontWeight
                                                          .bold, // Các thuộc tính văn bản khác
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              child: Center(
                                                child: DropdownButton<
                                                    DropdownItem>(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20)),
                                                  value: selectedValueLoaiHinh,
                                                  onChanged: (newValue) {
                                                    ref
                                                        .read(selectedLoaiHinh
                                                            .notifier)
                                                        .state = newValue!;
                                                  },
                                                  items: dropdownItems.map<
                                                          DropdownMenuItem<
                                                              DropdownItem>>(
                                                      (DropdownItem item) {
                                                    return DropdownMenuItem<
                                                        DropdownItem>(
                                                      value: item,
                                                      child: Text(item.label),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ),
                                            //Text('Tên khu vực c3: ${widget.tenKhuVucC3}')
                                            // Custom_Data_Rows_Color_SmallData(
                                            //   indexCount: true,
                                            //   title: 'Tên khu vực c3: ',
                                            //   data: widget.tenKhuVucC3,
                                            // ),
                                            selectedValueLoaiHinh.value
                                                    .toString()
                                                    .contains("Fiber")
                                                ? SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        DividerCusTom(
                                                            title:
                                                                "Fiber (BRCĐ)"),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '- Dự báo PSC: ',
                                                            data: snapshot1
                                                                .data!
                                                                .dukienPsc),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Dự báo thực tăng: ',
                                                            data: snapshot1
                                                                .data!
                                                                .dukienThuctang),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'PSC(Tháng N-1): ',
                                                        //     data: snapshot1
                                                        //         .data!.pscFiber
                                                        //         .toString()),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title: '- PTM: ',
                                                            data: snapshot1
                                                                .data!
                                                                .tongPtmdungthuDungthat),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '     + Dùng thử: ',
                                                            data: snapshot1
                                                                .data!
                                                                .ptmFiberDungthuTrongthang),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '     + Dùng thật: ',
                                                            data: snapshot1
                                                                .data!
                                                                .ptmFiberDungthatTrongthang),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '     + NVKD: ',
                                                            data: snapshot1
                                                                .data!
                                                                .nvkinhdoanhFiber),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '     + NVKT: ',
                                                            data: snapshot1
                                                                .data!
                                                                .nvkythuatFiber),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '     + Nhà mạng khác: ',
                                                            data: snapshot1
                                                                .data!
                                                                .ptmFiberMk),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title: '- Hủy: ',
                                                            data: snapshot1
                                                                .data!
                                                                .dathanhly),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Khôi phục: ',
                                                            data: snapshot1
                                                                .data!
                                                                .khoiphucThanhlyFiber),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '- Ngưng PSC: ',
                                                            data: snapshot1
                                                                .data!
                                                                .dukienNgungpsc),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Khóa nợ cước: ',
                                                            data: snapshot1
                                                                .data!.fiberNo),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '- Tạm dừng: ',
                                                            data: snapshot1
                                                                .data!
                                                                .fiberTamngung),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         '- Thực tăng:  ',
                                                        //     data: snapshot1
                                                        //         .data!.ttFiber
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //   indexCount: true,
                                                        //   widget: Detail_Rows(
                                                        //       title:
                                                        //           'thanh lý : ',
                                                        //       data: snapshot1
                                                        //           .data!.ttFiber
                                                        //           .toString()),
                                                        // ),

                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Tỷ lệ ngưng PSC/PTM: ',
                                                            data:
                                                                '${snapshot1.data!.ngungPscPtm?.toStringAsFixed(2)}%'),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '- Tỷ lệ ngưng PSC/PSC: ',
                                                            data:
                                                                '${snapshot1.data!.ngungPscPsc?.toStringAsFixed(2)}%'),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         '- Dự báo PSC(tháng N): ',
                                                        //     data: ""),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Ngày lấy dữ liệu: ',
                                                            data: DateFormat(
                                                                    'HH:mm dd/MM/yyyy')
                                                                .format(snapshot1
                                                                    .data!
                                                                    .ngayCapNhat!)),
                                                      ],
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            // selectedValueLoaiHinh.value
                                            //             .toString() ==
                                            //         "FiberMyTVMesh/CamCoDinh"
                                            //     ? DividerCusTom(title: "MyTV",)
                                            //     : SizedBox(),
                                            selectedValueLoaiHinh.value
                                                    .toString()
                                                    .contains("MyTV")
                                                ? SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        DividerCusTom(
                                                            title: "MyTV"),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '- Dự báo PSC:  ',
                                                            data: snapshot1
                                                                .data!
                                                                .dukienPscmytv),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Dự báo thực tăng:  ',
                                                            data: snapshot1
                                                                .data!
                                                                .dukienTtmytv),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title: '- PTM: ',
                                                            data: snapshot1
                                                                .data!.ptmmytv),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '     + Dùng thử: ',
                                                            data: snapshot1
                                                                .data!
                                                                .dungthumytv),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '     + Dùng thật: ',
                                                            data: snapshot1
                                                                .data!
                                                                .dungthatmytv),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '     + NVKD: ',
                                                            data: snapshot1
                                                                .data!
                                                                .nvkdmytv),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '     + NVKT: ',
                                                            data: snapshot1
                                                                .data!
                                                                .nvktmytv),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '     + Nhà mạng khác: ',
                                                            data: snapshot1
                                                                .data!.mkmytv),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title: '- Hủy: ',
                                                            data: snapshot1
                                                                .data!.huymytv),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Ngưng PSC : ',
                                                            data: snapshot1
                                                                .data!
                                                                .dukienngungpscmytv
                                                                .toString()),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '- Khóa nợ cước: ',
                                                            data: snapshot1
                                                                .data!
                                                                .khoanocuocmytv),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Tỷ lệ ngưng PSC/PTM:',
                                                            data:
                                                                '${snapshot1.data!.ngungPscPtmMytv!.toStringAsFixed(2)}%'),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '- Tỷ lệ ngưng PSC/PSC:',
                                                            data:
                                                                '${snapshot1.data!.ngungPscPscMytv!.toStringAsFixed(2)}%'),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Ngày lấy dữ liệu: ',
                                                            data: DateFormat(
                                                                    'HH:mm dd/MM/yyyy')
                                                                .format(snapshot1
                                                                    .data!
                                                                    .ngaycapnhatMytv!)),
                                                        // BorderBoxMyTV(
                                                        //   heightSize:320,
                                                        //   title: 'Tổng',
                                                        //   colorsBackground:
                                                        //       Card_colors_1,
                                                        //   widget: Column(
                                                        //     children: [

                                                        //     ],
                                                        //   ),
                                                        // ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        // BorderBoxMyTV(
                                                        //   heightSize: 200,
                                                        //   title: 'MyTV Box',
                                                        //   colorsBackground:
                                                        //       Card_colors_2,
                                                        //   widget:
                                                        //       Column(children: [
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             false,
                                                        //         title:
                                                        //             '- Dự báo PSC:  ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             true,
                                                        //         title:
                                                        //             '- Dự báo thực tăng:  ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             false,
                                                        //         title:
                                                        //             '- PTM: ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             true,
                                                        //         title:
                                                        //             '     + Dùng thật:  ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             false,
                                                        //         title:
                                                        //             '     + Dùng thử:  ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             true,
                                                        //         title:
                                                        //             '- Hủy: ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             false,
                                                        //         title:
                                                        //             '- Ngưng PSC: ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             true,
                                                        //         title:
                                                        //             '- Khóa nợ cước: ',
                                                        //         data: ""),
                                                        //   ]),
                                                        // ),
                                                        // const SizedBox(
                                                        //   height: 10,
                                                        // ),
                                                        // BorderBoxMyTV(
                                                        //   heightSize: 200,
                                                        //   title: 'MyTV App',
                                                        //   colorsBackground:
                                                        //       Card_colors_1,
                                                        //   widget:
                                                        //       Column(children: [
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             true,
                                                        //         title:
                                                        //             '- Dự báo PSC:  ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             false,
                                                        //         title:
                                                        //             '- Dự báo thực tăng:  ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             true,
                                                        //         title:
                                                        //             '- PTM: ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             false,
                                                        //         title:
                                                        //             '     + Dùng thử:  ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             true,
                                                        //         title:
                                                        //             '     + Dùng thật:  ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             false,
                                                        //         title:
                                                        //             '- Hủy: ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             true,
                                                        //         title:
                                                        //             '- Ngưng PSC: ',
                                                        //         data: ""),
                                                        //     Custom_Data_Rows_Color_SmallData(
                                                        //         indexCount:
                                                        //             false,
                                                        //         title:
                                                        //             '- Khóa nợ cước:  ',
                                                        //         data: ""),
                                                        //   ]),
                                                        // ),

                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'Box PSC(Tháng N-1):  ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .pscMytvBox
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'App PSC(Tháng N-1):  ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .pscMytvApp
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title: 'Box PTM: ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .ptmMytvBox
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title: 'App PTM: ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .ptmMytvApp
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'PTM dùng thử: ',
                                                        //     data: widget
                                                        //         .tamDungThanhLyPtm
                                                        //         .ptmDungthuMytv
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'PTM dùng thật: ',
                                                        //     data: widget
                                                        //         .tamDungThanhLyPtm
                                                        //         .ptmDungthatMytv
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title: 'PTM NVKD: ',
                                                        //     data: widget
                                                        //         .tamDungThanhLyPtm
                                                        //         .ptmKinhdoanhMytv
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title: 'PTM NVKT: ',
                                                        //     data: widget
                                                        //         .tamDungThanhLyPtm
                                                        //         .ptmKythuatMytv
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'PTM mạng khác: ',
                                                        //     data: widget
                                                        //         .tamDungThanhLyPtm
                                                        //         .ptmMytvMk
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'PTM - hiện hữu: ',
                                                        //     data: widget
                                                        //         .tamDungThanhLyPtm
                                                        //         .ptmMytvFiberHh
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'PTM - PTM: ',
                                                        //     data: widget
                                                        //         .tamDungThanhLyPtm
                                                        //         .ptmMytvFiberPtm
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title: 'Tạm dừng: ',
                                                        //     data: widget
                                                        //         .tamDungThanhLyPtm
                                                        //         .mytvTamdung
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'Box thanh lý, hủy: ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .thanhlyMytvbox
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'App thanh lý, hủy: ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .thanhlyMytvapp
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'thanh lý, hủy: ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .thanhlyMytv
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'Khóa nợ cước: ',
                                                        //     data: ""),
                                                        // //  Custom_Data_Rows_Color_SmallData(
                                                        // //   indexCount: false,
                                                        // //   widget: Detail_Rows(
                                                        // //       title:
                                                        // //           'thanh lý, hủy: ',
                                                        // //       data: widget
                                                        // //           .tamDungThanhLyPtm
                                                        // //           .mytvThanhly
                                                        // //           .toString()),
                                                        // // ),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'Box ngưng PSC: ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .ngungPscMytvBox
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'App ngưng PSC: ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .ngungPscMytvApp
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'Khôi phục: ',
                                                        //     data: widget
                                                        //         .tamDungThanhLyPtm
                                                        //         .khoiphucMytv
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'App thực tăng: ',
                                                        //     data: snapshot1
                                                        //         .data!.ttMytvApp
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'Box thực tăng: ',
                                                        //     data: snapshot1
                                                        //         .data!.ttMytvBox
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'Dự báo PSC(Tháng N):',
                                                        //     data: ""),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title: 'Tổng PTM: ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .ptmMytvTong
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'Tổng MyTV thực tăng: ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .ttMytvTong
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'Tổng MyTV ngưng PSC cước: ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .ngungPscMytvTong
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'Tổng MyTV PSC: ',
                                                        //     data: snapshot1
                                                        //         .data!
                                                        //         .pscMytvTong
                                                        //         .toString()),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'Tỷ lệ ngưng PSC/PTM:',
                                                        //     data:
                                                        //         "${chia2SoInt(snapshot1.data!.ngungPscMytvTong, snapshot1.data!.ptmMytvTong).toStringAsFixed(2)}%"),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: false,
                                                        //     title:
                                                        //         'Tỷ lệ ngưng PSC/PSC:',
                                                        //     data:
                                                        //         "${chia2SoInt(snapshot1.data!.ngungPscMytvTong, snapshot1.data!.pscMytvTong).toStringAsFixed(2)}%"),
                                                        // Custom_Data_Rows_Color_SmallData(
                                                        //     indexCount: true,
                                                        //     title:
                                                        //         'Ngày lấy dữ liệu: ',
                                                        //     data: DateFormat(
                                                        //                     'HH:mm dd/MM/yyyy')
                                                        //                 .format(soSanh3DateTime(
                                                        //                     snapshot1
                                                        //                         .data!.ngayCapNhat!,
                                                        //                     widget
                                                        //                         .tamDungThanhLyPtm.ngayCapNhat!,
                                                        //                     widget
                                                        //                         .tamDungThanhLyPtm.ngayCapNhat2!))
                                                        //                 .toString() ==
                                                        //             "00:00 01/01/0001"
                                                        //         ? ""
                                                        //         : DateFormat(
                                                        //                 'HH:mm dd/MM/yyyy')
                                                        //             .format(soSanh3DateTime(
                                                        //                 snapshot1
                                                        //                     .data!
                                                        //                     .ngayCapNhat!,
                                                        //                 widget
                                                        //                     .tamDungThanhLyPtm
                                                        //                     .ngayCapNhat!,
                                                        //                 widget
                                                        //                     .tamDungThanhLyPtm
                                                        //                     .ngayCapNhat2!))
                                                        //             .toString()),
                                                      ],
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            // selectedValueLoaiHinh.value
                                            //             .toString() ==
                                            //         "FiberMyTVMesh/CamCoDinh"
                                            //     ? DividerCusTom(title: "Mesh/Cam",)
                                            //     : SizedBox(),
                                            selectedValueLoaiHinh.value
                                                    .toString()
                                                    .contains("Mesh/Cam")
                                                ? SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        DividerCusTom(
                                                          title: "Mesh/Cam",
                                                        ),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Mesh PTM : ',
                                                            data: snapshot1
                                                                .data!
                                                                .tongPtmMesh),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '- Camera PTM : ',
                                                            data: snapshot1
                                                                .data!
                                                                .tongPtmCam),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Mesh tạm dừng: ',
                                                            data: snapshot1
                                                                .data!
                                                                .meshTamdung),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '- Mesh thanh lý: ',
                                                            data: snapshot1
                                                                .data!
                                                                .meshThanhly),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Camera tạm dừng: ',
                                                            data: ""),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: true,
                                                            title:
                                                                '- Camera thanh lý: ',
                                                            data: ""),
                                                        Custom_Data_Rows_Color_SmallData(
                                                            indexCount: false,
                                                            title:
                                                                '- Ngày lấy dữ liệu : ',
                                                            data: DateFormat(
                                                                    'HH:mm dd/MM/yyyy')
                                                                .format(snapshot1
                                                                    .data!
                                                                    .ngayCapNhat!)),
                                                      ],
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            // selectedValueLoaiHinh.value
                                            //             .toString() ==
                                            //         "FiberMyTVMesh/CamCoDinh"
                                            //     ? DividerCusTom(title: "Cố định")
                                            //     : SizedBox(),
                                            // selectedValueLoaiHinh.value
                                            //         .toString()
                                            //         .contains("CoDinh")
                                            //     ? SingleChildScrollView(
                                            //         child: Column(
                                            //           children: [
                                            //             DividerCusTom(
                                            //                 title: "Cố định"),
                                            //             Custom_Data_Rows_Color_SmallData(
                                            //                 indexCount: true,
                                            //                 title:
                                            //                     'Cố định tạm dừng: ',
                                            //                 data: widget
                                            //                     .tamDungThanhLyPtm
                                            //                     .codinhTamdung
                                            //                     .toString()),
                                            //             Custom_Data_Rows_Color_SmallData(
                                            //                 indexCount: false,
                                            //                 title:
                                            //                     'Cố định thanh lý: ',
                                            //                 data: widget
                                            //                     .tamDungThanhLyPtm
                                            //                     .codinhThanhly
                                            //                     .toString()),
                                            //             Custom_Data_Rows_Color_SmallData(
                                            //                 indexCount: true,
                                            //                 title:
                                            //                     'Ngày lấy dữ liệu : ',
                                            //                 data: DateFormat(
                                            //                                 'HH:mm dd/MM/yyyy')
                                            //                             .format(widget
                                            //                                 .tamDungThanhLyPtm
                                            //                                 .ngayCapNhat!)
                                            //                             .toString() ==
                                            //                         "00:00 01/01/0001"
                                            //                     ? ""
                                            //                     : DateFormat(
                                            //                             'HH:mm dd/MM/yyyy')
                                            //                         .format(widget
                                            //                             .tamDungThanhLyPtm
                                            //                             .ngayCapNhat!)
                                            //                         .toString()),
                                            //           ],
                                            //         ),
                                            //       )
                                            //     : SizedBox()
                                            //ngày cập nhật fiber
                                          ],
                                        );
                                      })))
                              : const Text(
                                  "Lỗi xác thực vui lòng đăng nhập lại"));
                      // } else {
                      //   return LoadingScreen(
                      //       nameOfLoadingScreen: "Đang tải dữ liệu");
                      // }
                    });
              } else {
                return LoadingScreen(nameOfLoadingScreen: "Đang kiểm tra mạng");
              }
            }));
  }
}

class DividerCusTom extends StatelessWidget {
  DividerCusTom({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class BorderBoxMyTV extends StatelessWidget {
  BorderBoxMyTV(
      {super.key,
      required this.widget,
      required this.title,
      required this.colorsBackground,
      required this.heightSize});
  Widget widget;
  String title;
  Color colorsBackground;
  double heightSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: heightSize + 20,
            child: Stack(alignment: Alignment.center, children: [
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.black), // Đường viền màu đen
                    color: colorsBackground,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                height: heightSize,
                // color: const Color.fromARGB(255, 255, 229, 229),
              ),
              Positioned(
                top: -10.0,
                child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    color: Colors.white, // Màu nền để che đè lên đường kẻ
                    child: Container(
                      height: 25,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(
                        '   $title   ',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    )),
              ),
              // Expanded(
              //     child: Positioned(
              //   child: Padding(padding: const EdgeInsets.all(8), child: widget),
              // )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 8, right: 8),
                      child: widget)),
            ])),
      ],
    );
  }
}

int? sumTwoNumbers(int? a, int? b) {
  // Sử dụng null-aware operator ?? để xác định giá trị mặc định là 0 nếu a hoặc b là null.
  return (a ?? 0) + (b ?? 0);
}
