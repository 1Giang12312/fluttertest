// ignore_for_file: file_names, non_constant_identifier_names

import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_RichText.dart';
import 'package:vnptapp/Components/Custom_SizedBox.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
import 'package:vnptapp/GlobalFunction/GetDonVi.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:flutter/material.dart';
import 'package:vnptapp/Models/NVNhanBSC.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/screen/Drawer/KiemTraGiaoBSC/GiaoBscNhanVien/Logic.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: must_be_immutable, camel_case_types
class GiaoBscNhanVien_Detail extends StatefulWidget {
  GiaoBscNhanVien_Detail(
      {super.key,
      required this.nhanviennhan,
      required this.nhanviengiao,
      required this.nam,
      required this.thang,
      required this.ngayGiao,
      required this.TrangThaiThamDinh,
      required this.tenNV,
      required this.ngayThamDinh});
  @override
  State<GiaoBscNhanVien_Detail> createState() => _GiaoBscNhanVien_DetailState();
  int nhanviennhan;
  int nhanviengiao;
  int nam;
  int thang;
  bool TrangThaiThamDinh;
  DateTime ngayGiao;
  String ngayThamDinh;
  String tenNV;
}

// ignore: camel_case_types
class _GiaoBscNhanVien_DetailState extends State<GiaoBscNhanVien_Detail> {
  String tenDonVi = '';
  var pageNumber = 1;
  double tongDiem = 0;
  double heSo = 0;
  String formattedDate = '';
  @override
  void initState() {
    tongDiem = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.ngayGiao != DateTime(0)
        ? formattedDate = DateFormat('MM/yyyy').format(widget.ngayGiao)
        : formattedDate = 'Không có ngày giao';
    return Scaffold(
      appBar: Custom_AppBar(title: 'Chi tiết NV ${widget.tenNV}'),
      body: FutureBuilder(
        future: checkLocalConnectionApi(),
        builder: (context, snapshot1) {
          if (snapshot1.data != null) {
            return SingleChildScrollView(
                child: FutureBuilder<List<NVNhanBSC>>(
                    future: getListBscNhanVien(
                        widget.nhanviengiao,
                        widget.nhanviennhan,
                        widget.thang,
                        widget.nam,
                        snapshot1.data!),
                    builder: (context, snapshot) {
                      // if (snapshot.connectionState == ConnectionState.none) {
                      //   return Text_medium_dark(title: 'Không có kết nối mạng!');
                      // } else if (snapshot.hasError) {
                      //   return Text_medium_dark(
                      //       title: 'Có lỗi xảy ra: ${snapshot.error}');
                      // } else if (snapshot.connectionState ==
                      //     ConnectionState.waiting) {
                      //   return LoadingSreen(
                      //     nameOfLoadingScreen: 'Đang tải dữ liệu',
                      //   );
                      // } else {
                      return Custom_FutureBuilder(
                          contextParam: context,
                          snapshot: snapshot,
                          widgetParam: snapshot.hasData
                              ? SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              children: [
                                                widget.TrangThaiThamDinh
                                                    ? Text(
                                                        'Đã thẩm định ngày ${DateTimeFormated(widget.ngayThamDinh)== '01/01/0000 00:00:00' ? 'Chưa có dữ liệu' : DateTimeFormated(widget.ngayThamDinh)}',
                                                        style: const TextStyle(
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    : const Text(
                                                        'Chưa thẩm định',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                Align(
                                                    alignment: Alignment.topCenter,
                                                    child: Custom_RichText(
                                                      normaText:
                                                          'BẢNG GIAO VÀ KẾT QUẢ THỰC HIỆN BSC/KPI THÁNG ',
                                                      colorText: formattedDate,
                                                    )),
                                                localNhanVien == NhanVien()
                                                    ? FutureBuilder(
                                                        future: getDonViByID(
                                                            localNhanVien
                                                                .nhanvien_donvi!,
                                                            snapshot1.data!),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot.data !=
                                                              null) {
                                                            return Custom_RichText(
                                                                normaText:
                                                                    'Đơn vị ',
                                                                colorText:
                                                                    snapshot
                                                                        .data!);
                                                          } else {
                                                            return const CircularProgressIndicator();
                                                          }
                                                        })
                                                    : FutureBuilder(
                                                        future:
                                                            getDonViByNhanVienNhan(
                                                                widget
                                                                    .nhanviennhan,
                                                                snapshot1
                                                                    .data!),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot.data !=
                                                              null) {
                                                            return FutureBuilder(
                                                                future: getDonViByID(
                                                                    snapshot
                                                                        .data!,
                                                                    snapshot1
                                                                        .data!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  if (snapshot
                                                                          .data !=
                                                                      null) {
                                                                    return Custom_RichText(
                                                                        normaText:
                                                                            'Đơn vị ',
                                                                        colorText:
                                                                            snapshot.data!);
                                                                  } else {
                                                                    return const CircularProgressIndicator();
                                                                  }
                                                                });
                                                          } else {
                                                            return const CircularProgressIndicator();
                                                          }
                                                        }),
                                                Text(widget.tenNV)
                                              ],
                                            )
                                          ],
                                        ),
                                        DataTable(
                                          columnSpacing: 8.0,
                                          columns: const [
                                            DataColumn(
                                              label: Text('STT'),
                                            ),
                                            DataColumn(
                                              label: Text('KPI'),
                                            ),
                                            DataColumn(
                                              label: Text('Nhóm'),
                                            ),
                                            DataColumn(
                                              label: Text('Tỷ trọng'),
                                            ),
                                            DataColumn(
                                              label: Text('	ĐVT'),
                                            ),
                                            DataColumn(
                                              label: Text('Chỉ tiêu'),
                                            ),
                                            DataColumn(
                                              label: Text('Thẩm định'),
                                            ),
                                            DataColumn(
                                              label: Text('Tỷ lệ thực hiện(%)'),
                                            ),
                                            DataColumn(
                                              label: Text('Hệ số quy đổi'),
                                            ),
                                            DataColumn(
                                              label: Text('Ghi chú'),
                                            ),
                                            DataColumn(
                                              label: Text('Lý do thẩm định'),
                                            ),
                                          ],
                                          rows: snapshot.data!
                                              .asMap()
                                              .entries
                                              .map(
                                                (item) => DataRow(
                                                  cells: [
                                                    DataCell(Text(
                                                        '${item.key + 1}')),
                                                    DataCell(FutureBuilder(
                                                      future: getKPIByID(
                                                          item.value.kpi!,
                                                          snapshot1.data!),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot.data ==
                                                            null) {
                                                          return const Text(
                                                              'Đang tải...');
                                                        } else {
                                                          return SingleChildScrollView(
                                                            child: SizedBox(
                                                              width: 250,
                                                              child: Text(
                                                                  snapshot.data!
                                                                      .kpi_ten!),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    )),
                                                    DataCell(FutureBuilder(
                                                      future: getNhomKpisByID(
                                                          item.value.nhom_kpi!,
                                                          snapshot1.data!),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot.data ==
                                                            null) {
                                                          return const Text(
                                                              'Đang tải...');
                                                        } else {
                                                          return SingleChildScrollView(
                                                              child: SizedBox(
                                                                  width: 150,
                                                                  child: Text(
                                                                      snapshot
                                                                          .data!
                                                                          .ten_nhom!)));
                                                        }
                                                      },
                                                    )
                                                        //   SizedBox(
                                                        //   width: sizeboxSized,
                                                        //   child: Text(item
                                                        //       .value.nhom_kpi
                                                        //       .toString()),
                                                        // )
                                                        ),
                                                    DataCell(
                                                        //  FutureBuilder(
                                                        //   future: getNhomKpisByID(item.value.nhom_kpi!),
                                                        //   builder: (context, snapshot) {
                                                        //     if (snapshot.data == null) {
                                                        //       return const Text('loading...');
                                                        //     } else {
                                                        //       return
                                                        //       Text(
                                                        //             snapshot.data!.tytrong.toString());
                                                        //     }
                                                        //   },
                                                        // )
                                                        Text(
                                                            '${item.value.trongso}')),
                                                    DataCell(FutureBuilder(
                                                      future: getDonviTinhByID(
                                                          item.value.donvitinh!,
                                                          snapshot1.data!),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot.data ==
                                                            null) {
                                                          return const Text(
                                                              'Đang tải...');
                                                        } else {
                                                          return Text(snapshot
                                                              .data!.dvt_ten!);
                                                        }
                                                      },
                                                    )),
                                                    DataCell(
                                                      Text(item.value.kehoach
                                                          .toString()),
                                                    ),
                                                    DataCell(
                                                      Text(item.value.thamdinh
                                                                  .toString() ==
                                                              'null'
                                                          ? '0'
                                                          : item.value.thamdinh!
                                                              .toStringAsFixed(
                                                                  2)),
                                                    ),
                                                    DataCell(
                                                      Text(item.value.diem_kpi
                                                                  .toString() ==
                                                              'null'
                                                          ? '0'
                                                          : (item.value
                                                                      .kq_thuchien! *
                                                                  100)
                                                              .toStringAsFixed(
                                                                  2)),
                                                    ),
                                                    DataCell(
                                                        //   FutureBuilder(
                                                        //   future: getNhomKpisByID(item.value.nhom_kpi!),
                                                        //   builder: (context, snapshot) {
                                                        //     if (snapshot.data == null) {
                                                        //       return Text('loading...');
                                                        //     } else {
                                                        //       return
                                                        //       SizedBox(
                                                        //         width: sizeboxSized,
                                                        //         child: Text(
                                                        //            '${snapshot.data!.tytrong!*item.value.kehoach!}'),
                                                        //       );
                                                        //     }
                                                        //   },
                                                        // )
                                                        Text((item.value
                                                                    .kq_thuchien! *
                                                                item.value
                                                                    .trongso! /
                                                                100)
                                                            .toStringAsFixed(
                                                                2))),
                                                    DataCell(
                                                        SingleChildScrollView(
                                                      child: SizedBox(
                                                        width: 100,
                                                        child: Text(item
                                                            .value.ghichu
                                                            .toString()),
                                                      ),
                                                    )),
                                                    DataCell(
                                                        SingleChildScrollView(
                                                      child: SizedBox(
                                                        width: 100,
                                                        child: Text(item.value
                                                            .ghichu_thamdinh
                                                            .toString()),
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                        ),
                                        FutureBuilder(
                                          future: getListBscNhanVien(
                                              widget.nhanviengiao,
                                              widget.nhanviennhan,
                                              widget.thang,
                                              widget.nam,
                                              snapshot1.data!),
                                          builder: (context, snapshot) {
                                            tongDiem=0; 
                                            if (snapshot.data != null) {
                                              for (var item in snapshot.data!) {
                                                heSo = (item.kq_thuchien! *
                                                        double.parse(item
                                                            .trongso
                                                            .toString())) /
                                                    100;
                                                tongDiem = heSo + tongDiem;
                                              }
                                              return Text(
                                                  'Tổng điểm: ${tongDiem.toStringAsFixed(2)}');
                                            } else {
                                              return const Text('Đang tải..');
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : const Text(''));
                    }));
          } else {
            return Center(
                child: LoadingScreen(
              nameOfLoadingScreen: 'Đang kiểm tra mạng...',
            ));
          }
        },
      ),
    );
  }
}
