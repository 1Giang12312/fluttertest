// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_DropdownDonVi.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_SizedBox.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/BanHang/PTTB/Details.dart';
import 'package:vnptapp/screen/Drawer/BanHang/PTTB/Logic.dart';
import 'package:vnptapp/screen/Drawer/BanHang/PTTB/Variable.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';

class PTTB_MainPage extends StatefulWidget {
  const PTTB_MainPage({super.key});

  @override
  State<PTTB_MainPage> createState() => _PTTB_MainPageState();
}

class _PTTB_MainPageState extends State<PTTB_MainPage> {
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
        appBar: Custom_AppBar(title: 'TB DDTT PTM qua User CCBS'),
        body: RefreshIndicator(
            onRefresh: refresh,
            child: Consumer(
              builder: (context, watch, child) {
                var selectedDV =
                    watch.watch(riverpod_instance.selectedTenMoTa11Pbh);
                return SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.all(paddingSized),
                  child: Column(
                    children: [
                      SizedBox(
                        width: widthOfDevice(context) / 1.1,
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
                      Center(
                          child: Custom_DropdownDonViTheoTenMoTa11Pbh(
                        nhanvienDonVi: localNhanVien.nhanvien_donvi!,
                      )),
                      FutureBuilder(
                          future: Future.delayed(Duration(seconds: awaitTime),
                              () => checkLocalConnectionApi()),
                          builder: (context, snapshot1) {
                            if (snapshot1.connectionState !=
                                    ConnectionState.waiting &&
                                snapshot1.data != null) {
                              return FutureBuilder(
                                  future: getListPTTB(
                                      pageNumber,
                                      pageSized,
                                      selectedDV,
                                      nhanvien_DonVi_MoTa,
                                      localNhanVien.nhanvien_manv,
                                      localNhanVien.nhanvien_chucdanh,
                                      snapshot1.data!,
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
                                                                  data: item
                                                                      .phongBanHang
                                                                      .toString(),
                                                                ),
                                                                Detail_Rows(
                                                                  title:
                                                                      'Họ tên:',
                                                                  data: item.hoTen.toString()
                                                                  ,
                                                                ),
                                                                Detail_Rows(
                                                                  title:
                                                                      'Tài khoản:',
                                                                  data: item.taiKhoan.toString(),
                                                                ),
                                                                Detail_Rows(
                                                                  title:
                                                                      'Số lượng:',
                                                                  data: item
                                                                      .soLuong
                                                                      .toString(),
                                                                ),
                                                                MaterialButton(
                                                                  onPressed:
                                                                      () {
                                                                    {
                                                                      pageTrasition(
                                                                        context,
                                                                        PTTB_Detail(
                                                                          maNV: item
                                                                              .taiKhoan
                                                                              .toString(),
                                                                          tenNV: item
                                                                              .hoTen
                                                                              .toString(),
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
                                                            '$pageNumber/${PTTB_Variable.totalPage} trang, ${PTTB_Variable.totalItem} mục'),
                                                      ),
                                                      PTTB_Variable.totalPage !=
                                                              0
                                                          ? SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Pager(
                                                                currentPage:
                                                                    pageNumber,
                                                                totalPages:
                                                                    PTTB_Variable
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
            )));
  }
}
