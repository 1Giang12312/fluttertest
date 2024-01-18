// ignore_for_file: file_names, camel_case_types, must_be_immutable
import 'package:flutter/material.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/BanHang/PTTB/Logic.dart';
import 'package:vnptapp/screen/Drawer/BanHang/PTTB/Variable.dart';
class PTTB_Detail extends StatefulWidget {
  PTTB_Detail({super.key, required this.maNV, required this.tenNV});
  String maNV;
  String tenNV;
  @override
  State<PTTB_Detail> createState() => _PTTB_DetailState();
}

int pageNumber = 1;
int pageSized = 10;

class _PTTB_DetailState extends State<PTTB_Detail> {
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
                        future: getDetailPTTB(pageNumber, pageSized,
                            snapshot1.data!, widget.maNV),
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
                                                title: 'Loại kênh:',
                                                data: item.loaiKenh.toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Trạng thái:',
                                                data: item.trangThai.toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Số thuê bao:',
                                                data: item.soTb.toString(),
                                              ),
                                              Detail_Rows(
                                                title: 'Hình thức đăng kí:',
                                                data: item.hinhThucDangKy
                                                    .toString(),
                                              ),
                                            ])),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            '$pageNumber/${  PTTB_Variable.totalPageDetail} trang, ${ PTTB_Variable.totalItemDetail} mục'),
                                      ),
                                      PTTB_Variable.totalPageDetail != 0
                                          ? SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Pager(
                                                currentPage: pageNumber,
                                                totalPages:   PTTB_Variable.totalPageDetail,
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
