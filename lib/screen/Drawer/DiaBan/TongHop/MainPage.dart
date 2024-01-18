import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_MonthYearPicker.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/TongHop/Detail.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/TongHop/Logic.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/TongHop/Variable.dart';

class TongHop_MainPage extends StatefulWidget {
  const TongHop_MainPage({super.key});

  @override
  State<TongHop_MainPage> createState() => _TongHop_MainPageState();
}

class _TongHop_MainPageState extends State<TongHop_MainPage> {
  Future<void> refresh() async {
    setState(() {});
  }

  TextEditingController keyWord = TextEditingController();

  int pageNumber = 1;
  int pageSize = 10;
  @override
  void initState() {
    // TODO: implement initState
    keyWord.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(title: 'Tổng hợp'),
      body: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
            child: Consumer(builder: ((context, ref, child) {
              var selectedMonth =
                  ref.watch(riverpod_instance.selectedMonthMonthYearPicker);
              var selectedYear =
                  ref.watch(riverpod_instance.selectedYearMonthYearPicker);
              return Padding(
                padding: const EdgeInsets.only(left: 8, right: 8,top: 8),
                child: Column(
                  children: [
                    SizedBox(
                        child: Container(
                      height: 50,
                      child: TextFormField(
                        controller: keyWord,
                        decoration: const InputDecoration(
                          labelText: 'Tìm kiếm(theo tên C3)',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            keyWord.text = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Tìm kiếm(theo sdt) không được để trống";
                          } else {
                            return null;
                          }
                        },
                      ),
                    )),
                    Custom_MonthYearPicker(),
                    FutureBuilder(
                        future: checkLocalConnectionApi(),
                        builder: (context, snapshot) {
                          if (snapshot.data != null ||
                              snapshot.connectionState !=
                                  ConnectionState.waiting) {
                            return FutureBuilder(
                                future: getlistTongHop(
                                    pageNumber,
                                    pageSize,
                                    localNhanVien.nhanvien_manv_thns!,
                                    snapshot.data!,
                                    '$selectedYear${selectedMonth}01',
                                    localNhanVien.nhanvien_donvi!,
                                    nhanvien_donvi_Pttb,
                                    localNhanVien.nhanvien_chucdanh.toString(),
                                    keyWord.text),
                                builder: (context, snapshot1) {
                                  return Custom_FutureBuilder(
                                      snapshot: snapshot1,
                                      contextParam: context,
                                      widgetParam: snapshot1.hasData
                                          ? SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  for (var item
                                                      in snapshot1.data!)
                                                    Custom_Card(
                                                        item: item,
                                                        list: snapshot1.data,
                                                        widget: Column(
                                                          children: [
                                                            Detail_Rows(
                                                              title: 'Tháng:',
                                                              data: timeKeyToMonthYear(
                                                                  item.timeKey
                                                                      .toString()),
                                                            ),
                                                            Detail_Rows(
                                                              title:
                                                                  'Tên địa bàn C2:',
                                                              data: item
                                                                  .tenDvPbh!
                                                                  .replaceAll(
                                                                      "Phòng BHKV ",
                                                                      ""),
                                                            ),
                                                            Detail_Rows(
                                                              title:
                                                                  'Tên địa bàn C3:',
                                                              data:
                                                                  item.tenKvC3,
                                                            ),
                                                            MaterialButton(
                                                              onPressed: () {
                                                                {
                                                                  pageTrasition(
                                                                    context,
                                                                    TongHop_Detail(
                                                                      timeKey:
                                                                          '$selectedYear$selectedMonth'
                                                                          '01',
                                                                      tenKhuVucC3:
                                                                          item.tenKvC3!,
                                                                      kvC3id: item
                                                                          .khuvucC3Id!,
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
                                                        '$pageNumber/${TongHop_Variable.totalPage} trang , ${TongHop_Variable.totalRecord} mục'),
                                                  ),
                                                  TongHop_Variable.totalPage !=
                                                          0
                                                      ? SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Pager(
                                                            currentPage:
                                                                pageNumber,
                                                            totalPages:
                                                                TongHop_Variable
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
                                          : const Text(
                                              'Lỗi xác thực vui lòng đăng nhập lại!'));
                                });
                          } else {
                            return LoadingScreen(
                                nameOfLoadingScreen: 'Đang kiểm tra mạng...');
                          }
                        })
                  ],
                ),
              );
            })),
          )),
    );
  }
}
