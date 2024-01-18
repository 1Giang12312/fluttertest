// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/BanHang/ShopVNPT/Logic.dart';
import 'package:vnptapp/screen/Drawer/BanHang/ShopVNPT/Variable.dart';

// ignore: must_be_immutable
class ShopVNPT_Detail extends StatefulWidget {
  ShopVNPT_Detail({super.key, required this.maNV, required this.tenNV, required this.trangThaiGiao});
  String maNV;
  String tenNV;
  String trangThaiGiao;
  @override
  State<ShopVNPT_Detail> createState() => _ShopVNPT_DetailState();
}

int pageNumber = 1;
int pageSized = 10;

class _ShopVNPT_DetailState extends State<ShopVNPT_Detail> {
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
                        future: getDetailShopVNPT(pageNumber, pageSized,
                            snapshot1.data!, widget.maNV,widget.trangThaiGiao),
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
                                                title: 'Mã đơn hàng:',
                                                data: item.maDonHang.toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Số thuê bao:',
                                                data: item.soThueBao.toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Loại thuê bao:',
                                                data: item.loaiTb.toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Nhân viên giao hàng:',
                                                data:
                                                    item.nvGiaoHang.toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Trạng thái:',
                                                data: item.trangThai.toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Trạng thái giao:',
                                                data: item.trangThaiGiao
                                                    .toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Loại SIM:',
                                                data: item.loaiSim.toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Mã SMCS:',
                                                data: item.maSmcs.toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Phòng bán hàng:',
                                                data: item.pbh.toString(),
                                              ),
                                            ])),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            '$pageNumber/${ShopVNPT_Variable.totalPageDetail} trang, ${ShopVNPT_Variable.totalItemDetail} mục'),
                                      ),
                                      ShopVNPT_Variable.totalPageDetail != 0
                                          ? SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Pager(
                                                currentPage: pageNumber,
                                                totalPages: ShopVNPT_Variable
                                                    .totalPageDetail,
                                                onPageChanged: (page) {
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
