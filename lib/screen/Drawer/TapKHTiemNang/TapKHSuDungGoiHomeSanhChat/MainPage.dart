import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_DropdownDonVi.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';
import 'package:vnptapp/screen/Drawer/TapKHTiemNang/TapKHSuDungGoiHomeSanhChat/Detail.dart';
import 'package:vnptapp/screen/Drawer/TapKHTiemNang/TapKHSuDungGoiHomeSanhChat/Logic.dart';
import 'package:vnptapp/screen/Drawer/TapKHTiemNang/TapKHSuDungGoiHomeSanhChat/Variable.dart';

class TapKHSuDungGoiHomeSanhChat_MainPage extends StatefulWidget {
  const TapKHSuDungGoiHomeSanhChat_MainPage({super.key});

  @override
  State<TapKHSuDungGoiHomeSanhChat_MainPage> createState() =>
      _TapKHSuDungGoiHomeSanhChat_MainPageState();
}

var searchKey;
int pageNumber = 1;
int pageSize = 10;

class _TapKHSuDungGoiHomeSanhChat_MainPageState
    extends State<TapKHSuDungGoiHomeSanhChat_MainPage> {
  @override
  void initState() {
    searchKey = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> refresh() async {
      setState(() {});
    }

    return Scaffold(
        appBar: Custom_AppBar(title: 'Tập KH dùng gói home Sành - Chất'),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 9,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchKey = value;
                              //  print(searchKey);
                            });
                          },
                          decoration: const InputDecoration(
                              hintText: 'Tìm kiếm(theo tên khách hàng)...',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Custom_DropdownDonViTheoId11Pbh(
                          nhanvienDonVi: localNhanVien.nhanvien_donvi!),
                      Consumer(builder: (context, ref, child) {
                        var selectedDV =
                            ref.watch(riverpod_instance.selectedIdDonVi11Pbh);
                        return FutureBuilder(
                            future: checkLocalConnectionApi(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null &&
                                  snapshot.connectionState !=
                                      ConnectionState.waiting) {




                                return FutureBuilder(
                                    future: getListTapKh(
                                        pageNumber,
                                        pageSize,
                                        selectedDV,
                                        localNhanVien.nhanvien_donvi!,
                                        localNhanVien.nhanvien_smcs!,
                                        localNhanVien.nhanvien_chucdanh
                                            .toString(),
                                        searchKey,
                                        snapshot.data!),
                                    builder: (context, snapshot1) {
                                      return Custom_FutureBuilder(
                                          snapshot: snapshot1,
                                          contextParam: context,
                                          widgetParam: snapshot1.hasData
                                              ? Column(
                                                  children: [
                                                    for (var item
                                                        in snapshot1.data!)
                                                      Custom_Card(
                                                          item: item,
                                                          list: snapshot1.data,
                                                          widget: Column(
                                                            children: [
                                                              Detail_Rows(
                                                                  title: 'PBH:',
                                                                  data: item
                                                                      .donviTen!),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Mã thuê bao:',
                                                                  data: item
                                                                      .maTb!),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Gói cước:',
                                                                  data: item
                                                                      .goiCuoc!),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Tên khách hàng:',
                                                                  data: item
                                                                      .tenKh!),
                                                              // Detail_Rows(
                                                              //     title:
                                                              //         'Tuyến thu:',
                                                              //     data: item
                                                              //         .tuyenThu!),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Khu vực thu:',
                                                                  data: item
                                                                      .khuVucThu!),
                                                              Detail_Rows(
                                                                  title:
                                                                      'SDT liên hệ:',
                                                                  data: item
                                                                      .sdtLienHe!),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Tên nhân viên thu cước:',
                                                                  data: item
                                                                      .nhanvienThucuoc),
                                                              // Detail_Rows(
                                                              //     title:
                                                              //         'Địa chỉ thanh toán:',
                                                              //     data: item
                                                              //         .diaChiThanhToan!),
                                                              MaterialButton(
                                                                  onPressed:
                                                                      () {
                                                                    pageTrasition(
                                                                        context,
                                                                        TapKHSuDungGoiHomeSanhChat_Detail(
                                                                            item.id,
                                                                            item.maTb,
                                                                            item.goiCuoc,
                                                                            item.tenKh,
                                                                            item.sdtLienHe,
                                                                            item.diaChiThanhToan,
                                                                            item.tuyenThu,
                                                                            item.khuVucThu,
                                                                            item.nhanvienThucuoc,
                                                                            item.nhanvienSmcs,
                                                                            item.donviId,
                                                                            item.donviTen));
                                                                  },
                                                                  child: const Text(
                                                                      'Xem chi tiết'))
                                                            ],
                                                          )),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                          '$pageNumber/${TapKHSuDungGoiHomeSanhChat_Variable.totalPage} trang, ${TapKHSuDungGoiHomeSanhChat_Variable.totalItem} mục'),
                                                    ),
                                                    TapKHSuDungGoiHomeSanhChat_Variable
                                                                .totalPage !=
                                                            0
                                                        ? SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Pager(
                                                              currentPage:
                                                                  pageNumber,
                                                              totalPages:
                                                                  TapKHSuDungGoiHomeSanhChat_Variable
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
                                                )
                                              : const Text(''));
                                    });


                              } else {
                                return Center(
                                  child: LoadingScreen(
                                      nameOfLoadingScreen:
                                          'Đang kiểm tra mạng...'),
                                );
                              }
                            });
                      })
                    ],
                  ))),
        ));
  }
}
