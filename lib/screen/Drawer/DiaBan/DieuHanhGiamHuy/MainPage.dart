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
import 'package:vnptapp/screen/Drawer/DiaBan/DieuHanhGiamHuy/Detail.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/DieuHanhGiamHuy/Logic.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/DieuHanhGiamHuy/Variable.dart';

class DieuHanhGiamHuy_MainPage extends StatefulWidget {
  const DieuHanhGiamHuy_MainPage({super.key});

  @override
  State<DieuHanhGiamHuy_MainPage> createState() =>
      _DieuHanhGiamHuy_MainPageState();
}

class _DieuHanhGiamHuy_MainPageState extends State<DieuHanhGiamHuy_MainPage> {
  Future<void> refresh() async {
    setState(() {});
  }

  TextEditingController keyWord = TextEditingController();

  int pageSize = 10;
  int pageNumber = 1;
  var tenKhuVucC3 = "";
  @override
  void initState() {
    // TODO: implement initState
    keyWord.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(title: 'Điều hành giảm hủy'),
      body: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
              child: Consumer(builder: (context, ref, child) {
            var selectedMonth =
                ref.watch(riverpod_instance.selectedMonthMonthYearPicker);
            var selectedYear =
                ref.watch(riverpod_instance.selectedYearMonthYearPicker);
            return Padding(
              padding: const EdgeInsets.only(right: 8, left: 8,top: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      child: Container(
                    height: 50,
                    child: TextFormField(
                      controller: keyWord,
                      decoration: const InputDecoration(
                        labelText: 'Tìm kiếm(theo tên C3)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                      builder: (context, snapshot1) {
                        if (snapshot1.connectionState !=
                                ConnectionState.waiting &&
                            snapshot1.data != null) {
                          return FutureBuilder(
                              future: getListc2(
                                  pageNumber,
                                  pageSize,
                                  localNhanVien.nhanvien_manv_thns!,
                                  snapshot1.data!,
                                  '$selectedYear${selectedMonth}01',
                                  localNhanVien.nhanvien_donvi!,
                                  int.parse(nhanvien_donvi_Pttb),
                                  keyWord.text),
                              builder: (context, snapshot3) {
                                return Custom_FutureBuilder(
                                    contextParam: context,
                                    snapshot: snapshot3,
                                    widgetParam: snapshot3.hasData
                                        ? SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                for (var item
                                                    in snapshot3.data!)
                                                  Custom_Card(
                                                      item: item,
                                                      list: snapshot3.data,
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
                                                            data: item.tenDvPbh!
                                                                .replaceAll(
                                                                    "Phòng BHKV ",
                                                                    ""),
                                                          ),
                                                          Detail_Rows(
                                                            title:
                                                                'Tên địa bàn C3:',
                                                            data: item.tenKvC3,
                                                          ),
                                                          MaterialButton(
                                                            onPressed: () {
                                                              {
                                                                pageTrasition(
                                                                  context,
                                                                  DieuHanhGiamHuy_Detail(
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
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                      '$pageNumber/${DieuHanhGiamHuy_Variable.totalPage} trang , ${DieuHanhGiamHuy_Variable.totalRecord} mục'),
                                                ),
                                                DieuHanhGiamHuy_Variable
                                                            .totalPage !=
                                                        0
                                                    ? SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Pager(
                                                          currentPage:
                                                              pageNumber,
                                                          totalPages:
                                                              DieuHanhGiamHuy_Variable
                                                                  .totalPage,
                                                          onPageChanged:
                                                              (page) {
                                                            setState(() {
                                                              pageNumber = page;
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    : const Text(''),
                                              ],
                                            ),
                                          )
                                        : const Text(
                                            'Có lỗi khi xác thực vui lòng đăng nhập lại'));
                              });
                        } else {
                          return LoadingScreen(
                              nameOfLoadingScreen: 'Đang kiểm tra mạng');
                        }
                      })
                ],
              ),
            );
          }))),
    );
  }
}
