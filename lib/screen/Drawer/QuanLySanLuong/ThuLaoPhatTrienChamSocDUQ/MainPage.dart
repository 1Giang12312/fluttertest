// ignore_for_file: camel_case_types, file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/ThuLaoPhatTrienChamSocDUQ/Detail.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/ThuLaoPhatTrienChamSocDUQ/Logic.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/ThuLaoPhatTrienChamSocDUQ/Variable.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';

class ThuLaoPhatTrienChamSocDUQ_MainPage extends StatefulWidget {
  const ThuLaoPhatTrienChamSocDUQ_MainPage({super.key});

  @override
  State<ThuLaoPhatTrienChamSocDUQ_MainPage> createState() =>
      _ThuLaoPhatTrienChamSocDUQ_MainPageState();
}

int pageNumber = 1;
int pageSized = 10;
var selectedDonVi;

class _ThuLaoPhatTrienChamSocDUQ_MainPageState
    extends State<ThuLaoPhatTrienChamSocDUQ_MainPage> {
  @override
  void initState() {
    selectedDonVi = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String convertMonth(int month) {
      if (month < 10) {
        return '0${month.toString()}';
      } else {
        return month.toString();
      }
    }

    Future<void> refresh() async {
      setState(() {});
    }

    return Scaffold(
        appBar: Custom_AppBar(title: 'Thù lao phát triển và chăm sóc ĐUQ'),
        body: Padding(
          padding: EdgeInsets.only(right: 8, left: 8),
          child: RefreshIndicator(
              onRefresh: refresh,
              child: Consumer(builder: (context, ref, child) {
                var selectedYear =
                    ref.watch(riverpod_instance.selectedYearMonthYearPicker);
                var selectedMonth =
                    ref.watch(riverpod_instance.selectedMonthMonthYearPicker);
                var selectedDV =
                    ref.watch(riverpod_instance.selectedTenDonVi11Pbh);
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Custom_MonthYearPicker(),
                      Custom_DropDownDonViTheoTen11PBH(
                        nhanvienDonVi: localNhanVien.nhanvien_donvi!,
                      ),
                      // localNhanVien.nhanvien_donvi == 13 ||
                      //         localNhanVien.nhanvien_donvi == 2
                      //     ? Row(
                      //         children: [
                      //           const TinyWidthSizedBox(),
                      //           SingleChildScrollView(
                      //             child: FutureBuilder<List<DonVi>>(
                      //                 future: checkLocalConnectionApi()
                      //                     .then((value) => listDonVi(value)),
                      //                 builder: ((context, snapshot) {
                      //                   if (snapshot.hasData) {
                      //                     return DropdownButton(
                      //                       hint: const Text('Chọn đơn vị'),
                      //                       value: selectedDonVi,
                      //                       items: snapshot.data!.map((e) {
                      //                         return DropdownMenuItem(
                      //                           value: e.donvi_ten.toString(),
                      //                           child: e.donvi_ten == null
                      //                               ? const Text('Tất cả đơn vị')
                      //                               : Text(e.donvi_ten.toString()),
                      //                         );
                      //                       }).toList(),
                      //                       onChanged: (value) {
                      //                         setState(() {
                      //                           selectedDonVi = value;
                      //                         });
                      //                       },
                      //                     );
                      //                   } else {
                      //                     return const Text('Loading...');
                      //                   }
                      //                 })),
                      //           ),
                      //         ],
                      //       )
                      //     : const SizedBox(),
                      FutureBuilder(
                          future: Future.delayed(Duration(seconds: awaitTime),
                              () => checkLocalConnectionApi()),
                          builder: (context, snapshot1) {
                            if (snapshot1.data != null &&
                                snapshot1.connectionState !=
                                    ConnectionState.waiting) {
                              return FutureBuilder(
                                  future: listThuLao(
                                      pageNumber,
                                      10,
                                      selectedMonth.toString(),
                                      selectedYear.toString(),
                                      selectedDV,
                                      nhanvien_TenDonVi,
                                      localNhanVien.nhanvien_manv!,
                                      localNhanVien.nhanvien_chucdanh
                                          .toString(),
                                      snapshot1.data!),
                                  builder: ((context, snapshot) {
                                    return Custom_FutureBuilder(
                                        contextParam: context,
                                        snapshot: snapshot,
                                        widgetParam: snapshot.hasData
                                            ? SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    for (var item
                                                        in snapshot.data!)
                                                      Custom_Card(
                                                          item: item,
                                                          list: snapshot.data,
                                                          widget: Column(
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Detail_Rows(
                                                                      title:
                                                                          'Thời gian:',
                                                                      data: item
                                                                          .timekey!),
                                                                  Detail_Rows(
                                                                      title:
                                                                          'Tên đơn vị:',
                                                                      data: item
                                                                          .donvi!),
                                                                  Detail_Rows(
                                                                      title:
                                                                          'Tên nhân viên:',
                                                                      data: item
                                                                          .nhanvienHoten!),
                                                                  Detail_Rows(
                                                                      title:
                                                                          'Mã nhân viên:',
                                                                      data: item
                                                                          .nhanvienSmcs!),
                                                                  Detail_Rows(
                                                                      title:
                                                                          'Chức danh:',
                                                                      data: item
                                                                          .nhanvienChucdanh!),
                                                                  Detail_Rows(
                                                                      title:
                                                                          'Số lượng ĐUQ:',
                                                                      data: item
                                                                          .soluongDuq!
                                                                          .toString()),
                                                                  Detail_Rows(
                                                                      title:
                                                                          'Doanh thu ghi nhận:',
                                                                      data: NumberFormat(
                                                                              '#,###')
                                                                          .format(
                                                                              item.bangoiDoanhThu)),
                                                                  Detail_Rows(
                                                                      title:
                                                                          'Tiền lương dự kiến 5%:',
                                                                      data: NumberFormat(
                                                                              '#,###')
                                                                          .format(
                                                                              item.bangoiThulao)),
                                                                  Detail_Rows(
                                                                      title:
                                                                          'Tổng thù lao dự kiến:',
                                                                      data: NumberFormat(
                                                                              '#,###')
                                                                          .format(
                                                                              item.tongThuLao)),
                                                                  MaterialButton(
                                                                    onPressed:
                                                                        () {
                                                                      pageTrasition(
                                                                        context,
                                                                        ThuLaoPhatTrienChamSocDUQ_Detail(
                                                                          timekey:
                                                                              item.timekey!,
                                                                          thulaoDuqPtmDkg:
                                                                              item.thulaoDuqPtmDkg!,
                                                                          thulaoPtmCoGoi:
                                                                              item.thulaoPtmCoGoi!,
                                                                          donvi:
                                                                              item.donvi!,
                                                                          nhanvienHoten:
                                                                              item.nhanvienHoten!,
                                                                          nhanvienChucdanh:
                                                                              item.nhanvienChucdanh!,
                                                                          nhanvienSmcs:
                                                                              item.nhanvienSmcs!,
                                                                          soluongDuq:
                                                                              item.soluongDuq!,
                                                                          soluongDuqPtmDkg:
                                                                              item.soluongDuqPtmDkg!,
                                                                          tileDuqPtmDkg:
                                                                              item.tileDuqPtmDkg!,
                                                                          dktttb0509:
                                                                              item.dktttb0509!,
                                                                          dktttb1019:
                                                                              item.dktttb1019!,
                                                                          dktttb2039:
                                                                              item.dktttb2039!,
                                                                          dktttb40:
                                                                              item.dktttb40!,
                                                                          thulaoDktttb:
                                                                              item.thulaoDktttb!,
                                                                          ptmCoGoi:
                                                                              item.ptmCoGoi!,
                                                                          bangoiSlDuq:
                                                                              item.bangoiSlDuq!,
                                                                          bangoiSlThuebao:
                                                                              item.bangoiSlThuebao!,
                                                                          bangoiDoanhThu:
                                                                              item.bangoiDoanhThu!,
                                                                          bangoiThulao:
                                                                              item.bangoiThulao!,
                                                                          tongThuLao:
                                                                              item.tongThuLao!,
                                                                          donviId:
                                                                              localNhanVien.nhanvien_donvi!,
                                                                        ),
                                                                      );
                                                                    },
                                                                    child: Text_medium_dark(
                                                                        title:
                                                                            'Xem chi tiết'),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          )),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                          '$pageNumber/${ThuLaoPhatTrienChamSocDUQ_Variable.totalPage} trang, ${ThuLaoPhatTrienChamSocDUQ_Variable.totalItem} mục'),
                                                    ),
                                                    ThuLaoPhatTrienChamSocDUQ_Variable
                                                                .totalPage !=
                                                            0
                                                        ? SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Pager(
                                                              currentPage:
                                                                  pageNumber,
                                                              totalPages:
                                                                  ThuLaoPhatTrienChamSocDUQ_Variable
                                                                      .totalPage,
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
                                            : const Text(''));
                                  }));
                            } else {
                              return LoadingScreen(
                                  nameOfLoadingScreen: 'Đang lấy dữ liệu...');
                            }
                          })
                    ],
                  ),
                );
              })),
        ));
  }
}
