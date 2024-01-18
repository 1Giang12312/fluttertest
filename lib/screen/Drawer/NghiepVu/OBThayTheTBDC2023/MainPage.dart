import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_DropdownDonVi.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/OBThayTheTBDC2023/Detail.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/OBThayTheTBDC2023/Logic.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/OBThayTheTBDC2023/Variable.dart';

class OBThayTheTBDC_MaiPage extends StatefulWidget {
  const OBThayTheTBDC_MaiPage({super.key});

  @override
  State<OBThayTheTBDC_MaiPage> createState() => _OBThayTheTBDC_MaiPageState();
}

var searchKey;
var selectedTrangThaiOb;

class DropdownItem {
  final String value;
  final String label;
  DropdownItem(this.value, this.label);
}

class _OBThayTheTBDC_MaiPageState extends State<OBThayTheTBDC_MaiPage> {
  Future<void> refresh() async {
    setState(() {});
  }

  List<DropdownItem> dropdownItems = [
    DropdownItem('null', 'Tất cả'),
    DropdownItem('Chưa OB', 'Chưa OB'),
    DropdownItem('Đã OB', 'Đã OB'),
  ];
  @override
  void initState() {
    selectedTrangThaiOb = dropdownItems[0];
    searchKey = "";
    super.initState();
  }

  int pageNumber = 1;
  int pageSize = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(
        title: 'OB thay thế TBDC 2023',
      ),
      body: RefreshIndicator(
          onRefresh: refresh,
          child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: SingleChildScrollView(
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
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: 'Tìm kiếm(theo tên hoặc mã thuê bao)...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    localNhanVien.nhanvien_donvi == 13 ||
                            localNhanVien.nhanvien_donvi == 2
                        ? Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Custom_DropdownDonViTheoId11Pbh(
                                    nhanvienDonVi:
                                        localNhanVien.nhanvien_donvi!),
                              ),
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                    child: Center(
                                        child: DropdownButton<DropdownItem>(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(borderRadius)),
                                  value: selectedTrangThaiOb,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedTrangThaiOb = newValue;
                                    });
                                  },
                                  items: dropdownItems
                                      .map<DropdownMenuItem<DropdownItem>>(
                                          (DropdownItem item) {
                                    return DropdownMenuItem<DropdownItem>(
                                      value: item,
                                      child:
                                          Text_medium_dark(title: item.label),
                                    );
                                  }).toList(),
                                ))),
                              )
                            ],
                          )
                        : SizedBox(
                            child: Center(
                                child: DropdownButton<DropdownItem>(
                            borderRadius:
                                BorderRadius.all(Radius.circular(borderRadius)),
                            value: selectedTrangThaiOb,
                            onChanged: (newValue) {
                              setState(() {
                                selectedTrangThaiOb = newValue;
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
                          ))),
                    const SizedBox(
                      height: 9,
                    ),
                    Consumer(builder: (context, ref, child) {
                      var selectedDVId =
                          ref.watch(riverpod_instance.selectedIdDonVi11Pbh);
                      return FutureBuilder(
                          future: checkLocalConnectionApi(),
                          builder: ((context, snapshot) {
                            if (snapshot.data != null &&
                                snapshot.connectionState !=
                                    ConnectionState.waiting) {
                              return FutureBuilder(
                                  future: listObThayThe(
                                      pageNumber,
                                      pageSize,
                                      localNhanVien.nhanvien_smcs!,
                                      snapshot.data!,
                                      localNhanVien.nhanvien_donvi!,
                                      selectedDVId,
                                      selectedTrangThaiOb.value,
                                      searchKey,
                                      localNhanVien.nhanvien_chucdanh
                                          .toString()),
                                  builder: ((context, snapshot1) {
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
                                                                  title:
                                                                      'Tên đơn vị:',
                                                                  data: item
                                                                      .donviTen
                                                                      .toString()),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Mã thuê bao:',
                                                                  data: item
                                                                      .maTb
                                                                      .toString()),
                                                              Detail_Rows(
                                                                  title: 'SDT:',
                                                                  data: item.sdt
                                                                      .toString()),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Mã TT:',
                                                                  data: item
                                                                      .maTt
                                                                      .toString()),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Tên thanh toán:',
                                                                  data: item
                                                                      .tenTt
                                                                      .toString()),
                                                              Detail_Rows(
                                                                  title:
                                                                      'Trạng thái OB:',
                                                                  data: item.userCapNhat
                                                                              .toString() ==
                                                                          "null"
                                                                      ? "Chưa OB"
                                                                      : "Đã OB"),
                                                              MaterialButton(
                                                                onPressed: () {
                                                                  {
                                                                    pageTrasition(
                                                                      context,
                                                                      OBThayTheTBDC2023_Detail(
                                                                        obThayTheTbdc2023:
                                                                            item,
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                                child: Text_medium_dark(
                                                                    title:
                                                                        'Xem chi tiết'),
                                                              )
                                                              //         Detail_Rows(
                                                              //     title:
                                                              //         'Tên gói:',
                                                              //     data: item
                                                              //         .tenGoi
                                                              //         .toString()),
                                                              //         Detail_Rows(
                                                              //     title:
                                                              //         'Đại chỉ:',
                                                              //     data: item
                                                              //         .diaChiLd
                                                              //         .toString())
                                                            ],
                                                          )),
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                          '$pageNumber/${OBThayTheTBDC2023_Variable.totalPages} trang, ${OBThayTheTBDC2023_Variable.totalRecords} mục'),
                                                    ),
                                                    OBThayTheTBDC2023_Variable
                                                                .totalPages !=
                                                            0
                                                        ? SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Pager(
                                                              currentPage:
                                                                  pageNumber,
                                                              totalPages:
                                                                  OBThayTheTBDC2023_Variable
                                                                      .totalPages,
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
                                            : Text('data'));
                                  }));
                            } else {
                              return LoadingScreen(
                                  nameOfLoadingScreen: 'Đang kiểm tra mạng');
                            }
                          }));
                    })
                  ],
                ),
              ))),
    );
  }
}
