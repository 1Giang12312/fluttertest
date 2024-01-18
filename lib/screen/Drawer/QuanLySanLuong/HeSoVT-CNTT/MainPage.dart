// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_DropdownDonVi.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_MonthYearPicker.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/HeSoVT-CNTT/Detail.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/HeSoVT-CNTT/Logic.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/HeSoVT-CNTT/Variable.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';

class HeSoVT_CNTT_MainPage extends StatefulWidget {
  const HeSoVT_CNTT_MainPage({super.key});
  @override
  State<HeSoVT_CNTT_MainPage> createState() => _HeSoVT_CNTT_MainPageState();
}

class _HeSoVT_CNTT_MainPageState extends State<HeSoVT_CNTT_MainPage> {
  // Hàm callback để cập nhật trạng thái của class cha
  void callbackFunc(String message) {
    setState(() {});
  }

  int pageNumber = 1;
  // ignore: prefer_typing_uninitialized_variables
  var selectedDonVi;
  String selectedYear = DateTime.now().year.toString();
  String selectedMonth = DateTime.now().month.toString();
  // ignore: prefer_typing_uninitialized_variables
  var selectedDate;
  String convertMonth(int month) {
    if (month < 10) {
      return '0${month.toString()}';
    } else {
      return month.toString();
    }
  }

  int selectedRow =
      -1; // Hàng đang được chọn, -1 là không có hàng nào được chọn ban đầu
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> refresh() async {
      setState(() {});
    }

