// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/BanHang/DigiShop/Logic.dart';
import 'package:vnptapp/screen/Drawer/BanHang/DigiShop/Variable.dart';

// ignore: must_be_immutable
class DigiShop_Detail extends StatefulWidget {
  DigiShop_Detail({super.key, required this.maNV, required this.tenNV,required this.timeKey});
  String maNV;
  String tenNV;
  String timeKey;
  @override
  State<DigiShop_Detail> createState() => _DigiShop_DetailState();
}

int pageNumber = 1;
int pageSized = 10;

class _DigiShop_DetailState extends State<DigiShop_Detail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(title: 'Chi tiết NV ${widget.tenNV}'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: Future.delayed(Duration(seconds: awaitTime),
                    () => checkLocalConnectionApi()),
                builder: (context, snapshot1) {
                  if (snapshot1.connectionState != ConnectionState.waiting &&
                      snapshot1.data != null) {
                    return FutureBuilder(
                        future: getDetailDigiShop(pageNumber, pageSized,
                            snapshot1.data!, widget.maNV,widget.timeKey),
                        builder: (context, snapshot) {
                          // if (snapshot1.connectionState !=
                          //         ConnectionState.waiting &&
                          //     snapshot1.data != null) {
                          return Custom_FutureBuilder(
                              contextParam: context,
                              snapshot: snapshot,
                              widgetParam: snapshot.hasData
                                  ? SingleChildScrollView(
                                      child: Column(children: [
                                      for (var item in snapshot.data!)
                                        Custom_Card(
                                            item: item,
                                            list: snapshot.data,
                                            widget: Column(children: [
                                              Detail_Rows(
                                                title: 'Thời gian:',
                                                data: item.timekey
                                                    .toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'SDT:',
                                                data: item.sdt
                                                    .toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Loại thuê bao:',
                                                data: item.loaiThueBao
                                                    .toString(),
                                              ), Detail_Rows(
                                                title: 'Loại SIM:',
                                                data: item.loaiSim
                                                    .toString(),
                                              ),Detail_Rows(
                                                title: 'Mã giới thiệu:',
                                                data: item.maGioiThieu
                                                    .toString(),
                                              ),Detail_Rows(
                                                title: 'Tên người giới thiệu:',
                                                data: item.tenNguoiGt
                                                    .toString(),
                                              ),Detail_Rows(
                                                title: 'User dktttb:',
                                                data: item.userDktttb
                                                    .toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Kết quả:',
                                                data: item.ketQua
                                                    .toString(),
                                              ),
                                              
                                              Detail_Rows(
                                                title: 'Phòng bán hàng:',
                                                data: item.pbh
                                                    .toString(),
                                              ),
                                            ])),
                                            Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                      '$pageNumber/${DigiShop_Variable.totalPageDetail} trang, ${DigiShop_Variable.totalItemDetail} mục'),
                                                ),
                                               DigiShop_Variable.totalPageDetail != 0
                                                    ? SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Pager(
                                                          currentPage:
                                                              pageNumber,
                                                          totalPages:
                                                              DigiShop_Variable
                                                                  .totalPageDetail,
                                                          onPageChanged:
                                                              (page) {
                                                            setState(() {
                                                              pageNumber = page;
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    : const Text(''),
                                    ]))
                                  : const Text(''));
                          //}
                        });
                  } else {
                    return LoadingScreen(nameOfLoadingScreen: 'Đang tải...');
                  }
                })
          ],
        ),
      ),
    );
  }
}
