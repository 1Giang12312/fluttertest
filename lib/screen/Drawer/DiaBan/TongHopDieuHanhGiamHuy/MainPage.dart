import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_MonthYearPicker.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/FiberDieuHanhGiamHuy.dart';
import 'package:vnptapp/Models/MyTvFiberDieuHanhGiamHuyC2.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/TongHopDieuHanhGiamHuy/Logic.dart';

class TongHopDieuHanhGiamHuy_MainPage extends StatefulWidget {
  const TongHopDieuHanhGiamHuy_MainPage({super.key});

  @override
  State<TongHopDieuHanhGiamHuy_MainPage> createState() =>
      _TongHopDieuHanhGiamHuy_MainPageState();
}

var selectedC2C3 = StateProvider<dynamic>((ref) => null);
var selectedLoaiHinh = StateProvider<dynamic>((ref) => null);
var selectedPTMPSC = StateProvider<dynamic>((ref) => null);

class DropdownItem {
  final String value;
  final String label;
  DropdownItem(this.value, this.label);
}

List<DropdownItem> dropdownItems = [
  DropdownItem('c2', 'C2'),
  // DropdownItem('CoDinh', 'Cố định'),
  DropdownItem('c3', 'C3'),
];
DropdownItem? selectedValue;
List<DropdownItem> dropdownItems1 = [
  DropdownItem('Fiber', 'Fiber(BRCĐ)'),
  DropdownItem('MyTV', 'MyTV'),
  DropdownItem('Mesh/Cam', 'Mesh/Cam'),
];
List<DropdownItem> dropdownItems2 = [
  DropdownItem('PTM', 'PTM'),
  // DropdownItem('CoDinh', 'Cố định'),
  DropdownItem('PSC', 'PSC'),
];

