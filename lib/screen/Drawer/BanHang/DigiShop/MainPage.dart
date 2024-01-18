// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables

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
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/BanHang/DigiShop/Detail.dart';
import 'package:vnptapp/screen/Drawer/BanHang/DigiShop/Logic.dart';
import 'package:vnptapp/screen/Drawer/BanHang/DigiShop/Variable.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';

class DigiShop_MainPage extends StatefulWidget {
  const DigiShop_MainPage({super.key});

  @override
  State<DigiShop_MainPage> createState() => _DigiShop_MainPageState();
}

class _DigiShop_MainPageState extends State<DigiShop_MainPage> {
  Future<void> refresh() async {
    setState(() {});
  }

  int pageNumber = 1;
  int pageSized = 10;
  TextEditingController searchkey = TextEditingController();
  @override
  void initState() {
    searchkey.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(title: 'Thuê bao DDTT PTM DigiShop'),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: Consumer(
            builder: (context, watch, child) {
              var selectedDV =
                  watch.watch(riverpod_instance.selectedTenMoTa11Pbh);
              var selectedMonth =
                  watch.watch(riverpod_instance.selectedMonthMonthYearPicker);
              var selectedYear =
                  watch.watch(riverpod_instance.selectedYearMonthYearPicker);
              return SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.all(paddingSized),
                child: Column(
                  children: [
                    SizedBox(
                      width: widthOfDevice(context) / 1.05,
                      height: 50,
                      child: TextField(
                        controller: searchkey,
                        decoration: const InputDecoration(
                          hintText: 'Tìm kiếm(theo họ tên)',
                          label: Text('Tìm kiếm(theo họ tên)'),
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(19.0)),
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            searchkey.text = text;
                          });
                        },
                      ),
                    ),
                    const TinyWidthSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Custom_MonthYearPicker(),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Custom_DropdownDonViTheoTenMoTa11Pbh(
                          nhanvienDonVi: localNhanVien.nhanvien_donvi!,
                        ),
                      ],
                    ),
                    const TinyWidthSizedBox(),
                    FutureBuilder(
                        future: Future.delayed(Duration(seconds: awaitTime),
                            () => checkLocalConnectionApi()),
                        builder: (context, snapshot1) {
                          if (snapshot1.connectionState !=
                                  ConnectionState.waiting &&
                              snapshot1.data != null) {
                            return FutureBuilder(
                                future: getListDiGiShop(
                                    pageNumber,
                                    pageSized,
                                    selectedDV,
                                    nhanvien_DonVi_MoTa,
                                      localNhanVien.nhanvien_manv_thns,
                                    localNhanVien.nhanvien_chucdanh,
                                    snapshot1.data!,
                                  selectedMonth.toString() + selectedYear.toString(),
                                    searchkey.text),
                                builder: (context, snapshot) {
                                  if (snapshot1.connectionState !=
                                          ConnectionState.waiting &&
                                      snapshot1.data != null) {
                                    return Custom_FutureBuilder(
                                        contextParam: context,
                                        snapshot: snapshot,
                                        widgetParam: snapshot.hasData
                                            ? SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    for (var item
                                                        in snapshot.data!)
                                                      Custom_Card(
                                                          item: item,
                                                          list: snapshot.data,
                                                          widget: Column(
                                                            children: [
                                                              Detail_Rows(
                                                                title:
                                                                    'Phòng bán hàng:',
                                                                data: item.pbh
                                                                    .toString(),
                                                              ),
                                                              Detail_Rows(
                                                                title:
                                                                    'Họ tên:',
                                                                data: item
                                                                    .tenNguoiGt
                                                                    .toString(),
                                                              ),
                                                              Detail_Rows(
                                                                title:
                                                                    'Tài khoản:',
                                                                data: item
                                                                    .userDktttb
                                                                    .toString(),
                                                              ),
                                                              Detail_Rows(
                                                                title:
                                                                    'Số lượng:',
                                                                data: item
                                                                    .soLuong
                                                                    .toString(),
                                                              ),
                                                              MaterialButton(
                                                                onPressed: () {
                                                                  {
                                                                    pageTrasition(
                                                                      context,
                                                                      DigiShop_Detail(
                                                                        maNV: item
                                                                            .maGioiThieu
                                                                            .toString(),
                                                                        tenNV: item
                                                                            .tenNguoiGt
                                                                            .toString(),
                                                                        timeKey:
                                                                            selectedMonth +
                                                                                selectedYear,
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                                child: Text_medium_dark(
                                                                    title:
                                                                        'Xem chi tiết'),
                                                              )
                                                            ],
                                                          )),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                          '$pageNumber/${DigiShop_Variable.totalPage} trang, ${DigiShop_Variable.totalItem} mục'),
                                                    ),
                                                    DigiShop_Variable
                                                                .totalPage !=
                                                            0
                                                        ? SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Pager(
                                                              currentPage:
                                                                  pageNumber,
                                                              totalPages:
                                                                  DigiShop_Variable
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
                                  } else {
                                    return const Center(
                                      child: Text(
                                        'Đang tải dữ liệu',
                                      ),
                                    );
                                  }
                                });
                          } else {
                            return Center(
                              child: LoadingScreen(
                                  nameOfLoadingScreen: 'Đang tải dữ liệu'),
                            );
                          }
                        }),
                  ],
                ),
              ));
            },
          ),
        ));
  }
}
