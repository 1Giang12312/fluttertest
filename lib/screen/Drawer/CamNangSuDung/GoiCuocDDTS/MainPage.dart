// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_SizedBox.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/screen/Drawer/CamNangSuDung/GoiCuocDDTS/Detail.dart';
import 'package:vnptapp/screen/Drawer/CamNangSuDung/GoiCuocDDTS/Logic.dart';
import 'package:vnptapp/screen/Drawer/CamNangSuDung/GoiCuocDDTS/Variable.dart';

class GoiCuocDDTS_MainPage extends StatefulWidget {
  const GoiCuocDDTS_MainPage({super.key});

  @override
  State<GoiCuocDDTS_MainPage> createState() => _GoiCuocDDTS_MainPageState();
}

var searchkey = '';
var text1 = '';
int pageNumber = 1;
int pageSized = 10;

class _GoiCuocDDTS_MainPageState extends State<GoiCuocDDTS_MainPage> {
  Future<void> refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    text1 = '';
    searchkey = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(title: 'Gói cước di động trả sau'),
        body: RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
                child: Column(children: [
              const TinyHeightSizedBox(),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Tìm kiếm...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    ),
                  ),
                  onChanged: (text1) {
                    setState(() {
                      searchkey = text1;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10,),
               FutureBuilder(
                  future: checkLocalConnectionApi().then((value) =>
                      listGoiCuocDDTS(pageNumber, pageSized, searchkey, value)),
                  builder: (context, snapshot) {
                    return Custom_FutureBuilder(
                        contextParam: context,
                        snapshot: snapshot,
                        widgetParam: snapshot.hasData
                            ? SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                    for (var item in snapshot.data!)
                                      Custom_Card(
                                          item: item,
                                          list: snapshot.data,
                                          widget: Column(
                                            children: [
                                              Detail_Rows(
                                                  title: 'Tên gói cước :',
                                                  data: item.tenGoiCuoc!),
                                              Detail_Rows(
                                                  title: 'Giá gói chu kì 1T :',
                                                  data: formatString(
                                                      item.chuKy1T!)),
                                              Detail_Rows(
                                                  title: 'Giá gói chu kì 3T :',
                                                  data: formatString(
                                                      item.chuKy3T)),
                                              Detail_Rows(
                                                  title: 'Giá gói chu kì 6T:',
                                                  data: formatString(
                                                      item.chuKy6T!)),
                                              Detail_Rows(
                                                  title: 'Giá gói chu kì 9T:',
                                                  data: formatString(
                                                      item.chuKy9T!)),
                                              Detail_Rows(
                                                  title: 'Giá gói chu kì 12T:',
                                                  data: formatString(
                                                      item.chuKy12T!)),
                                              MaterialButton(
                                                onPressed: () {
                                                  pageTrasition(
                                                    context,
                                                    GoiCuocDDTS_Detail(
                                                      tenGoiCuoc:
                                                          item.tenGoiCuoc,
                                                      nhuCau: item.nhuCau,
                                                      thoaiNoiMang:
                                                          item.thoaiNoiMang,
                                                      thoaiNgoaiMang:
                                                          item.thoaiNgoaiMang,
                                                      dataNgay: item.dataNgay,
                                                      dataThang: item.dataThang,
                                                      hetDungLuong:
                                                          item.hetDungLuong,
                                                      sms: item.sms,
                                                      uuDaiKhac: item.uuDaiKhac,
                                                      chuKy1T: item.chuKy1T,
                                                      chuKy3T: item.chuKy3T,
                                                      chuKy6T: item.chuKy6T,
                                                      chuKy9T: item.chuKy9T,
                                                      chuKy12T: item.chuKy12T,
                                                    ),
                                                  );
                                                },
                                                child:
                                                    const Text('Xem chi tiết'),
                                              ),
                                            ],
                                          )),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          '$pageNumber/${GoiCuocDDTS_Variable.totalPage} trang , ${GoiCuocDDTS_Variable.totalItem} mục'),
                                    ),
                                    GoiCuocDDTS_Variable.totalPage != 0
                                        ? SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Pager(
                                              currentPage: pageNumber,
                                              totalPages: GoiCuocDDTS_Variable
                                                  .totalPage,
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
                  })
             
            ]))));
  }
}