class _TongHopDieuHanhGiamHuy_MainPageState
    extends State<TongHopDieuHanhGiamHuy_MainPage> {
  Future<void> refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  List list3 = [
    "An Phú",
    "Châu Đốc",
    "Châu Phú",
    "Châu Thành",
    "Chợ Mới",
    "Long Xuyên",
    "Phú Tân",
    "Tân Châu",
    "Thoại Sơn",
    "Tịnh Biên",
    "Tri Tôn"
  ];
  int pageNumber = 1;
  int pageSize = 45;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(
          title: 'Tổng hợp điều hành giảm hủy',
        ),
        body: RefreshIndicator(
            onRefresh: refresh,
            child: Consumer(builder: (context, ref, child) {
              var selectedValuePTMPSC = ref.watch(selectedPTMPSC);
              var selectedValueC2C3 = ref.watch(selectedC2C3);
              var selectedValueLoaiHinh = ref.watch(selectedLoaiHinh);
              var selectedMonth =
                  ref.watch(riverpod_instance.selectedMonthMonthYearPicker);
              var selectedYear =
                  ref.watch(riverpod_instance.selectedYearMonthYearPicker);
              selectedValueC2C3 == null
                  ? selectedValueC2C3 = dropdownItems[0]
                  : selectedValueC2C3 = selectedValueC2C3;
              selectedValueLoaiHinh == null
                  ? selectedValueLoaiHinh = dropdownItems1[0]
                  : selectedValueLoaiHinh = selectedValueLoaiHinh;
              selectedValuePTMPSC == null
                  ? selectedValuePTMPSC = dropdownItems2[0]
                  : selectedValuePTMPSC == selectedValuePTMPSC;
              return Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  DropdownButton<DropdownItem>(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    value: selectedValueC2C3,
                                    onChanged: (newValue) {
                                      ref.read(selectedC2C3.notifier).state =
                                          newValue!;
                                    },
                                    items: dropdownItems
                                        .map<DropdownMenuItem<DropdownItem>>(
                                            (DropdownItem item) {
                                      return DropdownMenuItem<DropdownItem>(
                                        value: item,
                                        child: Text(item.label),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  DropdownButton<DropdownItem>(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    value: selectedValueLoaiHinh,
                                    onChanged: (newValue) {
                                      ref
                                          .read(selectedLoaiHinh.notifier)
                                          .state = newValue!;
                                    },
                                    items: dropdownItems1
                                        .map<DropdownMenuItem<DropdownItem>>(
                                            (DropdownItem item) {
                                      return DropdownMenuItem<DropdownItem>(
                                        value: item,
                                        child: Text(item.label),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  DropdownButton<DropdownItem>(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    value: selectedValuePTMPSC,
                                    onChanged: (newValue) {
                                      ref.read(selectedPTMPSC.notifier).state =
                                          newValue!;
                                    },
                                    items: dropdownItems2
                                        .map<DropdownMenuItem<DropdownItem>>(
                                            (DropdownItem item) {
                                      return DropdownMenuItem<DropdownItem>(
                                        value: item,
                                        child: Text(item.label),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                              Custom_MonthYearPicker(),
                              FutureBuilder(
                                  future: Future.delayed(
                                      Duration(seconds: awaitTime),
                                      () => checkLocalConnectionApi()),
                                  builder: (context, snapshot1) {
                                    if (snapshot1.connectionState !=
                                            ConnectionState.waiting &&
                                        snapshot1.data != null) {
                                      if (selectedValueC2C3.value == "c2") {
                                        if (selectedValueLoaiHinh.value ==
                                            "Fiber") {
                                          return FutureBuilder<
                                                  List<
                                                      MyTvFiberDieuHanhGiamHuyC2>>(
                                              future: fiberDHGHc2(
                                                '$selectedYear${selectedMonth}01',
                                                snapshot1.data!,
                                                localNhanVien
                                                    .nhanvien_manv_thns!,
                                                localNhanVien.nhanvien_donvi
                                                    .toString(),
                                              ),
                                              builder: (context, snapshot3) {
                                                return Custom_FutureBuilder(
                                                    contextParam: context,
                                                    snapshot: snapshot3,
                                                    widgetParam: snapshot3
                                                            .hasData
                                                        ? snapshot3.data!
                                                                    .isEmpty ||
                                                                snapshot3
                                                                        .data ==
                                                                    []
                                                            ? Text(
                                                                "Không có dữ liệu tháng $selectedMonth năm $selectedYear")
                                                            : Container(
                                                                child: selectedValuePTMPSC
                                                                            .value ==
                                                                        "PTM"
                                                                    ? Row(
                                                                        children: [
                                                                          SizedBox(
                                                                              width: 100,
                                                                              child: tableCustom(list: list3, headerTitle: "Địa bàn C2")),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomPTMFiberC2(
                                                                                headerTitle: "PTM",
                                                                                list: snapshot3.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomNgungPscFiberC2(
                                                                                headerTitle: "Ngưng PSC",
                                                                                list: snapshot3.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomTTFiberC2(
                                                                                headerTitle: "TT",
                                                                                list: snapshot3.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 60,
                                                                              child: tableCustomNgungPscPtmFiberC2(
                                                                                headerTitle: "Ngưng PSC/PTM",
                                                                                list: snapshot3.data!,
                                                                              ))
                                                                        ],
                                                                      )
                                                                    : Row(
                                                                        children: [
                                                                          SizedBox(
                                                                              width: 100,
                                                                              child: tableCustom(list: list3, headerTitle: "Địa bàn C2")),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomPscFiberC2(
                                                                                headerTitle: "PSC",
                                                                                list: snapshot3.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomNgungPscFiberC2(
                                                                                headerTitle: "Ngưng PSC",
                                                                                list: snapshot3.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomHuyFiberC2(
                                                                                headerTitle: "Hủy",
                                                                                list: snapshot3.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomNgungPscPscFiberC2(
                                                                                headerTitle: "Ngưng PSC/PSC",
                                                                                list: snapshot3.data!,
                                                                              ))
                                                                        ],
                                                                      ))
                                                        : const Text(
                                                            'Lỗi không xác định vui lòng liên hệ phòng DHNV'));
                                              });
                                        } else if (selectedValueLoaiHinh
                                                .value ==
                                            "MyTV") {
                                          return FutureBuilder<
                                                  List<
                                                      MyTvFiberDieuHanhGiamHuyC2>>(
                                              future: myTVDHGHc2(
                                                '$selectedYear${selectedMonth}01',
                                                snapshot1.data!,
                                                localNhanVien
                                                    .nhanvien_manv_thns!,
                                                localNhanVien.nhanvien_donvi
                                                    .toString(),
                                              ),
                                              builder: (context, snapshot4) {
                                                return Custom_FutureBuilder(
                                                    contextParam: context,
                                                    snapshot: snapshot4,
                                                    widgetParam: snapshot4
                                                            .hasData
                                                        ? Container(
                                                            child: selectedValuePTMPSC
                                                                        .value ==
                                                                    "PTM"
                                                                ? Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              100,
                                                                          child: tableCustom(
                                                                              list: list3,
                                                                              headerTitle: "Địa bàn C2")),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              tableCustomPTMFiberC2(
                                                                            headerTitle:
                                                                                "PTM",
                                                                            list:
                                                                                snapshot4.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              tableCustomNgungPscFiberC2(
                                                                            headerTitle:
                                                                                "Ngưng PSC",
                                                                            list:
                                                                                snapshot4.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              tableCustomTTFiberC2(
                                                                            headerTitle:
                                                                                "TT",
                                                                            list:
                                                                                snapshot4.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              60,
                                                                          child:
                                                                              tableCustomNgungPscPtmFiberC2(
                                                                            headerTitle:
                                                                                "Ngưng PSC/PTM",
                                                                            list:
                                                                                snapshot4.data!,
                                                                          ))
                                                                    ],
                                                                  )
                                                                : Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              100,
                                                                          child: tableCustom(
                                                                              list: list3,
                                                                              headerTitle: "Địa bàn C2")),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              tableCustomPscFiberC2(
                                                                            headerTitle:
                                                                                "PSC",
                                                                            list:
                                                                                snapshot4.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              tableCustomNgungPscFiberC2(
                                                                            headerTitle:
                                                                                "Ngưng PSC",
                                                                            list:
                                                                                snapshot4.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              tableCustomHuyFiberC2(
                                                                            headerTitle:
                                                                                "Hủy",
                                                                            list:
                                                                                snapshot4.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              tableCustomNgungPscPscFiberC2(
                                                                            headerTitle:
                                                                                "Ngưng PSC/PSC",
                                                                            list:
                                                                                snapshot4.data!,
                                                                          ))
                                                                    ],
                                                                  ))
                                                        : Text('c'));
                                              });
                                        } else {
                                          return FutureBuilder<
                                                  List<
                                                      MyTvFiberDieuHanhGiamHuyC2>>(
                                              future: fiberDHGHc2(
                                                '$selectedYear${selectedMonth}01',
                                                snapshot1.data!,
                                                localNhanVien
                                                    .nhanvien_manv_thns!,
                                                localNhanVien.nhanvien_donvi
                                                    .toString(),
                                              ),
                                              builder: (context, snapshot6) {
                                                return Custom_FutureBuilder(
                                                    contextParam: context,
                                                    snapshot: snapshot6,
                                                    widgetParam: snapshot6
                                                            .hasData
                                                        ? Container(
                                                            child: selectedValuePTMPSC
                                                                        .value ==
                                                                    "PTM"
                                                                ? Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              100,
                                                                          child: tableCustom(
                                                                              list: list3,
                                                                              headerTitle: "Địa bàn C2")),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              _tableCustomPtmMeshCamC2(
                                                                            headerTitle:
                                                                                "PTM",
                                                                            list:
                                                                                snapshot6.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              _tableCustomNgungPscMeshCamC2(
                                                                            headerTitle:
                                                                                "Ngưng PSC",
                                                                            list:
                                                                                snapshot6.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              _tableCustomTTMeshCamC2(
                                                                            headerTitle:
                                                                                "TT",
                                                                            list:
                                                                                snapshot6.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              60,
                                                                          child:
                                                                              _tableCustomNgungPscPtmMeshCamC2(
                                                                            headerTitle:
                                                                                "Ngưng PSC/PTM",
                                                                            list:
                                                                                snapshot6.data!,
                                                                          ))
                                                                    ],
                                                                  )
                                                                : Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              100,
                                                                          child: tableCustom(
                                                                              list: list3,
                                                                              headerTitle: "Địa bàn C2")),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              _tableCustomPscMeshCamC2(
                                                                            headerTitle:
                                                                                "PSC",
                                                                            list:
                                                                                snapshot6.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              _tableCustomNgungPscMeshCamC2(
                                                                            headerTitle:
                                                                                "Ngưng PSC",
                                                                            list:
                                                                                snapshot6.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              _tableCustomHuyMeshCamC2(
                                                                            headerTitle:
                                                                                "Hủy",
                                                                            list:
                                                                                snapshot6.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              50,
                                                                          child:
                                                                              _tableCustomNgungPscPscMeshCamC2(
                                                                            headerTitle:
                                                                                "Ngưng PSC/PSC",
                                                                            list:
                                                                                snapshot6.data!,
                                                                          ))
                                                                    ],
                                                                  ))
                                                        //  Container(
                                                        //     child: Row(
                                                        //     children: [
                                                        //       SizedBox(
                                                        //           width: 100,
                                                        //           child: tableCustom(
                                                        //               list:
                                                        //                   list3,
                                                        //               headerTitle:
                                                        //                   "Địa bàn C2")),
                                                        //       SizedBox(
                                                        //           width: 50,
                                                        //           child:
                                                        //               _tableCustomPtmMeshCamC2(
                                                        //             headerTitle:
                                                        //                 "PTM",
                                                        //             list: snapshot6
                                                        //                 .data!,
                                                        //           )),
                                                        //     ],
                                                        //   ))

                                                        : const Text(
                                                            'Lỗi không xác định vui lòng liên hệ phòng DHNV'));
                                              });
                                        }
                                      } else {
                                        if (selectedValueLoaiHinh.value ==
                                            "Fiber") {
                                          return FutureBuilder<
                                                  List<FiberDieuHanhGiamHuy>>(
                                              future: fiberDHGHc3(
                                                '$selectedYear${selectedMonth}01',
                                                snapshot1.data!,
                                                localNhanVien
                                                    .nhanvien_manv_thns!,
                                                localNhanVien.nhanvien_donvi
                                                    .toString(),
                                              ),
                                              builder: (context, snapshot4) {
                                                return Custom_FutureBuilder(
                                                    contextParam: context,
                                                    snapshot: snapshot4,
                                                    widgetParam: snapshot4
                                                            .hasData
                                                        ? snapshot4
                                                                .data!.isEmpty
                                                            ? Text(
                                                                "Không có dữ liệu tháng $selectedMonth năm $selectedYear")
                                                            : Container(
                                                                child: selectedValuePTMPSC
                                                                            .value ==
                                                                        "PTM"
                                                                    ? Row(
                                                                        children: [
                                                                          listTenC2(
                                                                              list: snapshot4.data!),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomPTMFiber(
                                                                                headerTitle: "PTM",
                                                                                list: snapshot4.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomNgungPSCFiber(
                                                                                headerTitle: "Ngưng PSC",
                                                                                list: snapshot4.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomTTFiber(
                                                                                headerTitle: "TT",
                                                                                list: snapshot4.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 60,
                                                                              child: tableCustomNgungPSC_PTMFiber(
                                                                                headerTitle: "Ngưng PSC/PTM",
                                                                                list: snapshot4.data!,
                                                                              ))
                                                                        ],
                                                                      )
                                                                    : Row(
                                                                        children: [
                                                                          listTenC2(
                                                                              list: snapshot4.data!),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomPSCFiber(
                                                                                headerTitle: "PSC",
                                                                                list: snapshot4.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomNgungPSCFiber(
                                                                                headerTitle: "Ngưng PSC",
                                                                                list: snapshot4.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomHuyFiber(
                                                                                headerTitle: "Hủy",
                                                                                list: snapshot4.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomNgungPSC_PSCFiber(
                                                                                headerTitle: "Ngưng PSC/PSC",
                                                                                list: snapshot4.data!,
                                                                              )),
                                                                        ],
                                                                      ))
                                                        : const Text(
                                                            'Lỗi không xác định vui lòng liên hệ phòng DHNV'));
                                              });
                                        } else if (selectedValueLoaiHinh
                                                .value ==
                                            "MyTV") {
                                          return FutureBuilder(
                                              future: myTVDHGHc3(
                                                '$selectedYear${selectedMonth}01',
                                                snapshot1.data!,
                                                localNhanVien
                                                    .nhanvien_manv_thns!,
                                                localNhanVien.nhanvien_donvi
                                                    .toString(),
                                              ),
                                              builder: (context, snapshot5) {
                                                return Custom_FutureBuilder(
                                                    contextParam: context,
                                                    snapshot: snapshot5,
                                                    widgetParam: snapshot5
                                                            .hasData
                                                        ? snapshot5
                                                                .data!.isEmpty
                                                            ? Text(
                                                                "Không có dữ liệu tháng $selectedMonth năm $selectedYear")
                                                            : Container(
                                                                child: selectedValuePTMPSC
                                                                            .value ==
                                                                        "PTM"
                                                                    ? Row(
                                                                        children: [
                                                                          listTenC2(
                                                                              list: snapshot5.data!),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomPTMFiber(
                                                                                headerTitle: "PTM",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomNgungPSCFiber(
                                                                                headerTitle: "Ngưng PSC",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomTTFiber(
                                                                                headerTitle: "TT",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 60,
                                                                              child: tableCustomNgungPSC_PTMFiber(
                                                                                headerTitle: "Ngưng PSC/PTM",
                                                                                list: snapshot5.data!,
                                                                              ))
                                                                        ],
                                                                      )
                                                                    : Row(
                                                                        children: [
                                                                          listTenC2(
                                                                              list: snapshot5.data!),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomPSCFiber(
                                                                                headerTitle: "PSC",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomNgungPSCFiber(
                                                                                headerTitle: "Ngưng PSC",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomHuyFiber(
                                                                                headerTitle: "Hủy",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomNgungPSC_PSCFiber(
                                                                                headerTitle: "Ngưng PSC/PSC",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                        ],
                                                                      ))
                                                        : const Text(
                                                            'Lỗi không xác định vui lòng liên hệ phòng DHNV'));
                                              });
                                        } else {
                                          return FutureBuilder(
                                              future: fiberDHGHc3(
                                                '$selectedYear${selectedMonth}01',
                                                snapshot1.data!,
                                                localNhanVien
                                                    .nhanvien_manv_thns!,
                                                localNhanVien.nhanvien_donvi
                                                    .toString(),
                                              ),
                                              builder: (context, snapshot5) {
                                                return Custom_FutureBuilder(
                                                    contextParam: context,
                                                    snapshot: snapshot5,
                                                    widgetParam: snapshot5
                                                            .hasData
                                                        ? snapshot5
                                                                .data!.isEmpty
                                                            ? Text(
                                                                "Không có dữ liệu tháng $selectedMonth năm $selectedYear")
                                                            :
                                                            // Container(
                                                            //     child: Row(
                                                            //     children: [
                                                            //       listTenC2(
                                                            //           list: snapshot5
                                                            //               .data!),
                                                            //       SizedBox(
                                                            //           width: 50,
                                                            //           child:
                                                            //               tableCustomPTMMesh(
                                                            //             headerTitle:
                                                            //                 "PTM",
                                                            //             list: snapshot5
                                                            //                 .data!,
                                                            //           )),
                                                            //     ],
                                                            //   ))
                                                            Container(
                                                                child: selectedValuePTMPSC
                                                                            .value ==
                                                                        "PTM"
                                                                    ? Row(
                                                                        children: [
                                                                          listTenC2(
                                                                              list: snapshot5.data!),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: tableCustomPTMMeshC3(
                                                                                headerTitle: "PTM",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: _tableCustomNgungPscMeshCamC3(
                                                                                headerTitle: "Ngưng PSC",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: _tableCustomTTMeshCamC3(
                                                                                headerTitle: "TT",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 60,
                                                                              child: _tableCustomNgungPscPtmMeshCamC3(
                                                                                headerTitle: "Ngưng PSC/PTM",
                                                                                list: snapshot5.data!,
                                                                              ))
                                                                        ],
                                                                      )
                                                                    : Row(
                                                                        children: [
                                                                          listTenC2(
                                                                              list: snapshot5.data!),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: _tableCustomPscMeshCamC3(
                                                                                headerTitle: "PSC",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: _tableCustomNgungPscMeshCamC3(
                                                                                headerTitle: "Ngưng PSC",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: _tableCustomHuyMeshCamC3(
                                                                                headerTitle: "Hủy",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                          SizedBox(
                                                                              width: 50,
                                                                              child: _tableCustomNgungPscPscMeshCamC3(
                                                                                headerTitle: "Ngưng PSC/PSC",
                                                                                list: snapshot5.data!,
                                                                              )),
                                                                        ],
                                                                      ))
                                                        : const Text(
                                                            'Lỗi không xác định vui lòng liên hệ phòng DHNV'));
                                              });
                                        }
                                      }
                                    } else {
                                      return LoadingScreen(
                                        nameOfLoadingScreen:
                                            "Đang kiểm tra mạng..",
                                      );
                                    }
                                  }),
                              // FutureBuilder(
                              //     future: Future.delayed(
                              //         Duration(seconds: awaitTime),
                              //         () => checkLocalConnectionApi()),
                              //     builder: (context, snapshot1) {
                              //       if (snapshot1.connectionState !=
                              //               ConnectionState.waiting &&
                              //           snapshot1.data != null) {
                              //         return FutureBuilder<
                              //                 List<FiberDieuHanhGiamHuy>>(
                              //             future: fiberDHGHc3(
                              //               '$selectedYear${selectedMonth}01',
                              //               snapshot1.data!,
                              //               localNhanVien.nhanvien_manv_thns!,
                              //               localNhanVien.nhanvien_donvi
                              //                   .toString(),
                              //             ),
                              //             builder: (context, snapshot3) {
                              //               return Custom_FutureBuilder(
                              //                   contextParam: context,
                              //                   snapshot: snapshot3,
                              //                   widgetParam: snapshot3.hasData
                              //                       ? FutureBuilder(
                              //                           future: myTVDHGHc3(
                              //                             '$selectedYear${selectedMonth}01',
                              //                             snapshot1.data!,
                              //                             localNhanVien
                              //                                 .nhanvien_manv_thns!,
                              //                             localNhanVien
                              //                                 .nhanvien_donvi
                              //                                 .toString(),
                              //                           ),
                              //                           builder: (context,
                              //                               snapshot4) {
                              //                             return Custom_FutureBuilder(
                              //                                 snapshot:
                              //                                     snapshot4,
                              //                                 contextParam:
                              //                                     context,
                              //                                 widgetParam: snapshot4
                              //                                         .hasData
                              //                                     ? SingleChildScrollView(
                              //                                         scrollDirection:
                              //                                             Axis.horizontal,
                              //                                         child: SingleChildScrollView(
                              //                                             scrollDirection: Axis.vertical,
                              //                                             child: Padding(
                              //                                                 padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                              //                                                 child: Container(
                              //                                                   width: 370,
                              //                                                   child: Column(
                              //                                                     children: [
                              //                                                       snapshot3.data!.isEmpty
                              //                                                           ? Text("Chưa có dữ liệu tháng $selectedMonth $selectedYear")
                              //                                                           : Container(
                              //                                                               child: selectedValueC2C3.value == "c2"
                              //                                                                   ? SingleChildScrollView(
                              //                                                                       scrollDirection: Axis.vertical,
                              //                                                                       child: Row(
                              //                                                                         mainAxisAlignment: MainAxisAlignment.start,
                              //                                                                         children: [
                              //                                                                           SizedBox(width: 100, child: tableCustom(list: list3, headerTitle: "Địa bàn C2")),
                              //                                                                           selectedValuePTMPSC.value == "PTM"
                              //                                                                               ? Row(
                              //                                                                                   children: [
                              //                                                                                     SizedBox(
                              //                                                                                         width: 50,
                              //                                                                                         child: tableCustom(
                              //                                                                                           headerTitle: "PTM",
                              //                                                                                           list: list2,
                              //                                                                                         )),
                              //                                                                                     SizedBox(
                              //                                                                                         width: 50,
                              //                                                                                         child: tableCustom(
                              //                                                                                           headerTitle: "Ngưng PSC",
                              //                                                                                           list: list2,
                              //                                                                                         )),
                              //                                                                                     SizedBox(
                              //                                                                                         width: 50,
                              //                                                                                         child: tableCustom(
                              //                                                                                           headerTitle: "TT",
                              //                                                                                           list: list2,
                              //                                                                                         )),
                              //                                                                                     SizedBox(
                              //                                                                                         width: 50,
                              //                                                                                         child: tableCustom(
                              //                                                                                           headerTitle: "Ngưng PSC/PTM",
                              //                                                                                           list: list2,
                              //                                                                                         ))
                              //                                                                                   ],
                              //                                                                                 )
                              //                                                                               : Row(
                              //                                                                                   children: [
                              //                                                                                     SizedBox(
                              //                                                                                         width: 50,
                              //                                                                                         child: tableCustom(
                              //                                                                                           headerTitle: "PSC",
                              //                                                                                           list: list2,
                              //                                                                                         )),
                              //                                                                                     SizedBox(
                              //                                                                                         width: 50,
                              //                                                                                         child: tableCustom(
                              //                                                                                           headerTitle: "Ngưng PSC",
                              //                                                                                           list: list2,
                              //                                                                                         )),
                              //                                                                                     SizedBox(
                              //                                                                                         width: 50,
                              //                                                                                         child: tableCustom(
                              //                                                                                           headerTitle: "Hủy",
                              //                                                                                           list: list2,
                              //                                                                                         )),
                              //                                                                                     SizedBox(
                              //                                                                                         width: 50,
                              //                                                                                         child: tableCustom(
                              //                                                                                           headerTitle: "Ngưng PSC/PSC",
                              //                                                                                           list: list2,
                              //                                                                                         ))
                              //                                                                                   ],
                              //                                                                                 )
                              //                                                                         ],
                              //                                                                       ))
                              //                                                                   : SingleChildScrollView(
                              //                                                                       scrollDirection: Axis.vertical,
                              //                                                                       child: SizedBox(
                              //                                                                           child: Row(
                              //                                                                         mainAxisAlignment: MainAxisAlignment.start,
                              //                                                                         children: <Widget>[
                              //                                                                           SizedBox(width: 80, child: tableCustomTenC3(headerTitle: "Địa bàn C3", list: snapshot3.data!)),
                              //                                                                           SizedBox(
                              //                                                                             width: 80.0,
                              //                                                                             child: Table(
                              //                                                                               border: TableBorder.all(width: 1),
                              //                                                                               children: [
                              //                                                                                 TableRow(children: [
                              //                                                                                   headerRowCustom(
                              //                                                                                     title: "Địa bàn C2",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                                 TableRow(children: [
                              //                                                                                   tableMergeRowCustom(
                              //                                                                                     heightSize: 200,
                              //                                                                                     title: "An Phú",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                                 TableRow(children: [
                              //                                                                                   tableMergeRowCustom(
                              //                                                                                     heightSize: 200,
                              //                                                                                     title: "Châu Đốc",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                                 TableRow(children: [
                              //                                                                                   tableMergeRowCustom(
                              //                                                                                     heightSize: 200,
                              //                                                                                     title: "Châu Phú",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                                 TableRow(children: [
                              //                                                                                   tableMergeRowCustom(
                              //                                                                                     heightSize: 200,
                              //                                                                                     title: "Châu Thành",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                                 TableRow(children: [
                              //                                                                                   tableMergeRowCustom(
                              //                                                                                     heightSize: 200,
                              //                                                                                     title: "Chợ Mới",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                                 TableRow(children: [
                              //                                                                                   tableMergeRowCustom(
                              //                                                                                     heightSize: 300,
                              //                                                                                     title: "Long Xuyên",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                                 TableRow(children: [
                              //                                                                                   tableMergeRowCustom(
                              //                                                                                     heightSize: 200,
                              //                                                                                     title: "Phú Tân",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                                 TableRow(children: [
                              //                                                                                   tableMergeRowCustom(
                              //                                                                                     heightSize: 200,
                              //                                                                                     title: "Tân Châu",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                                 TableRow(children: [
                              //                                                                                   tableMergeRowCustom(
                              //                                                                                     heightSize: 200,
                              //                                                                                     title: "Thoại Sơn",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                                 TableRow(children: [
                              //                                                                                   tableMergeRowCustom(
                              //                                                                                     heightSize: 200,
                              //                                                                                     title: "Tịnh Biên",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                                 TableRow(children: [
                              //                                                                                   tableMergeRowCustom(
                              //                                                                                     heightSize: 150,
                              //                                                                                     title: "Tri Tôn",
                              //                                                                                   )
                              //                                                                                 ]),
                              //                                                                               ],
                              //                                                                             ),
                              //                                                                           ),
                              //                                                                           selectedValueLoaiHinh.value == "Fiber"
                              //                                                                               ? SizedBox(
                              //                                                                                   child: Row(
                              //                                                                                   children: [
                              //                                                                                     selectedValuePTMPSC.value == "PTM"
                              //                                                                                         ? Row(
                              //                                                                                             children: [
                              //                                                                                               SizedBox(
                              //                                                                                                   width: 50,
                              //                                                                                                   child: tableCustomPTMFiber(
                              //                                                                                                     headerTitle: "PTM",
                              //                                                                                                     list: snapshot3.data!,
                              //                                                                                                   )),
                              //                                                                                               SizedBox(
                              //                                                                                                   width: 50,
                              //                                                                                                   child: tableCustomNgungPSCFiber(
                              //                                                                                                     headerTitle: "Ngưng PSC",
                              //                                                                                                     list: snapshot3.data!,
                              //                                                                                                   )),
                              //                                                                                               SizedBox(
                              //                                                                                                   width: 50,
                              //                                                                                                   child: tableCustomTTFiber(
                              //                                                                                                     headerTitle: "TT",
                              //                                                                                                     list: snapshot3.data!,
                              //                                                                                                   )),
                              //                                                                                               SizedBox(
                              //                                                                                                   width: 60,
                              //                                                                                                   child: tableCustomNgungPSC_PTMFiber(
                              //                                                                                                     headerTitle: "Ngưng PSC/PTM",
                              //                                                                                                     list: snapshot3.data!,
                              //                                                                                                   ))
                              //                                                                                             ],
                              //                                                                                           )
                              //                                                                                         : Row(
                              //                                                                                             children: [
                              //                                                                                               SizedBox(
                              //                                                                                                   width: 50,
                              //                                                                                                   child: tableCustomPSCFiber(
                              //                                                                                                     headerTitle: "PSC",
                              //                                                                                                     list: snapshot3.data!,
                              //                                                                                                   )),
                              //                                                                                               SizedBox(
                              //                                                                                                   width: 50,
                              //                                                                                                   child: tableCustomNgungPSCFiber(
                              //                                                                                                     headerTitle: "Ngưng PSC",
                              //                                                                                                     list: snapshot3.data!,
                              //                                                                                                   )),
                              //                                                                                               SizedBox(
                              //                                                                                                   width: 50,
                              //                                                                                                   child: tableCustomHuyFiber(
                              //                                                                                                     headerTitle: "Hủy",
                              //                                                                                                     list: snapshot3.data!,
                              //                                                                                                   )),
                              //                                                                                               SizedBox(
                              //                                                                                                   width: 50,
                              //                                                                                                   child: tableCustomNgungPSC_PSCFiber(
                              //                                                                                                     headerTitle: "Ngưng PSC/PSC",
                              //                                                                                                     list: snapshot3.data!,
                              //                                                                                                   )),
                              //                                                                                             ],
                              //                                                                                           ),
                              //                                                                                   ],
                              //                                                                                 ))
                              //                                                                               : selectedValueLoaiHinh.value == "MyTV"
                              //                                                                                   ? SizedBox(
                              //                                                                                       child: Row(
                              //                                                                                       children: [
                              //                                                                                         selectedValuePTMPSC.value == "PTM"
                              //                                                                                             ? Row(
                              //                                                                                                 children: [
                              //                                                                                                   SizedBox(
                              //                                                                                                       width: 50,
                              //                                                                                                       child: tableCustomPTMFiber(
                              //                                                                                                         headerTitle: "PTM",
                              //                                                                                                         list: snapshot4.data!,
                              //                                                                                                       )),
                              //                                                                                                   SizedBox(
                              //                                                                                                       width: 50,
                              //                                                                                                       child: tableCustomNgungPSCFiber(
                              //                                                                                                         headerTitle: "Ngưng PSC",
                              //                                                                                                         list: snapshot4.data!,
                              //                                                                                                       )),
                              //                                                                                                   SizedBox(
                              //                                                                                                       width: 50,
                              //                                                                                                       child: tableCustomTTFiber(
                              //                                                                                                         headerTitle: "TT",
                              //                                                                                                         list: snapshot4.data!,
                              //                                                                                                       )),
                              //                                                                                                   SizedBox(
                              //                                                                                                       width: 60,
                              //                                                                                                       child: tableCustomNgungPSC_PTMFiber(
                              //                                                                                                         headerTitle: "Ngưng PSC/PTM",
                              //                                                                                                         list: snapshot4.data!,
                              //                                                                                                       ))
                              //                                                                                                 ],
                              //                                                                                               )
                              //                                                                                             : Row(
                              //                                                                                                 children: [
                              //                                                                                                   SizedBox(
                              //                                                                                                       width: 50,
                              //                                                                                                       child: tableCustomPSCFiber(
                              //                                                                                                         headerTitle: "PSC",
                              //                                                                                                         list: snapshot4.data!,
                              //                                                                                                       )),
                              //                                                                                                   SizedBox(
                              //                                                                                                       width: 50,
                              //                                                                                                       child: tableCustomNgungPSCFiber(
                              //                                                                                                         headerTitle: "Ngưng PSC",
                              //                                                                                                         list: snapshot4.data!,
                              //                                                                                                       )),
                              //                                                                                                   SizedBox(
                              //                                                                                                       width: 50,
                              //                                                                                                       child: tableCustomHuyFiber(
                              //                                                                                                         headerTitle: "Hủy",
                              //                                                                                                         list: snapshot4.data!,
                              //                                                                                                       )),
                              //                                                                                                   SizedBox(
                              //                                                                                                       width: 50,
                              //                                                                                                       child: tableCustomNgungPSC_PSCFiber(
                              //                                                                                                         headerTitle: "Ngưng PSC/PSC",
                              //                                                                                                         list: snapshot4.data!,
                              //                                                                                                       )),
                              //                                                                                                 ],
                              //                                                                                               ),
                              //                                                                                       ],
                              //                                                                                     ))
                              //                                                                                   : SizedBox(
                              //                                                                                       child: Row(
                              //                                                                                       children: [
                              //                                                                                         Row(
                              //                                                                                           children: [
                              //                                                                                             SizedBox(
                              //                                                                                                 width: 50,
                              //                                                                                                 child: tableCustomPTMMesh(
                              //                                                                                                   headerTitle: "PTM",
                              //                                                                                                   list: snapshot3.data!,
                              //                                                                                                 )),
                              //                                                                                           ],
                              //                                                                                         )
                              //                                                                                       ],
                              //                                                                                     ))
                              //                                                                         ],
                              //                                                                       ))))
                              //                                                     ],
                              //                                                   ),
                              //                                                 ))),
                              //                                       )
                              //                                     : Text(
                              //                                         'data'));
                              //                           })
                              //                       : Text('data'));
                              //             });
                              //       } else {
                              //         return Center(
                              //             child: LoadingScreen(
                              //                 nameOfLoadingScreen:
                              //                     'Đang kiểm tra mạng...'));
                              //       }
                              //     }),
                              // SizedBox(
                              //   height: 50,
                              //   child: TextField(
                              //     onChanged: (value) {
                              //       // setState(() {
                              //       //   searchKey = value;
                              //       //   //  print(searchKey);
                              //       // });
                              //       ref.read(searchKey.notifier).state = value!;
                              //     },
                              //     decoration: const InputDecoration(
                              //         hintText: 'Tìm kiếm(Theo tên c3)...',
                              //         prefixIcon: Icon(Icons.search),
                              //         border: OutlineInputBorder(
                              //             borderRadius:
                              //                 BorderRadius.all(Radius.circular(20)))),
                              //   ),
                              // ),
                            ],
                          ))));
            })));
  }
}

class listTenC2 extends StatelessWidget {
  listTenC2({super.key, required this.list});
  List list;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 80,
            child: tableCustomTenC3(headerTitle: "Địa bàn C3", list: list)),
        SizedBox(
          width: 80.0,
          child: Table(
            border: TableBorder.all(width: 1),
            children: [
              TableRow(children: [
                headerRowCustom(
                  title: "Địa bàn C2",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "An Phú",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Châu Đốc",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Châu Phú",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Châu Thành",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Chợ Mới",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 300,
                  title: "Long Xuyên",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Phú Tân",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Tân Châu",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Thoại Sơn",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Tịnh Biên",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 150,
                  title: "Tri Tôn",
                )
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

class tableMergeRowCustom extends StatelessWidget {
  tableMergeRowCustom({super.key, this.title, this.heightSize});
  String? title;
  double? heightSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: heightSize,
        child: Center(
          child: Text(title!),
        ));
  }
}

// class tableRowCustom extends StatelessWidget {
//   tableRowCustom({super.key, this.title});
//   String? title;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 50.0,
//         child: Center(
//           child: Text(title!),
//         ));
//   }
// }

class headerRowCustom extends StatelessWidget {
  headerRowCustom({super.key, this.title});
  String? title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60.0,
        child: Center(
          child: Text(title!),
        ));
  }
}

class tableCustom extends StatelessWidget {
  tableCustom({super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item),
                ))
          ]),
        // TableRow(children: [
        //   tableRowCustom(
        //     title: "Bình Khánh",
        //   )
        // ]),
        // TableRow(children: [
        //   tableRowCustom(
        //     title: "Mỹ Long",
        //   )
        // ]),
        // TableRow(children: [
        //   tableRowCustom(
        //     title: "Vàm Cống",
        //   )
        // ]),
        // TableRow(children: [
        //   tableRowCustom(
        //     title: "Mỹ Hòa",
        //   )
        // ]),
        // TableRow(children: [
        //   tableRowCustom(
        //     title: "Mỹ Hòa Hưng",
        //   )
        // ]),
      ],
    );
  }
}

class tableCustomTenC3 extends StatelessWidget {
  tableCustomTenC3({super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.tenKvC3.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomPTMFiber extends StatelessWidget {
  tableCustomPTMFiber(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.tongPtmdungthuDungthat.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomNgungPSCFiber extends StatelessWidget {
  tableCustomNgungPSCFiber(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.dukienNgungpsc.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomTTFiber extends StatelessWidget {
  tableCustomTTFiber(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.dukienThuctang.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomNgungPSC_PTMFiber extends StatelessWidget {
  tableCustomNgungPSC_PTMFiber(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.ngungPscPtm.toStringAsFixed(2) + "%"),
                ))
          ]),
      ],
    );
  }
}

class tableCustomPSCFiber extends StatelessWidget {
  tableCustomPSCFiber(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.dukienPsc.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomHuyFiber extends StatelessWidget {
  tableCustomHuyFiber(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.dathanhly.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomNgungPSC_PSCFiber extends StatelessWidget {
  tableCustomNgungPSC_PSCFiber(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.ngungPscPsc.toStringAsFixed(2) + "%"),
                ))
          ]),
      ],
    );
  }
}

class tableCustomPTMMeshC3 extends StatelessWidget {
  tableCustomPTMMeshC3(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.tongPtmMesh.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomPTMFiberC2 extends StatelessWidget {
  tableCustomPTMFiberC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.ptm.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomNgungPscFiberC2 extends StatelessWidget {
  tableCustomNgungPscFiberC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.ngungpsc.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomTTFiberC2 extends StatelessWidget {
  tableCustomTTFiberC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.thuctang.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomNgungPscPtmFiberC2 extends StatelessWidget {
  tableCustomNgungPscPtmFiberC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.ngungPscPtm.toStringAsFixed(2) + "%"),
                ))
          ]),
      ],
    );
  }
}

class tableCustomPscFiberC2 extends StatelessWidget {
  tableCustomPscFiberC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.psc.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomHuyFiberC2 extends StatelessWidget {
  tableCustomHuyFiberC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.huy.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomNgungPscPscFiberC2 extends StatelessWidget {
  tableCustomNgungPscPscFiberC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.ngungPscPsc.toStringAsFixed(2) + "%"),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomPtmMeshCamC3 extends StatelessWidget {
  _tableCustomPtmMeshCamC3(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.PtmMeshCam.toString()),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomNgungPscMeshCamC3 extends StatelessWidget {
  _tableCustomNgungPscMeshCamC3(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomTTMeshCamC3 extends StatelessWidget {
  _tableCustomTTMeshCamC3(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomNgungPscPtmMeshCamC3 extends StatelessWidget {
  _tableCustomNgungPscPtmMeshCamC3(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomPscMeshCamC3 extends StatelessWidget {
  _tableCustomPscMeshCamC3(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomHuyMeshCamC3 extends StatelessWidget {
  _tableCustomHuyMeshCamC3(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomNgungPscPscMeshCamC3 extends StatelessWidget {
  _tableCustomNgungPscPscMeshCamC3(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomPtmMeshCamC2 extends StatelessWidget {
  _tableCustomPtmMeshCamC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.PtmMeshCam.toString()),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomNgungPscMeshCamC2 extends StatelessWidget {
  _tableCustomNgungPscMeshCamC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomTTMeshCamC2 extends StatelessWidget {
  _tableCustomTTMeshCamC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomNgungPscPtmMeshCamC2 extends StatelessWidget {
  _tableCustomNgungPscPtmMeshCamC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomPscMeshCamC2 extends StatelessWidget {
  _tableCustomPscMeshCamC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
}

class _tableCustomHuyMeshCamC2 extends StatelessWidget {
  _tableCustomHuyMeshCamC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
} 
class _tableCustomNgungPscPscMeshCamC2 extends StatelessWidget {
  _tableCustomNgungPscPscMeshCamC2(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(""),
                ))
          ]),
      ],
    );
  }
}