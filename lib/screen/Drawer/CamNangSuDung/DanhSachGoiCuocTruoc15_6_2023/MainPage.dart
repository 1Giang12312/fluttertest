// ignore_for_file: camel_case_types, file_names, prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/screen/Drawer/CamNangSuDung/DanhSachGoiCuocTruoc15_6_2023/Logic.dart';
import 'package:vnptapp/screen/Drawer/CamNangSuDung/DanhSachGoiCuocTruoc15_6_2023/Variable.dart';

class DanhSachGoiCuocTruoc15_6_2023_MainPage extends StatefulWidget {
  const DanhSachGoiCuocTruoc15_6_2023_MainPage({super.key});

  @override
  State<DanhSachGoiCuocTruoc15_6_2023_MainPage> createState() =>
      _DanhSachGoiCuocTruoc15_6_2023_MainPageState();
}

class DropdownItem {
  final String value;
  final String label;
  DropdownItem(this.value, this.label);
}

List<DropdownItem> dropdownItems = [
  DropdownItem('Tất cả', 'Tất cả'),
  DropdownItem('Hoạt động', 'Hoạt động'),
  DropdownItem('Dừng', 'Dừng'),
];
DropdownItem? selectedValue;

class dropdownFilter {
  final String value;
  final String label;
  dropdownFilter(this.value, this.label);
}

List<dropdownFilter> dropdownItemsFilters = [
  dropdownFilter('Tất cả', 'Tất cả'),
  dropdownFilter('Trả trước', 'Trả trước'),
  dropdownFilter('Trả sau', 'Trả sau'),
];
dropdownFilter? selectedValueFilter;
var searchkey;
int pageNumber = 1;
int pageSize = 5;
final GlobalKey<_DanhSachGoiCuocTruoc15_6_2023_MainPageState> myWidgetKey =
    GlobalKey();

class _DanhSachGoiCuocTruoc15_6_2023_MainPageState
    extends State<DanhSachGoiCuocTruoc15_6_2023_MainPage> {
  // ConnectivityResult _connectionStatus = ConnectivityResult.none;
  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    //initConnectivity();
    selectedValue = dropdownItems[0];
    selectedValueFilter = dropdownItemsFilters[0];
    searchkey = '';

  }

  @override
  Widget build(BuildContext context) {
    Future<void> refresh() async {
      setState(() {});
    }

    return Scaffold(
        appBar: Custom_AppBar(title: 'DS gói cước trước 15/06/2023'),
        body: RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
                child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Tìm kiếm...',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(19.0)),
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            searchkey = text;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      child: Center(
                        child: DropdownButton<DropdownItem>(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          value: selectedValue,
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue;
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
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      child: Center(
                        child: DropdownButton<dropdownFilter>(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          value: selectedValueFilter,
                          onChanged: (newValue) {
                            setState(() {
                              selectedValueFilter = newValue;
                            });
                          },
                          items: dropdownItemsFilters
                              .map<DropdownMenuItem<dropdownFilter>>(
                                  (dropdownFilter item) {
                            return DropdownMenuItem<dropdownFilter>(
                              value: item,
                              child: Text_medium_dark(title: item.label),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              FutureBuilder(
                  future: checkLocalConnectionApi().then((value) =>
                      listGoiCuocTruoc15_6_2023(
                          pageNumber,
                          pageSize,
                          selectedValue!.value,
                          searchkey,
                          value,
                          selectedValueFilter!.value)),
                  builder: (context, snapshot) {
                    return Custom_FutureBuilder(
                      contextParam: context,
                      snapshot: snapshot,
                      widgetParam: snapshot.hasData
                          ? SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  for (var item in snapshot.data!)
                                    Custom_Card(
                                        item: item,
                                        list: snapshot.data,
                                        widget: Column(
                                          children: [
                                            Detail_Rows(
                                                title: 'Tên gói cước',
                                                data: item.tenGoiCuoc!),
                                            Detail_Rows(
                                                title: 'Giá cước:',
                                                data:
                                                    formatNumber(item.giaCuoc)),
                                            Detail_Rows(
                                                title: 'Trạng thái:',
                                                data: item.trangThai!),
                                            Detail_Rows(
                                                title: 'Mô tả:',
                                                data: item.moTa!),
                                            Detail_Rows(
                                                title: 'Loại gói:',
                                                data: item.loaiGoi!),
                                            Detail_Rows(
                                                title:
                                                    'HHBG chỉ online TB PTM(90%):',
                                                data: item.tiLeChiTraPtm!),
                                            Detail_Rows(
                                                title:
                                                    'HHBG chỉ online TB HH(90%):',
                                                data: item.tiLeChiTraHh!),
                                          ],
                                        )),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        '$pageNumber/${DanhSachGoiCuocTruoc15_6_2023_Variable.totalPage} trang, ${DanhSachGoiCuocTruoc15_6_2023_Variable.totalItem} mục'),
                                  ),
                                  DanhSachGoiCuocTruoc15_6_2023_Variable
                                              .totalPage !=
                                          0
                                      ? SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Pager(
                                            currentPage: pageNumber,
                                            totalPages:
                                                DanhSachGoiCuocTruoc15_6_2023_Variable
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
                          : const Text(''),
                    );
                  })
            ]))));
  }
}
