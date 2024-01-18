// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names
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
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/ChiTietSanLuongVT_CNTT/ExcelMainPage.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/ChiTietSanLuongVT_CNTT/Logic.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/ChiTietSanLuongVT_CNTT/Variable.dart';

class ChiTietSanLuongVT_CNTT extends StatefulWidget {
  const ChiTietSanLuongVT_CNTT({super.key});

  @override
  State<ChiTietSanLuongVT_CNTT> createState() => _ChiTietSanLuongVT_CNTTState();
}

class DropdownItem {
  final String value;
  final String label;
  DropdownItem(this.value, this.label);
}

class _ChiTietSanLuongVT_CNTTState extends State<ChiTietSanLuongVT_CNTT> {
  DateTime? selectedDate;
  var selectedDonViBrcd;
  var selectedDonViDdtt;
  var selectedDonViDdts;
  // String selectedYear = DateTime.now().year.toString();
  // String selectedMonth = DateTime.now().month.toString();
  List<DropdownItem> dropdownItems = [
    DropdownItem('1', 'Phát triển thuê bao trả trước'),
    DropdownItem('2', 'Phát triển thuê bao trả sau'),
    DropdownItem('3', 'Phát triển BRCD'),
  ];
  DropdownItem? selectedValue;
  int pageNumber = 1;
  int pageSized = 10;
  @override
  void initState() {
    selectedValue = dropdownItems[0];
    super.initState();
  }

  Future<void> refresh() async {
    setState(() {});
  }