    return Scaffold(
        appBar: Custom_AppBar(title: 'Hệ số VT-CNTT'),
        body: RefreshIndicator(
            onRefresh: refresh,
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
              child: Consumer(builder: (context, watch, child) {
                var selectedDV =
                    watch.watch(riverpod_instance.selectedTenDonVi11Pbh);
                var selectedMonth =
                    watch.watch(riverpod_instance.selectedMonthMonthYearPicker);
                var selectedYear =
                    watch.watch(riverpod_instance.selectedYearMonthYearPicker);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Custom_MonthYearPicker(),
                      Custom_DropDownDonViTheoTen11PBH(
                        nhanvienDonVi: localNhanVien.nhanvien_donvi!,
                      ),
                      FutureBuilder(
                        future: Future.delayed(Duration(seconds: awaitTime),
                            () => checkLocalConnectionApi()),
                        builder: (context, snapshot1) {
                          if (snapshot1.connectionState !=
                                  ConnectionState.waiting &&
                              snapshot1.data != null) {
                            // return FutureBuilder(
                            //   future: getDonViByID(
                            //       localNhanVien.nhanvien_donvi!, snapshot1.data!),
                            //   builder: (context, snapshot) {
                            //     return Custom_FutureBuilder(
                            //         contextParam: context,
                            //         snapshot: snapshot,
                            //         widgetParam: snapshot.hasData
                            //             ?
                            return FutureBuilder(
                                future: listHeSoSanLuong(
                                    pageNumber,
                                    10,
                                    selectedMonth.toString(),
                                    selectedYear.toString(),
                                    selectedDV,
                                    nhanvien_TenDonVi,
                                    localNhanVien.nhanvien_manv!,
                                    localNhanVien.nhanvien_chucdanh.toString(),
                                    snapshot1.data!),
                                builder: (context, snapshot) {
                                  // if (snapshot.connectionState !=
                                  //         ConnectionState.waiting &&
                                  //     snapshot.data != null) {

                                  return Custom_FutureBuilder(
                                      snapshot: snapshot,
                                      contextParam: context,
                                      widgetParam: snapshot.hasData
                                          ? SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  for (var item
                                                      in snapshot.data!)
                                                    Custom_Card(
                                                        item: item,
                                                        list: snapshot.data,
                                                        widget:
                                                            Column(children: [
                                                          Detail_Rows(
                                                            title: 'Thời gian:',
                                                            data: item.timekey
                                                                .toString(),
                                                          ),
                                                          Detail_Rows(
                                                            title:
                                                                'Phòng bán hàng:',
                                                            data: item
                                                                .nhanvien_pbh
                                                                .toString(),
                                                          ),
                                                          Detail_Rows(
                                                            title: 'Mã NV:',
                                                            data: item
                                                                .nhanvien_smcs
                                                                .toString(),
                                                          ),
                                                          FutureBuilder(
                                                            future: getNameNhanVien(
                                                                item
                                                                    .nhanvien_smcs!,
                                                                snapshot1
                                                                    .data!),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (snapshot
                                                                      .data ==
                                                                  null) {
                                                                return Text_medium_dark(
                                                                    title:
                                                                        'Đang tải...');
                                                              } else {
                                                                return Detail_Rows(
                                                                  title:
                                                                      'Tên NV:',
                                                                  data: snapshot
                                                                      .data!,
                                                                );
                                                              }
                                                            },
                                                          ),
                                                          Detail_Rows(
                                                            title: 'Chức danh:',
                                                            data: item
                                                                .nhanvien_chucdanh
                                                                .toString(),
                                                          ),
                                                          Detail_Rows(
                                                            title: 'Tổng điểm:',
                                                            data: item
                                                                .tong_diem!
                                                                .toStringAsFixed(
                                                                    2),
                                                          ),
                                                          MaterialButton(
                                                            onPressed: () {
                                                              getNameNhanVien(
                                                                      item
                                                                          .nhanvien_smcs!,
                                                                      snapshot1
                                                                          .data!)
                                                                  .then(
                                                                (value) {
                                                                  pageTrasition(
                                                                    context,
                                                                    HeSoVT_CNTT_Detail(
                                                                      fiber_quy_doi:
                                                                          item.fiber_quy_doi!,
                                                                      mytv_quy_doi: item
                                                                          .mytv_quy_doi
                                                                          .toString(),
                                                                      mesh_quy_doi: item
                                                                          .mesh_quy_doi
                                                                          .toString(),
                                                                      camera_quy_doi: item
                                                                          .camera_quy_doi
                                                                          .toString(),
                                                                      ddts_quy_doi: item
                                                                          .ddts_quy_doi
                                                                          .toString(),
                                                                      ddtt_quy_doi: item
                                                                          .ddtt_quy_doi
                                                                          .toString(),
                                                                      he_so_quy_doi: item
                                                                          .he_so_quy_doi
                                                                          .toString(),
                                                                      he_so_p1: item
                                                                          .he_so_p1
                                                                          .toString(),
                                                                      he_so_p2: item
                                                                          .he_so_p2
                                                                          .toString(),
                                                                      tong_diem:
                                                                          item.tong_diem!,
                                                                      tenNV:
                                                                          value,
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Text_medium_dark(
                                                                title:
                                                                    'Xem chi tiết'),
                                                          )
                                                        ])),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                        '$pageNumber/${HeSoVT_CNTT_Variable.totalResponsePages} trang, ${HeSoVT_CNTT_Variable.totalResponseItem} mục'),
                                                  ),
                                                  HeSoVT_CNTT_Variable
                                                              .totalResponsePages !=
                                                          0
                                                      ? SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Pager(
                                                            currentPage:
                                                                pageNumber,
                                                            totalPages:
                                                                HeSoVT_CNTT_Variable
                                                                    .totalResponsePages,
                                                            onPageChanged:
                                                                (page) {
                                                              setState(() {
                                                                pageNumber =
                                                                    page;
                                                              });
                                                            },
                                                          ),
                                                        )
                                                      : const Text(''),
                                                ],
                                              ),
                                            )
                                          : const Text(
                                              "Lỗi Xác thực vui lòng đăng nhập lại"));
                                }
                                //  else {
                                //   return const Center(
                                //     child: Text(
                                //       '',
                                //     ),
                                //   );
                                // }
                                // }
                                );
                            // : const Text(''));
                            // },
                            // );
                          } else {
                            return Center(
                                child: LoadingScreen(
                              nameOfLoadingScreen: 'Đang kiểm tra mạng...',
                            ));
                          }
                        },
                      )
                    ],
                  ),
                );
              }),
            )));
  }
}
