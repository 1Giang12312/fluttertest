// ignore_for_file: camel_case_types, file_names, prefer_typing_uninitialized_variables, unnecessary_null_comparison, prefer_const_constructors

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
import 'package:vnptapp/Components/Custom_SizedBox.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
import 'package:vnptapp/GlobalFunction/GetDonVi.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/KiemTraGiaoBSC/GiaoBscNhanVien/Detail.dart';
import 'package:vnptapp/screen/Drawer/KiemTraGiaoBSC/GiaoBscNhanVien/Logic.dart';
import 'package:vnptapp/screen/Drawer/KiemTraGiaoBSC/GiaoBscNhanVien/Variable.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';

class NhanVienNhanBsc_MainPage extends StatefulWidget {
  const NhanVienNhanBsc_MainPage({super.key});
  @override
  State<NhanVienNhanBsc_MainPage> createState() =>
      _NhanVienNhanBsc_MainPageState();
}

class _NhanVienNhanBsc_MainPageState extends State<NhanVienNhanBsc_MainPage> {
  int pageNumber = 1;
  TextEditingController searchkey = TextEditingController();
  var selectedDonVi;
  var selectedDate;
  String tenDonVi = '';
  @override
  void initState() {
    GiaoBscNhanVien_Variable.id_DonVi = null;
    searchkey.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> refresh() async {
      setState(() {
        searchkey.text = '';
        selectedDonVi = null;
        GiaoBscNhanVien_Variable.id_DonVi = selectedDonVi;
      });
    }

    return Scaffold(
        appBar: Custom_AppBar(title: 'Nhân viên nhận BSC'),
        body: Padding(
          padding: EdgeInsets.only(right: 8, left: 8),
          child: RefreshIndicator(
              onRefresh: refresh,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SmallHeightSizedBox(),
                    localNhanVien.nhanvien_donvi == 13 ||
                            localNhanVien.nhanvien_donvi == 2
                        ? Row(
                            children: [
                              const TinyWidthSizedBox(),
                              const TinyWidthSizedBox(),
                              Expanded(
                                  flex: 6,
                                  child: SizedBox(
                                    height: 50,
                                    child: TextField(
                                      controller: searchkey,
                                      decoration: const InputDecoration(
                                        hintText: 'Tìm kiếm(theo họ tên)',
                                        label: Text('Tìm kiếm(theo họ tên)'),
                                        prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(19.0)),
                                        ),
                                      ),
                                      onChanged: (text) {
                                        setState(() {
                                          searchkey.text = text;
                                        });
                                      },
                                    ),
                                  )),
                              const TinyWidthSizedBox(),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const MediumWidthSizedBox(),
                        Expanded(flex: 6, child: Custom_MonthYearPicker()),
                        const SmallWidthSizedBox(),
                        Expanded(
                          flex: 4,
                          child: OutlinedButton.icon(
                            onPressed: refresh,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Đặt lại'),
                          ),
                        ),
                        const TinyWidthSizedBox()
                      ],
                    ),
                    Center(
                      child: Custom_DropdownDonViTheoIdTatCa(
                        nhanvienDonVi: localNhanVien.nhanvien_donvi!,
                      ),
                    ),
                    Consumer(builder: (context, watch, child) {
                      var selectedDV =
                          watch.watch(riverpod_instance.selectedIdDonViTatCa);
                      var selectedMonth = watch.watch(
                          riverpod_instance.selectedMonthMonthYearPicker);
                      var selectedYear = watch
                          .watch(riverpod_instance.selectedYearMonthYearPicker);
                      return FutureBuilder(
                        future: Future.delayed(Duration(seconds: awaitTime),
                            () => checkLocalConnectionApi()),
                        builder: (context, snapshot1) {
                          if (snapshot1.data != null &&
                              snapshot1.connectionState !=
                                  ConnectionState.waiting) {
                            return FutureBuilder(
                                future: listNhanVienNhanBSC(
                                    pageNumber,
                                    10,
                                    selectedMonth.toString(),
                                    selectedYear.toString(),
                                    selectedDV,
                                    searchkey.text,
                                    snapshot1.data!,
                                    localNhanVien.nhanvien_chucdanh!,
                                    localNhanVien.nhanvien_donvi!,
                                    localNhanVien.nhanvien_id!),
                                builder: (context, snapshot) {
                                  return Custom_FutureBuilder(
                                      contextParam: context,
                                      snapshot: snapshot,
                                      widgetParam: snapshot.hasData
                                          ? SingleChildScrollView(
                                              child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                for (var item in snapshot.data!)
                                                  Custom_Card(
                                                      item: item,
                                                      list: snapshot.data,
                                                      widget: Column(
                                                        children: [
                                                          FutureBuilder(
                                                            future: getMaNhanVien(
                                                                item.nhanviennhan!
                                                                    .toString(),
                                                                snapshot1
                                                                    .data!),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (snapshot
                                                                      .data ==
                                                                  null) {
                                                                return const Text(
                                                                    'Đang tải...');
                                                              } else {
                                                                return Detail_Rows(
                                                                    title:
                                                                        'Mã nhân viên:',
                                                                    data: snapshot
                                                                        .data!);
                                                              }
                                                            },
                                                          ),
                                                          FutureBuilder(
                                                            future: getNameNhanVien(
                                                                item.nhanviennhan!
                                                                    .toString(),
                                                                snapshot1
                                                                    .data!),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (snapshot
                                                                      .data ==
                                                                  null) {
                                                                return const Text(
                                                                    'Đang tải...');
                                                              } else {
                                                                return Detail_Rows(
                                                                    title:
                                                                        'Họ tên:',
                                                                    data: snapshot
                                                                        .data!);
                                                              }
                                                            },
                                                          ),
                                                          FutureBuilder(
                                                            future: getDonViByNhanVienNhan(
                                                                item
                                                                    .nhanviennhan!,
                                                                snapshot1
                                                                    .data!),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (snapshot
                                                                      .data ==
                                                                  null) {
                                                                return const Text(
                                                                    '');
                                                              } else {
                                                                return FutureBuilder(
                                                                    future: getDonViByID(
                                                                        snapshot
                                                                            .data!,
                                                                        snapshot1
                                                                            .data!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      if (snapshot
                                                                              .data ==
                                                                          null) {
                                                                        return const Text(
                                                                            '');
                                                                      } else {
                                                                        return Detail_Rows(
                                                                            title:
                                                                                'Đơn vị:',
                                                                            data:
                                                                                snapshot.data!);
                                                                      }
                                                                    });
                                                              }
                                                            },
                                                          ),
                                                          item.ngaytao == "null" ||
                                                                  item.ngaytao ==
                                                                      '' ||
                                                                  item.ngaytao ==
                                                                      null
                                                              ? Detail_Rows(
                                                                  title:
                                                                      'Ngày giao:',
                                                                  data:
                                                                      'Không có ngày giao')
                                                              : Detail_Rows(
                                                                  title:
                                                                      'Ngày giao:',
                                                                  data: DateTimeFormated(item
                                                                      .ngaytao
                                                                      .toString())),
                                                          FutureBuilder(
                                                              future: getBSCThamDinh(
                                                                  item
                                                                      .nhanviengiao!,
                                                                  item
                                                                      .nhanviennhan!,
                                                                  item.thang!,
                                                                  item.nam!,
                                                                  snapshot1
                                                                      .data!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                if (snapshot
                                                                        .data ==
                                                                    null) {
                                                                  return const Text(
                                                                      '');
                                                                } else {
                                                                  return snapshot
                                                                              .data
                                                                              ?.trangthaithamdinh ==
                                                                          true
                                                                      ? Detail_Rows(
                                                                          title:
                                                                              'Trạng thái:',
                                                                          data:
                                                                              'Đã thẩm định ngày ${DateTimeFormated(snapshot.data!.thoigian_thamdinh.toString()) == '01/01/0000 00:00:00' ? 'Chưa có dữ liệu' : DateTimeFormated(snapshot.data!.thoigian_thamdinh.toString())}')
                                                                      : Detail_Rows(
                                                                          title:
                                                                              'Trạng thái:',
                                                                          data:
                                                                              'Chưa thẩm định');
                                                                }
                                                              }),
                                                          FutureBuilder(
                                                              future: getBSCThamDinh(
                                                                  item
                                                                      .nhanviengiao!,
                                                                  item
                                                                      .nhanviennhan!,
                                                                  item.thang!,
                                                                  item.nam!,
                                                                  snapshot1
                                                                      .data!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                if (snapshot
                                                                        .data ==
                                                                    null) {
                                                                  return const Text(
                                                                      '');
                                                                } else {
                                                                  return SizedBox(
                                                                    height: 30,
                                                                    width: widthOfDevice(
                                                                            context) /
                                                                        2,
                                                                    child:
                                                                        MaterialButton(
                                                                      onPressed:
                                                                          () {
                                                                        getNameNhanVien(item.nhanviennhan.toString(),
                                                                                snapshot1.data!)
                                                                            .then(
                                                                          (value) {
                                                                            pageTrasition(
                                                                                context,
                                                                                GiaoBscNhanVien_Detail(
                                                                                  ngayThamDinh: snapshot.data!.thoigian_thamdinh.toString(),
                                                                                  tenNV: value,
                                                                                  nhanviengiao: item.nhanviengiao!,
                                                                                  nhanviennhan: item.nhanviennhan!,
                                                                                  thang: item.thang!,
                                                                                  nam: item.nam!,
                                                                                  TrangThaiThamDinh: snapshot.data!.trangthaithamdinh!,
                                                                                  ngayGiao: item.ngaytao == "null" || item.ngaytao == '' || item.ngaytao == null ? DateTime(0) : DateTime.parse(item.ngaytao!),
                                                                                ));
                                                                          },
                                                                        );
                                                                      },
                                                                      child: const Text(
                                                                          'Xem chi tiết'),
                                                                    ),
                                                                  );
                                                                }
                                                              })
                                                        ],
                                                      )),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                      '$pageNumber/${GiaoBscNhanVien_Variable.totalResponsePages} trang , ${GiaoBscNhanVien_Variable.totalResponseItem} mục'),
                                                ),
                                                GiaoBscNhanVien_Variable
                                                            .totalResponsePages !=
                                                        0
                                                    ? SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Pager(
                                                          currentPage:
                                                              pageNumber,
                                                          totalPages:
                                                              GiaoBscNhanVien_Variable
                                                                  .totalResponsePages,
                                                          onPageChanged:
                                                              (page) {
                                                            setState(() {
                                                              pageNumber = page;
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    : const Text(''),
                                              ],
                                            ))
                                          : const Text(''));
                                });
                          } else {
                            return Center(
                                child: LoadingScreen(
                              nameOfLoadingScreen: 'Đang kiểm tra mạng...',
                            ));
                          }
                        },
                      );
                    })
                  ],
                ),
              )),
        ));
  }
}
