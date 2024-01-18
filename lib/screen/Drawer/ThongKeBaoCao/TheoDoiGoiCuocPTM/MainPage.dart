// ignore_for_file: prefer_const_constructors_in_immutables, camel_case_types, file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_DropdownDonVi.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';
import 'package:vnptapp/screen/Drawer/ThongKeBaoCao/TheoDoiGoiCuocPTM/Detail.dart';
import 'package:vnptapp/screen/Drawer/ThongKeBaoCao/TheoDoiGoiCuocPTM/Logic.dart';
import 'package:vnptapp/screen/Drawer/ThongKeBaoCao/TheoDoiGoiCuocPTM/Variable.dart';

class TheoDoiGoiCuocPTM_MainPage extends StatefulWidget {
  TheoDoiGoiCuocPTM_MainPage({super.key});

  @override
  State<TheoDoiGoiCuocPTM_MainPage> createState() =>
      _TheoDoiGoiCuocPTM_MainPageState();
}

class _TheoDoiGoiCuocPTM_MainPageState
    extends State<TheoDoiGoiCuocPTM_MainPage> {
  DateTime ngayBatDau = DateTime.now();
  DateTime ngayKetThuc = DateTime.now();
  int yearNow = DateTime.now().year;
  int pageNumber = 1;
  int pageSize = 10;
  var selectedDate;
  var selectedDonVi;
  String getDateFormat(String inputDate) {
    return "${inputDate.substring(6, 8)}/${inputDate.substring(4, 6)}/${inputDate.substring(0, 4)}";
  }

  Future<void> refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(title: 'Theo dõi gói cước phát triển mới'),
      body: Padding(
          padding: EdgeInsets.only(right: 8, left: 8),
          child: RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
              child: Column(children: [
                // Row(
                //   children: [
                //     Expanded(
                //       flex: 5,
                //       child: ElevatedButton(
                //         onPressed: () {},
                //         child: const Text('Xem chi tiết'),
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     Expanded(
                //       flex: 5,
                //       child: ElevatedButton(
                //         onPressed: () {},
                //         child: const Text('Xem tổng hợp'),
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ElevatedButton(
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: ngayBatDau,
                              firstDate: DateTime(yearNow - 10),
                              lastDate: DateTime(yearNow + 10),
                              locale: const Locale('vi', 'VN'));
                          if (picked != null && picked != ngayBatDau) {
                            setState(() {
                              ngayBatDau = picked;
                            });
                          }
                        },
                        child: Text(
                            'Từ ngày ${ngayBatDau.day} tháng ${ngayBatDau.month} năm ${ngayBatDau.year}'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: ElevatedButton(
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: ngayKetThuc,
                              firstDate: DateTime(yearNow - 10),
                              lastDate: DateTime(yearNow + 10),
                              locale: const Locale('vi', 'VN'));
                          if (picked != null && picked != ngayKetThuc) {
                            setState(() {
                              ngayKetThuc = picked;
                            });
                          }
                        },
                        child: Text(
                            'Đến ngày ${ngayKetThuc.day} tháng ${ngayKetThuc.month} năm ${ngayKetThuc.year}'),
                      ),
                    ),
                  ],
                ),
                // FutureBuilder(
                //     future: Future.delayed(Duration(seconds: awaitTime),
                //         () => checkLocalConnectionApi()),
                //     builder: ((context, snapshot1) {
                //       if (snapshot1.data == null ||
                //           snapshot1.connectionState ==
                //               ConnectionState.waiting) {
                //         return LoadingSreen(
                //           nameOfLoadingScreen: 'Đang kiểm tra mạng...',
                //         );
                //       } else {
                //         return
                // SingleChildScrollView(
                //   child: Column(
                //     children: [
                FutureBuilder(
                    future: checkLocalConnectionApi()
                        .then((value) => getMaxTime(value)),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return Text_medium_dark(
                            title:
                                'Số liệu được cập nhật tới thời điểm ${getDateFormat(snapshot.data!)}');
                      } else {
                        return Text_medium_dark(title: 'Đang tải...');
                      }
                    }),
                Center(
                  child: Custom_DropdownDonViTheoIdTatCa(
                    nhanvienDonVi: localNhanVien.nhanvien_donvi!,
                  ),
                ),
                // Row(
                //   children: [
                //     Expanded(
                //         flex: 6,
                //         child: TextField(
                //           controller: soLuongHang,
                //           decoration: InputDecoration(
                //             labelText: 'Số lượng PTM gần nhất',
                //             hintText: 'Mặc định là 30',
                //             border: OutlineInputBorder(
                //               borderRadius:
                //                   BorderRadius.circular(30.0),
                //             ),
                //             focusedBorder: OutlineInputBorder(
                //               borderSide: const BorderSide(
                //                   color: Colors.blue,
                //                   width: 2.0),
                //               borderRadius:
                //                   BorderRadius.circular(10.0),
                //             ),
                //           ),
                //         )),
                //     Expanded(
                //       flex: 4,
                //       child: ElevatedButton(
                //           onPressed: () async {
                //             setState(() {});
                //           },
                //           child: const Text(
                //             'Xem dữ liệu',
                //           )),
                //     )
                //   ],
                // ),
                SingleChildScrollView(
                    child: Consumer(builder: (context, watch, child) {
                  var selectedDV =
                      watch.watch(riverpod_instance.selectedIdDonViTatCa);
                  return FutureBuilder(
                      future: checkLocalConnectionApi(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null &&
                            snapshot.connectionState !=
                                ConnectionState.waiting) {
                          return FutureBuilder(
                              future: listTheoDoiPTM(
                                pageNumber,
                                pageSize,
                                ngayBatDau,
                                ngayKetThuc,
                                selectedDV,
                                localNhanVien.nhanvien_donvi!,
                                localNhanVien.nhanvien_manv!,
                                localNhanVien.nhanvien_chucdanh!,
                                snapshot.data!,
                              ),
                              builder: (context, snapshot1) {
                                return Custom_FutureBuilder(
                                    snapshot: snapshot1,
                                    contextParam: context,
                                    widgetParam: snapshot1.hasData
                                        ? SingleChildScrollView(
                                            child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              for (var item in snapshot1.data!)
                                                Card(
                                                    color: snapshot1.data!
                                                                    .indexOf(
                                                                        item) %
                                                                2 ==
                                                            0
                                                        ? isDarkMode
                                                            ? Card_colors_dark_1
                                                            : Card_colors_1
                                                        : isDarkMode
                                                            ? Card_colors_dark_2
                                                            : Card_colors_2,
                                                    clipBehavior: Clip.hardEdge,
                                                    child: InkWell(
                                                        splashColor: Colors.blue
                                                            .withAlpha(30),
                                                        onTap: () {},
                                                        child: Column(
                                                          children: [
                                                            Detail_Rows(
                                                                title:
                                                                    'Tên đơn vị',
                                                                data: item
                                                                    .tenDonvi),
                                                            Detail_Rows(
                                                                title:
                                                                    'Tên nhân viên',
                                                                data: item
                                                                    .nhanvien),
                                                            Detail_Rows(
                                                                title:
                                                                    'Thời gian DK gói',
                                                                data: getDateFormat(
                                                                    item.thoigianDkgoi)),
                                                            Detail_Rows(
                                                                title:
                                                                    'Hệ thống',
                                                                data: item
                                                                    .loaiId),
                                                            Detail_Rows(
                                                                title: 'Số TB',
                                                                data:
                                                                    item.sodt),
                                                            Detail_Rows(
                                                                title:
                                                                    'Ngày DKTTTB',
                                                                data: getDateFormat(
                                                                    item.ngayDkTttb)),
                                                            Detail_Rows(
                                                                title:
                                                                    'HRM bán gói',
                                                                data: item
                                                                    .hrmBanGoi),
                                                            Detail_Rows(
                                                                title:
                                                                    'Tên gói',
                                                                data: item
                                                                    .tengoi),
                                                            Detail_Rows(
                                                                title:
                                                                    'Tiền gói',
                                                                data: formatNumber(
                                                                    item.tiengoi)),
                                                            Detail_Rows(
                                                                title:
                                                                    'Chu kì gói',
                                                                data: item
                                                                    .chukyGoi
                                                                    .toString()),
                                                            Detail_Rows(
                                                                title:
                                                                    'Loại phát triển',
                                                                data: item
                                                                    .loaiId
                                                                    .toString()),
                                                            Detail_Rows(
                                                                title:
                                                                    'Trạng thái',
                                                                data: item.trangthaiDahuongLuong ==
                                                                        1
                                                                    ? 'Đã hưởng lương'
                                                                    : 'Chưa hưởng lương'),
                                                            MaterialButton(
                                                              onPressed: () {
                                                                pageTrasition(
                                                                    context,
                                                                    TheoDoiCuocGoiPTM_Detail(
                                                                      sodt: item
                                                                          .sodt,
                                                                      timekey: item
                                                                          .timekey,
                                                                      eload: item
                                                                          .eload,
                                                                      tengoi: item
                                                                          .tengoi,
                                                                      tiengoi: item
                                                                          .tiengoi,
                                                                      thoigianDkgoi:
                                                                          item.thoigianDkgoi,
                                                                      loaiId: item
                                                                          .loaiId,
                                                                      nhanvien:
                                                                          item.nhanvien,
                                                                      nhanvienSmcs:
                                                                          item.nhanvienSmcs,
                                                                      idDonvi: item
                                                                          .idDonvi,
                                                                      tenDonvi:
                                                                          item.tenDonvi,
                                                                      tieudungTkc:
                                                                          item.tieudungTkc,
                                                                      trangthaiDuoctinh:
                                                                          item.trangthaiDuoctinh,
                                                                      tieudungTkc6Th:
                                                                          item.tieudungTkc6Th,
                                                                      nhanvienChucdanh:
                                                                          item.nhanvienChucdanh,
                                                                      nhanvienTruongnhom:
                                                                          item.nhanvienTruongnhom,
                                                                      loaiTb: item
                                                                          .loaiTb,
                                                                      ghichu: item
                                                                          .ghichu,
                                                                      chunhomSmcs:
                                                                          item.chunhomSmcs,
                                                                      trangthaiTbPtm:
                                                                          item.trangthaiTbPtm,
                                                                      ngayDkTttb:
                                                                          item.ngayDkTttb,
                                                                      tinhluongTheoQuyche:
                                                                          item.tinhluongTheoQuyche,
                                                                      trangthaiDahuongLuong:
                                                                          item.trangthaiDahuongLuong,
                                                                      doanhthuDuocGhinhan:
                                                                          item.doanhthuDuocGhinhan,
                                                                      sothangChenhlech:
                                                                          item.sothangChenhlech,
                                                                      eloadDuq:
                                                                          item.eloadDuq,
                                                                      chukyGoi:
                                                                          item.chukyGoi,
                                                                      thulaoThangN:
                                                                          item.thulaoThangN,
                                                                      thulaoThangN3:
                                                                          item.thulaoThangN3,
                                                                      doanhthuDuocGhinhanKpi:
                                                                          item.doanhthuDuocGhinhanKpi,
                                                                      doanhthuTangthem:
                                                                          item.doanhthuTangthem,
                                                                      thulaoThangN1:
                                                                          item.thulaoThangN1,
                                                                      thulaoThangN2:
                                                                          item.thulaoThangN2,
                                                                      userDktb:
                                                                          item.userDktb,
                                                                      hrmDktb: item
                                                                          .hrmDktb,
                                                                      hrmBanGoi:
                                                                          item.hrmBanGoi,
                                                                    ));
                                                              },
                                                              child: const Text(
                                                                  'Xem chi tiết'),
                                                            ),
                                                          ],
                                                        ))),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                    '$pageNumber/${TheoDoiGoiCuocPTM_Variable.totalPages} trang, ${TheoDoiGoiCuocPTM_Variable.totalRecord} mục'),
                                              ),
                                              TheoDoiGoiCuocPTM_Variable
                                                          .totalPages !=
                                                      0
                                                  ? SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Pager(
                                                        currentPage: pageNumber,
                                                        totalPages:
                                                            TheoDoiGoiCuocPTM_Variable
                                                                .totalPages,
                                                        onPageChanged: (page) {
                                                          setState(() {
                                                            pageNumber = page;
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  : const Text(''),
                                            ],
                                          ))
                                        : const Text(
                                            "Lỗi xác thực vui lòng đăng nhập lại"));
                              });
                        } else {
                          return LoadingScreen(
                              nameOfLoadingScreen: 'Đang kiểm tra mạng...');
                        }
                      });

                  // return FutureBuilder(
                  //     future: checkLocalConnectionApi()
                  //         .then((value) => listTheoDoiPTM(
                  //               pageNumber,
                  //               pageSize,
                  //               ngayBatDau,
                  //               ngayKetThuc,
                  //               selectedDV,
                  //               localNhanVien.nhanvien_donvi!,
                  //               localNhanVien.nhanvien_manv!,
                  //               localNhanVien.nhanvien_chucdanh!,
                  //               value,
                  //             )),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.data != null &&
                  //           snapshot.connectionState !=
                  //               ConnectionState.waiting) {
                  //         return Custom_FutureBuilder(
                  //             contextParam: context,
                  //             snapshot: snapshot,
                  //             widgetParam: snapshot.hasData
                  //                 ? SingleChildScrollView(
                  //                     child: Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       for (var item in snapshot.data!)
                  //                         Card(
                  //                             color:
                  //                                 snapshot.data!.indexOf(item) %
                  //                                             2 ==
                  //                                         0
                  //                                     ? isDarkMode
                  //                                         ? Card_colors_dark_1
                  //                                         : Card_colors_1
                  //                                     : isDarkMode
                  //                                         ? Card_colors_dark_2
                  //                                         : Card_colors_2,
                  //                             clipBehavior: Clip.hardEdge,
                  //                             child: InkWell(
                  //                                 splashColor:
                  //                                     Colors.blue.withAlpha(30),
                  //                                 onTap: () {},
                  //                                 child: Column(
                  //                                   children: [
                  //                                     Detail_Rows(
                  //                                         title: 'Tên đơn vị',
                  //                                         data: item.tenDonvi),
                  //                                     Detail_Rows(
                  //                                         title:
                  //                                             'Tên nhân viên',
                  //                                         data: item.nhanvien),
                  //                                     Detail_Rows(
                  //                                         title:
                  //                                             'Thời gian DK gói',
                  //                                         data: getDateFormat(item
                  //                                             .thoigianDkgoi)),
                  //                                     Detail_Rows(
                  //                                         title: 'Hệ thống',
                  //                                         data: item.loaiId),
                  //                                     Detail_Rows(
                  //                                         title: 'Số TB',
                  //                                         data: item.sodt),
                  //                                     Detail_Rows(
                  //                                         title: 'Ngày DKTTTB',
                  //                                         data: getDateFormat(
                  //                                             item.ngayDkTttb)),
                  //                                     Detail_Rows(
                  //                                         title: 'HRM bán gói',
                  //                                         data: item.hrmBanGoi),
                  //                                     Detail_Rows(
                  //                                         title: 'Tên gói',
                  //                                         data: item.tengoi),
                  //                                     Detail_Rows(
                  //                                         title: 'Tiền gói',
                  //                                         data: formatNumber(
                  //                                             item.tiengoi)),
                  //                                     Detail_Rows(
                  //                                         title: 'Chu kì gói',
                  //                                         data: item.chukyGoi
                  //                                             .toString()),
                  //                                     Detail_Rows(
                  //                                         title:
                  //                                             'Loại phát triển',
                  //                                         data: item.loaiId
                  //                                             .toString()),
                  //                                     Detail_Rows(
                  //                                         title: 'Trạng thái',
                  //                                         data: item.trangthaiDahuongLuong ==
                  //                                                 1
                  //                                             ? 'Đã hưởng lương'
                  //                                             : 'Chưa hưởng lương'),
                  //                                     MaterialButton(
                  //                                       onPressed: () {
                  //                                         pageTrasition(
                  //                                             context,
                  //                                             TheoDoiCuocGoiPTM_Detail(
                  //                                               sodt: item.sodt,
                  //                                               timekey: item
                  //                                                   .timekey,
                  //                                               eload:
                  //                                                   item.eload,
                  //                                               tengoi:
                  //                                                   item.tengoi,
                  //                                               tiengoi: item
                  //                                                   .tiengoi,
                  //                                               thoigianDkgoi: item
                  //                                                   .thoigianDkgoi,
                  //                                               loaiId:
                  //                                                   item.loaiId,
                  //                                               nhanvien: item
                  //                                                   .nhanvien,
                  //                                               nhanvienSmcs: item
                  //                                                   .nhanvienSmcs,
                  //                                               idDonvi: item
                  //                                                   .idDonvi,
                  //                                               tenDonvi: item
                  //                                                   .tenDonvi,
                  //                                               tieudungTkc: item
                  //                                                   .tieudungTkc,
                  //                                               trangthaiDuoctinh:
                  //                                                   item.trangthaiDuoctinh,
                  //                                               tieudungTkc6Th:
                  //                                                   item.tieudungTkc6Th,
                  //                                               nhanvienChucdanh:
                  //                                                   item.nhanvienChucdanh,
                  //                                               nhanvienTruongnhom:
                  //                                                   item.nhanvienTruongnhom,
                  //                                               loaiTb:
                  //                                                   item.loaiTb,
                  //                                               ghichu:
                  //                                                   item.ghichu,
                  //                                               chunhomSmcs: item
                  //                                                   .chunhomSmcs,
                  //                                               trangthaiTbPtm:
                  //                                                   item.trangthaiTbPtm,
                  //                                               ngayDkTttb: item
                  //                                                   .ngayDkTttb,
                  //                                               tinhluongTheoQuyche:
                  //                                                   item.tinhluongTheoQuyche,
                  //                                               trangthaiDahuongLuong:
                  //                                                   item.trangthaiDahuongLuong,
                  //                                               doanhthuDuocGhinhan:
                  //                                                   item.doanhthuDuocGhinhan,
                  //                                               sothangChenhlech:
                  //                                                   item.sothangChenhlech,
                  //                                               eloadDuq: item
                  //                                                   .eloadDuq,
                  //                                               chukyGoi: item
                  //                                                   .chukyGoi,
                  //                                               thulaoThangN: item
                  //                                                   .thulaoThangN,
                  //                                               thulaoThangN3: item
                  //                                                   .thulaoThangN3,
                  //                                               doanhthuDuocGhinhanKpi:
                  //                                                   item.doanhthuDuocGhinhanKpi,
                  //                                               doanhthuTangthem:
                  //                                                   item.doanhthuTangthem,
                  //                                               thulaoThangN1: item
                  //                                                   .thulaoThangN1,
                  //                                               thulaoThangN2: item
                  //                                                   .thulaoThangN2,
                  //                                               userDktb: item
                  //                                                   .userDktb,
                  //                                               hrmDktb: item
                  //                                                   .hrmDktb,
                  //                                               hrmBanGoi: item
                  //                                                   .hrmBanGoi,
                  //                                             ));
                  //                                       },
                  //                                       child: const Text(
                  //                                           'Xem chi tiết'),
                  //                                     ),
                  //                                   ],
                  //                                 ))),
                  //                       Align(
                  //                         alignment: Alignment.topLeft,
                  //                         child: Text(
                  //                             '$pageNumber/${TheoDoiGoiCuocPTM_Variable.totalPages} trang, ${TheoDoiGoiCuocPTM_Variable.totalRecord} mục'),
                  //                       ),
                  //                       TheoDoiGoiCuocPTM_Variable.totalPages !=
                  //                               0
                  //                           ? SingleChildScrollView(
                  //                               scrollDirection:
                  //                                   Axis.horizontal,
                  //                               child: Pager(
                  //                                 currentPage: pageNumber,
                  //                                 totalPages:
                  //                                     TheoDoiGoiCuocPTM_Variable
                  //                                         .totalPages,
                  //                                 onPageChanged: (page) {
                  //                                   setState(() {
                  //                                     pageNumber = page;
                  //                                   });
                  //                                 },
                  //                               ),
                  //                             )
                  //                           : const Text(''),
                  //                     ],
                  //                   ))
                  //                 : const Text(''));
                  //       } else {
                  //         return LoadingScreen(
                  //             nameOfLoadingScreen: 'Đang kiểm tra mạng...');
                  //       }
                  //     });


                }))
                //],
                // ),
                //  )
                //  }
                // }
                //  )
              ]),
              //],
            ),
          )),
    );
  }
}