  // List<HeSoQuyDoiBrcd> lstBrcd(
  //     int pageNumber,
  //     int pageSize,
  //     String month,
  //     String year,
  //     String MaNV_THNS,
  //     var donViID,
  //     int nhanVienDonvi,
  //     int chucDanh,
  //     String subUrlApi) {
  //   List<HeSoQuyDoiBrcd> list = lstBrcd(pageNumber, pageSize, month, year,
  //       MaNV_THNS, donViID, nhanVienDonvi, chucDanh, subUrlApi);
  //   return list;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(title: 'Chi tiết sản lượng VT-CNTT'),
      body: RefreshIndicator(
          onRefresh: refresh,
          child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: SingleChildScrollView(
                  child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: DropdownButton<DropdownItem>(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        value: selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        },
                        items: dropdownItems
                            .map<DropdownMenuItem<DropdownItem>>(
                                (DropdownItem item) {
                          return DropdownMenuItem<DropdownItem>(
                            value: item,
                            child: Text_medium_dark(title: item.label),
                          );
                        }).toList(),
                      ),
                    ),
                    // Flexible(
                    //   child: ElevatedButton(
                    //     onPressed: () async {
                    //       String? locale;
                    //       final localeObj =
                    //           locale != null ? Locale(locale) : null;
                    //       final selected = await showMonthYearPicker(
                    //         context: context,
                    //         initialDate: selectedDate ?? DateTime.now(),
                    //         firstDate: DateTime(2019),
                    //         lastDate: DateTime(2030),
                    //         locale: localeObj,
                    //       );
                    //       if (selected != null) {
                    //         setState(() {
                    //           selectedDate = selected;
                    //           selectedMonth = convertMonth(selectedDate!.month);
                    //           selectedYear = selectedDate!.year.toString();
                    //         });
                    //       }
                    //     },
                    //     child: Text('Tháng $selectedMonth năm $selectedYear'),
                    //   ),
                    // )
                    Flexible(child: Custom_MonthYearPicker())
                  ],
                ),
                selectedValue!.value == '1'
                    ? FutureBuilder(
                        future: Future.delayed(Duration(seconds: awaitTime),
                            () => checkLocalConnectionApi()),
                        builder: ((context, snapshot1) {
                          if (snapshot1.data == null &&
                              snapshot1.connectionState ==
                                  ConnectionState.waiting) {
                            return LoadingScreen(
                              nameOfLoadingScreen: 'Đang kiểm tra mạng...',
                            );
                          } else if (snapshot1.hasError) {
                            // Xử lý lỗi khi có lỗi xảy ra
                            return Text('Đã xảy ra lỗi: ${snapshot1.error}');
                          } else {
                            return Consumer(builder: (context, watch, child) {
                              var selectedDV = watch.watch(
                                  riverpod_instance.selectedTenDonVi11Pbh);
                              var selectedMonth = watch.watch(riverpod_instance
                                  .selectedMonthMonthYearPicker);
                              var selectedYear = watch.watch(riverpod_instance
                                  .selectedYearMonthYearPicker);
                              return FutureBuilder(
                                  future: listDdtt(
                                      pageNumber,
                                      pageSized,
                                      selectedMonth.toString(),
                                      selectedYear.toString(),
                                      localNhanVien.nhanvien_manv!,
                                      nhanvien_TenDonVi,
                                      selectedDV,
                                      localNhanVien.nhanvien_chucdanh
                                          .toString(),
                                      snapshot1.data!),
                                  builder: ((context, snapshot) {
                                    if (snapshot1.data == null &&
                                        snapshot1.connectionState ==
                                            ConnectionState.waiting) {
                                      return LoadingScreen(
                                        nameOfLoadingScreen:
                                            'Đang kiểm tra mạng...',
                                      );
                                    } else {
                                      return Custom_FutureBuilder(
                                          contextParam: context,
                                          snapshot: snapshot,
                                          widgetParam: snapshot.hasData
                                              ? SingleChildScrollView(
                                                  child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Custom_DropDownDonViTheoTen11PBH(
                                                          nhanvienDonVi:
                                                              localNhanVien
                                                                  .nhanvien_donvi!,
                                                        ),
                                                        // Flexible(
                                                        //     child: SizedBox(
                                                        //   width: 10,
                                                        // )),
                                                        Flexible(
                                                            child:
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () async {
                                                                      pageTrasition(
                                                                          context,
                                                                          ChiTietSanLiongVT_CNTT_Excel_MainPage(
                                                                            //future: callBackForExcelDdtt,
                                                                            ddtt:
                                                                                true,
                                                                            month:
                                                                                selectedMonth,
                                                                            year:
                                                                                selectedYear,
                                                                            selectedValue:
                                                                                selectedDV,
                                                                            tongSoLuong:
                                                                                ChiTietSanLuongVT_CNTT_Variable.totalItemDdtt,
                                                                          ));
                                                                    },
                                                                    child: const Text(
                                                                        'Xuất excel')))
                                                      ],
                                                    ),
                                                    for (var item
                                                        in snapshot.data!)
                                                      Custom_Card(
                                                        item: item,
                                                        list: snapshot.data,
                                                        widget: Column(
                                                          children: [
                                                            Detail_Rows(
                                                              title:
                                                                  'Thời gian:',
                                                              data:
                                                                  item.timekey!,
                                                            ),
                                                            Detail_Rows(
                                                              title:
                                                                  'Tên đơn vị:',
                                                              data: item.donvi!,
                                                            ),
                                                            Detail_Rows(
                                                              title:
                                                                  'Tên nhân viên:',
                                                              data: item
                                                                  .nhanvienHoten!,
                                                            ),
                                                            Detail_Rows(
                                                              title:
                                                                  'SDT bán gói:',
                                                              data: item.sodt!,
                                                            ),
                                                            Detail_Rows(
                                                              title: 'Tên gói:',
                                                              data:
                                                                  item.tengoi!,
                                                            ),
                                                            Detail_Rows(
                                                              title:
                                                                  'Tiền gói:',
                                                              data: formatNumber(
                                                                  item.tiengoi),
                                                            ),
                                                            Detail_Rows(
                                                              title:
                                                                  'Thời gian bán gói:',
                                                              data: covertDatetime(
                                                                  item.thoigianDkgoi!),
                                                            ),
                                                            Detail_Rows(
                                                              title:
                                                                  'Hệ số quy đổi:',
                                                              data: item
                                                                  .hesoQuydoi
                                                                  .toString(),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                          '$pageNumber/${ChiTietSanLuongVT_CNTT_Variable.totalPageDdtt} trang, ${ChiTietSanLuongVT_CNTT_Variable.totalItemDdtt} mục'),
                                                    ),
                                                    ChiTietSanLuongVT_CNTT_Variable
                                                                .totalPageDdtt !=
                                                            0
                                                        ? SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Pager(
                                                              currentPage:
                                                                  pageNumber,
                                                              totalPages:
                                                                  ChiTietSanLuongVT_CNTT_Variable
                                                                      .totalPageDdtt,
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
                                                    const LargeHeightSizedBox()
                                                  ],
                                                ))
                                              : const Text(
                                                  'Lỗi không xác định khi thực hiện xác thực'));
                                    }
                                  }));
                            });
                          }
                        }))
                    : selectedValue!.value == '2' // trả sau
                        ? FutureBuilder(
                            future: Future.delayed(Duration(seconds: awaitTime),
                                () => checkLocalConnectionApi()),
                            builder: ((context, snapshot1) {
                              if (snapshot1.data == null ||
                                  snapshot1.connectionState ==
                                      ConnectionState.waiting) {
                                return LoadingScreen(
                                  nameOfLoadingScreen: 'Đang kiểm tra mạng...',
                                );
                              } else if (snapshot1.hasError) {
                                // Xử lý lỗi khi có lỗi xảy ra
                                return Text(
                                    'Có lỗi xảy ra: ${snapshot1.error}');
                              } else {
                                return Consumer(
                                    builder: ((context, ref, child) {
                                  var selectedDV = ref.watch(
                                      riverpod_instance.selectedTenDonVi11Pbh);
                                  var selectedMonth = ref.watch(
                                      riverpod_instance
                                          .selectedMonthMonthYearPicker);
                                  var selectedYear = ref.watch(riverpod_instance
                                      .selectedYearMonthYearPicker);
                                  return FutureBuilder(
                                      future: Future.delayed(
                                          Duration(seconds: awaitTime),
                                          () => listDdts(
                                              pageNumber,
                                              pageSized,
                                              selectedMonth.toString(),
                                              selectedYear.toString(),
                                              localNhanVien.nhanvien_manv_thns!,
                                              nhanvien_TenDonVi,
                                              selectedDV,
                                              localNhanVien.nhanvien_chucdanh!
                                                  .toString(),
                                              snapshot1.data!)),
                                      builder: ((context, snapshot2) {
                                        return Custom_FutureBuilder(
                                            contextParam: context,
                                            snapshot: snapshot2,
                                            widgetParam: snapshot2.hasData
                                                ? SingleChildScrollView(
                                                    child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Custom_DropDownDonViTheoTen11PBH(
                                                            nhanvienDonVi:
                                                                localNhanVien
                                                                    .nhanvien_donvi!,
                                                          ),
                                                          Flexible(
                                                            child:
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () async {
                                                                      pageTrasition(
                                                                          context,
                                                                          ChiTietSanLiongVT_CNTT_Excel_MainPage(
                                                                            ddts:
                                                                                true,
                                                                            month:
                                                                                selectedMonth,
                                                                            year:
                                                                                selectedYear,
                                                                            selectedValue:
                                                                                selectedDV,
                                                                            tongSoLuong:
                                                                                ChiTietSanLuongVT_CNTT_Variable.totalItemDdts,
                                                                          ));
                                                                    },
                                                                    child: const Text(
                                                                        'Xuất excel')),
                                                          )
                                                        ],
                                                      ),
                                                      for (var item
                                                          in snapshot2.data!)
                                                        Custom_Card(
                                                          item: item,
                                                          list: snapshot2.data,
                                                          widget: Column(
                                                            children: [
                                                              Detail_Rows(
                                                                  title:
                                                                      'Thời gian:',
                                                                  data: item
                                                                          .timeKey ??
                                                                      'null'),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Tên đơn vị:',
                                                                  data: item
                                                                          .tenDv ??
                                                                      'null'),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Tên nhân viên:',
                                                                  data: item
                                                                      .tenNv!),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Thuê bao:',
                                                                  data: item
                                                                          .maTb ??
                                                                      'null'),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Tên gói:',
                                                                  data: item
                                                                          .goicuoc ??
                                                                      'null'),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Tiền gói:',
                                                                  data: formatNumber(
                                                                      item.giacuoc)),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Thời gian phát triển:',
                                                                  data: convertYearMonth(
                                                                      item.ngaySd!)),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Hệ số quy đổi:',
                                                                  data: item
                                                                      .hesoQuydoi
                                                                      .toString()),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Thuê bao:',
                                                                  data: item
                                                                          .tenTb ??
                                                                      'null'),
                                                            ],
                                                          ),
                                                        ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                            '$pageNumber/${ChiTietSanLuongVT_CNTT_Variable.totalPageDdts} trang, ${ChiTietSanLuongVT_CNTT_Variable.totalItemDdts} mục'),
                                                      ),
                                                      ChiTietSanLuongVT_CNTT_Variable
                                                                  .totalPageDdts !=
                                                              0
                                                          ? SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Pager(
                                                                currentPage:
                                                                    pageNumber,
                                                                totalPages:
                                                                    ChiTietSanLuongVT_CNTT_Variable
                                                                        .totalPageDdts,
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
                                                      const LargeHeightSizedBox()
                                                    ],
                                                  ))
                                                : const Text(''));
                                      }));
                                }));
                              }
                            }))
                        : FutureBuilder(
                            future: Future.delayed(Duration(seconds: awaitTime),
                                () => checkLocalConnectionApi()),
                            builder: ((context, snapshot1) {
                              if (snapshot1.data == null ||
                                  snapshot1.connectionState ==
                                      ConnectionState.waiting) {
                                return LoadingScreen(
                                  nameOfLoadingScreen: 'Đang kiểm tra mạng...',
                                );
                              } else if (snapshot1.hasError) {
                                // Xử lý lỗi khi có lỗi xảy ra
                                return Text(
                                    'Có lỗi xảy ra: ${snapshot1.error}');
                              } else {
                                return Consumer(builder: (context, ref, child) {
                                  var selectedDV = ref.watch(
                                      riverpod_instance.selectedIdDonVi11Pbh);
                                  var selectedMonth = ref.watch(
                                      riverpod_instance
                                          .selectedMonthMonthYearPicker);
                                  var selectedYear = ref.watch(riverpod_instance
                                      .selectedYearMonthYearPicker);
                                  return FutureBuilder(
                                      future: Future.delayed(
                                          Duration(seconds: awaitTime),
                                          () => listBrcd(
                                              pageNumber,
                                              pageSized,
                                              selectedMonth.toString(),
                                              selectedYear.toString(),
                                              localNhanVien.nhanvien_manv_thns!,
                                              selectedDV,
                                              localNhanVien.nhanvien_donvi!,
                                              localNhanVien.nhanvien_chucdanh!,
                                              snapshot1.data!)),
                                      builder: ((context, snapshot) {
                                        return Custom_FutureBuilder(
                                            contextParam: context,
                                            snapshot: snapshot,
                                            widgetParam: snapshot.hasData
                                                ? SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Custom_DropdownDonViTheoId11Pbh(
                                                                nhanvienDonVi:
                                                                    localNhanVien
                                                                        .nhanvien_donvi!),
                                                            Flexible(
                                                                child:
                                                                    ElevatedButton(
                                                                        onPressed:
                                                                            () async {
                                                                          pageTrasition(
                                                                              context,
                                                                              ChiTietSanLiongVT_CNTT_Excel_MainPage(
                                                                                //future: callBackForExcelDdtt,
                                                                                brcd: true,
                                                                                month: selectedMonth,
                                                                                year: selectedYear,
                                                                                selectedValue: selectedDV,
                                                                                tongSoLuong: ChiTietSanLuongVT_CNTT_Variable.totalItemBrcd,
                                                                              ));
                                                                        },
                                                                        child: const Text(
                                                                            'Xuất excel'))),
                                                          ],
                                                        ),
                                                        for (var item
                                                            in snapshot.data!)
                                                          Custom_Card(
                                                            item: item,
                                                            list: snapshot.data,
                                                            widget: Column(
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Detail_Rows(
                                                                        title:
                                                                            'Tên nhân viên:',
                                                                        data: item.tenNv ??
                                                                            'null'),
                                                                    Detail_Rows(
                                                                        title:
                                                                            'Mã thuê bao:',
                                                                        data: item.maTb ??
                                                                            'null'),
                                                                    Detail_Rows(
                                                                        title:
                                                                            'Loại hình:',
                                                                        data: item.loaihinhTb ??
                                                                            'null'),
                                                                    Detail_Rows(
                                                                        title:
                                                                            'Giá cước:',
                                                                        data: formatNumber(
                                                                            item.cuocTg)),
                                                                    Detail_Rows(
                                                                        title:
                                                                            'Thời gian phát triển:',
                                                                        data: item.ngayHt ??
                                                                            'null'),
                                                                    Detail_Rows(
                                                                        title:
                                                                            'Hệ số quy đổi:',
                                                                        data: item
                                                                            .hesoQuydoi
                                                                            .toString()),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                              '$pageNumber/${ChiTietSanLuongVT_CNTT_Variable.totalPageBrcd} trang, ${ChiTietSanLuongVT_CNTT_Variable.totalItemBrcd} mục'),
                                                        ),
                                                        ChiTietSanLuongVT_CNTT_Variable
                                                                    .totalPageBrcd !=
                                                                0
                                                            ? SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Pager(
                                                                  currentPage:
                                                                      pageNumber,
                                                                  totalPages:
                                                                      ChiTietSanLuongVT_CNTT_Variable
                                                                          .totalPageBrcd,
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
                                                        const LargeHeightSizedBox()
                                                      ],
                                                    ),
                                                  )
                                                : const Text(''));
                                      }));
                                });
                              }
                            }))
              ])))),
    );
  }
}
