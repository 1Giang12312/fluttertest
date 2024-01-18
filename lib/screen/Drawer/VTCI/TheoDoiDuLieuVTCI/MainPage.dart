// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_MonthYearPicker.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';
import 'package:vnptapp/screen/Drawer/VTCI/TheoDoiDuLieuVTCI/Detail.dart';
import 'package:vnptapp/screen/Drawer/VTCI/TheoDoiDuLieuVTCI/Logic.dart';
import 'package:vnptapp/screen/Drawer/VTCI/TheoDoiDuLieuVTCI/Variable.dart';

class TheoDoiDuLieuVTCI_MainPage extends StatefulWidget {
  const TheoDoiDuLieuVTCI_MainPage({super.key});

  @override
  State<TheoDoiDuLieuVTCI_MainPage> createState() =>
      _TheoDoiDuLieuVTCI_MainPageState();
}

class DropdownItem {
  final double value;
  final String label;
  DropdownItem(this.value, this.label);
}

class _TheoDoiDuLieuVTCI_MainPageState
    extends State<TheoDoiDuLieuVTCI_MainPage> {
  Future<void> refresh() async {
    setState(() {});
  }

  List<DropdownItem> dropdownItems = [
    DropdownItem(0, 'Không phát sinh lưu lượng'),
    DropdownItem(1, 'Phát sinh lưu lượng'),
    DropdownItem(-1, 'Tất cả'),
  ];
  var selectedLoai;
  var selectedNam;
  int pageNumber = 1;
  int pageSize = 10;
  var namTrienKhai;
  var loai;
  var searchKey;
  var tenDonVi2;
  var trangThai;
  var selectedDonVi;
  String selectedYear = DateTime.now().year.toString();
  String selectedMonth = convertMonthString(DateTime.now().month.toString());

  var selectedDate;
  @override
  void initState() {
    selectedLoai = dropdownItems[2];
    // print(selectedYear + selectedMonth);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(title: 'Theo dõi dữ liệu VTCI'),
        body: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: RefreshIndicator(
                onRefresh: refresh,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Tìm kiếm(theo số điện thoại)...',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(19.0)),
                          ),
                        ),
                        onChanged: (text1) {
                          setState(() {
                            searchKey = text1;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // SingleChildScrollView(
                    //     child: Column(children: [
                    //   FutureBuilder(
                    //       future:checkLocalConnectionApi()
                    //       .then((value) => getListNamTrienKhai(value)),
                    //       builder: (context, snapshot4) {
                    //         if (snapshot4.data != null ||
                    //             snapshot4.connectionState !=
                    //                 ConnectionState.waiting) {
                    //           return DropdownButton(
                    //             hint: const Text('Chọn đơn vị'),
                    //             value: namTrienKhai,
                    //             items: snapshot4.data!.map((e) {
                    //               return DropdownMenuItem(
                    //                 value: namTrienKhai,
                    //                 child: e == null
                    //                     ? const Text('Tất cả đơn vị')
                    //                     : Text(e.toString()),
                    //               );
                    //             }).toList(),
                    //             onChanged: (value) {
                    //               setState(() {
                    //                 namTrienKhai = value;
                    //               });
                    //             },
                    //           );
                    //         } else {
                    //           return Text('');
                    //         }
                    //       }),
                    // ])),
                    Consumer(builder: ((context, ref, child) {
                      var selectedMonth = ref.watch(
                          riverpod_instance.selectedMonthMonthYearPicker);
                      var selectedYear = ref
                          .watch(riverpod_instance.selectedYearMonthYearPicker);
                      return FutureBuilder(
                          future: checkLocalConnectionApi(),
                          builder: (context, snapshot1) {
                            if (snapshot1.connectionState !=
                                    ConnectionState.waiting &&
                                snapshot1.data != null) {
                              return
                                  // FutureBuilder(
                                  //     future: checkAuthorized(snapshot1.data!),
                                  //     builder: (context, snapshot2) {
                                  //       return Custom_FutureBuilder(
                                  //           contextParam: context,
                                  //           snapshot: snapshot2,
                                  //           widgetParam: snapshot2.hasData
                                  //               ?
                                  FutureBuilder(
                                      future: getListVTCI(
                                          pageNumber,
                                          pageSize,
                                          selectedYear.toString() +
                                              selectedMonth.toString(),
                                          localNhanVien.nhanvien_manv_thns!,
                                          localNhanVien.nhanvien_chucdanh!,
                                          localNhanVien.nhanvien_donvi.toString(),
                                          namTrienKhai,
                                          selectedLoai.value,
                                          searchKey,
                                          tenDonVi2,
                                          trangThai,
                                          nhanvien_TenDonVi2,
                                          snapshot1.data!),
                                      builder: (context, snapshot3) {
                                        // if (snapshot3.connectionState !=
                                        //         ConnectionState
                                        //             .waiting &&
                                        //     snapshot3.data != null) {
                                        //   return
                                        return Custom_FutureBuilder(
                                            contextParam: context,
                                            snapshot: snapshot3,
                                            widgetParam: snapshot3.hasData
                                                ? SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            FutureBuilder(
                                                                future: getListNamTrienKhai(
                                                                    snapshot1
                                                                        .data!),
                                                                builder: (context,
                                                                    snapshot4) {
                                                                  if (snapshot4
                                                                              .data !=
                                                                          null ||
                                                                      snapshot4
                                                                              .connectionState !=
                                                                          ConnectionState
                                                                              .waiting) {
                                                                    return DropdownButton(
                                                                      borderRadius: const BorderRadius
                                                                          .all(
                                                                          Radius.circular(
                                                                              20)),
                                                                      hint: const Text(
                                                                          'Chọn năm'),
                                                                      value:
                                                                          namTrienKhai,
                                                                      onChanged:
                                                                          (newValue) {
                                                                        setState(
                                                                            () {
                                                                          namTrienKhai =
                                                                              newValue as int;
                                                                        });
                                                                      },
                                                                      items: snapshot4
                                                                          .data!
                                                                          .map<DropdownMenuItem<int>>((int
                                                                              year) {
                                                                        return DropdownMenuItem<
                                                                            int>(
                                                                          value:
                                                                              year,
                                                                          child: year == 0
                                                                              ? const Text('Tất cả')
                                                                              : Text(year.toString()),
                                                                        );
                                                                      }).toList(),
                                                                    );
                                                                  } else {
                                                                    return const Text(
                                                                        '');
                                                                  }
                                                                }),
                                                            Flexible(
                                                                child: SizedBox(
                                                              width: 50,
                                                            )),
                                                            DropdownButton<
                                                                DropdownItem>(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                      Radius.circular(
                                                                          20)),
                                                              value:
                                                                  selectedLoai,
                                                              onChanged:
                                                                  (newValue) {
                                                                setState(() {
                                                                  selectedLoai =
                                                                      newValue;
                                                                });
                                                              },
                                                              items: dropdownItems.map<
                                                                      DropdownMenuItem<
                                                                          DropdownItem>>(
                                                                  (DropdownItem
                                                                      item) {
                                                                return DropdownMenuItem<
                                                                    DropdownItem>(
                                                                  value: item,
                                                                  child: Text(
                                                                      item.label),
                                                                );
                                                              }).toList(),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            localNhanVien.nhanvien_donvi ==
                                                                        13 ||
                                                                    localNhanVien
                                                                            .nhanvien_donvi ==
                                                                        2
                                                                ? FutureBuilder(
                                                                    future: getTenDonVi2(
                                                                        snapshot1
                                                                            .data!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot5) {
                                                                      if (snapshot5.data !=
                                                                              null ||
                                                                          snapshot5.connectionState !=
                                                                              ConnectionState.waiting) {
                                                                        return DropdownButton(
                                                                          borderRadius: const BorderRadius
                                                                              .all(
                                                                              Radius.circular(20)),
                                                                          hint:
                                                                              const Text('Chọn tên đơn vị'),
                                                                          value:
                                                                              tenDonVi2,
                                                                          onChanged:
                                                                              (newValue) {
                                                                            setState(() {
                                                                              tenDonVi2 = newValue as String;
                                                                            });
                                                                          },
                                                                          items: snapshot5
                                                                              .data!
                                                                              .map<DropdownMenuItem<String>>((String year) {
                                                                            return DropdownMenuItem<String>(
                                                                              value: year,
                                                                              child: year == "null" ? const Text('Tất cả') : Text(year.toString()),
                                                                            );
                                                                          }).toList(),
                                                                        );
                                                                      } else {
                                                                        return const Text(
                                                                            '');
                                                                      }
                                                                    })
                                                                : const Text(
                                                                    ''),
                                                            Flexible(
                                                              child:
                                                                  Custom_MonthYearPicker(),
                                                            )
                                                          ],
                                                        ),
                                                        // Row(
                                                        //   children: [
                                                        //     Column(
                                                        //       children: [

                                                        //         const SizedBox(
                                                        //           height: 10,
                                                        //         ),

                                                        //       ],
                                                        //     ),
                                                        //     Flexible(
                                                        //       child:
                                                        //           const SizedBox(
                                                        //         width: 100,
                                                        //       ),
                                                        //     ),
                                                        //     Column(
                                                        //       children: [

                                                        //         //)
                                                        //       ],
                                                        //     )
                                                        //   ],
                                                        // ),
                                                        for (var item
                                                            in snapshot3.data!)
                                                          Custom_Card(
                                                              item: item,
                                                              list: snapshot3
                                                                  .data,
                                                              widget: Column(
                                                                children: [
                                                                  Detail_Rows(
                                                                    title:
                                                                        'Thời gian :',
                                                                    data: item
                                                                        .timekey
                                                                        .toString(),
                                                                  ),
                                                                  Detail_Rows(
                                                                    title:
                                                                        'Tên đơn vị :',
                                                                    data: item
                                                                        .tenDonvi
                                                                        .toString(),
                                                                  ),
                                                                  Detail_Rows(
                                                                    title:
                                                                        'Sdt :',
                                                                    data: item
                                                                        .sdt
                                                                        .toString(),
                                                                  ),
                                                                  Detail_Rows(
                                                                    title:
                                                                        'Tên thanh toán :',
                                                                    data: item
                                                                        .tenTt
                                                                        .toString(),
                                                                  ),
                                                                  Detail_Rows(
                                                                    title:
                                                                        'Nhân viên phát triển :',
                                                                    data: item
                                                                        .nvPhattrien
                                                                        .toString(),
                                                                  ),
                                                                  MaterialButton(
                                                                    onPressed:
                                                                        () {
                                                                      {
                                                                        pageTrasition(
                                                                          context,
                                                                          TheoDoiDuLieuVTCI_Detail(
                                                                            timekey:
                                                                                item.timekey,
                                                                            nam:
                                                                                item.nam,
                                                                            ngaySd:
                                                                                item.ngaySd,
                                                                            tenDonvi:
                                                                                item.tenDonvi,
                                                                            sdt:
                                                                                item.sdt,
                                                                            tenTt:
                                                                                item.tenTt,
                                                                            diachiTt:
                                                                                item.diachiTt,
                                                                            goi:
                                                                                item.goi,
                                                                            loai:
                                                                                item.loai,
                                                                            psll:
                                                                                item.psll,
                                                                            doanhThu:
                                                                                item.doanhThu,
                                                                            nvPhattrien:
                                                                                item.nvPhattrien,
                                                                            maNvtc:
                                                                                item.maNvtc,
                                                                            tenNvtc:
                                                                                item.tenNvtc,
                                                                            llData:
                                                                                item.llData,
                                                                            soNgayThang:
                                                                                item.soNgayThang,
                                                                            trangthaipheduyetQuy:
                                                                                item.trangthaipheduyetQuy,
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                    child: const Text(
                                                                        'Xem chi tiết'),
                                                                  )
                                                                ],
                                                              )),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                              '$pageNumber/${TheoDoiDuLieuVTCI_Variable.totalPage} trang, ${TheoDoiDuLieuVTCI_Variable.totalItem} mục'),
                                                        ),
                                                        TheoDoiDuLieuVTCI_Variable
                                                                    .totalPage !=
                                                                0
                                                            ? SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Pager(
                                                                  currentPage:
                                                                      pageNumber,
                                                                  totalPages:
                                                                      TheoDoiDuLieuVTCI_Variable
                                                                          .totalPage,
                                                                  onPageChanged:
                                                                      (page) {
                                                                    setState(
                                                                        () {
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
                                      });
                              //  else {
                              //   return LoadingSreen(
                              //       nameOfLoadingScreen:
                              //           'Đang tải dữ liệu');
                              // }
                            } else {
                              return LoadingScreen(
                                nameOfLoadingScreen: 'Đang kiểm tra mạng...',
                              );
                            }
                          });
                    }))
                  ],
                )))));
  }
}
