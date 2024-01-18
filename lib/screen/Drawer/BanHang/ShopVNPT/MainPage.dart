// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables

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
import 'package:vnptapp/screen/Drawer/BanHang/ShopVNPT/Detail.dart';
import 'package:vnptapp/screen/Drawer/BanHang/ShopVNPT/Logic.dart';
import 'package:vnptapp/screen/Drawer/BanHang/ShopVNPT/Variable.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';

class ShopVNPT_MainPage extends StatefulWidget {
  const ShopVNPT_MainPage({super.key});

  @override
  State<ShopVNPT_MainPage> createState() => _ShopVNPT_MainPageState();
}

class DropdownItem {
  final String value;
  final String label;
  DropdownItem(this.value, this.label);
}

class _ShopVNPT_MainPageState extends State<ShopVNPT_MainPage> {
  Future<void> refresh() async {
    setState(() {});
  }

  List<DropdownItem> dropdownItems = [
    DropdownItem('Đã giao', 'Đã giao'),
    DropdownItem('Nhận tại ĐGD', 'Nhận tại ĐGD'),
    DropdownItem('null', 'Tất cả trạng thái'),
  ];
  int pageNumber = 1;
  int pageSized = 10;
  var selectedTrangThai;
  var selectedDonVi;
  TextEditingController searchkey = TextEditingController();
  @override
  void initState() {
    selectedTrangThai = dropdownItems[0];
    searchkey.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(title: 'TB DDTT PTM ShopVNPT'),
      body: Consumer(
        builder: (context, watch, child) {
          var selectedDV = watch.watch(riverpod_instance.selectedTenMoTa11Pbh);
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
                        borderRadius: BorderRadius.all(Radius.circular(19.0)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Custom_DropdownDonViTheoTenMoTa11Pbh(
                        nhanvienDonVi: localNhanVien.nhanvien_donvi!,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DropdownButton<DropdownItem>(
                                    borderRadius: const BorderRadius.all(
                                  Radius.circular(20)),
                      value: selectedTrangThai,
                      onChanged: (newValue) {
                        setState(() {
                          selectedTrangThai = newValue;
                        });
                      },
                      items: dropdownItems.map<DropdownMenuItem<DropdownItem>>(
                          (DropdownItem item) {
                        return DropdownMenuItem<DropdownItem>(
                          value: item,
                          child: Text_medium_dark(title: item.label),
                        );
                      }).toList(),
                    )
                  ],
                ),
                FutureBuilder(
                    future: Future.delayed(Duration(seconds: awaitTime),
                        () => checkLocalConnectionApi()),
                    builder: (context, snapshot1) {
                      if (snapshot1.connectionState !=
                              ConnectionState.waiting &&
                          snapshot1.data != null) {
                     //   print(selectedDV);
                        return FutureBuilder(
                            future: getListShopVNPT(
                              pageNumber,
                              pageSized,
                              selectedDV,
                              nhanvien_DonVi_MoTa,
                              localNhanVien.nhanvien_smcs,
                              localNhanVien.nhanvien_chucdanh,
                              snapshot1.data!,
                              searchkey.text,
                              selectedTrangThai.value,
                            ),
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
                                                for (var item in snapshot.data!)
                                                  Custom_Card(
                                                      item: item,
                                                      list: snapshot.data,
                                                      widget: Column(
                                                        children: [
                                                          Detail_Rows(
                                                            title:
                                                                'Phòng bán hàng:',
                                                            data: item.pbh
                                                                .toString(),
                                                          ),
                                                          Detail_Rows(
                                                            title: 'Họ tên:',
                                                            data: item.hoTen
                                                                .toString(),
                                                          ),
                                                          Detail_Rows(
                                                            title: 'Mã SMCS:',
                                                            data: item.maSmcs
                                                                .toString(),
                                                          ),
                                                          Detail_Rows(
                                                            title: 'Số lượng:',
                                                            data: item.soLuong
                                                                .toString(),
                                                          ),
                                                          MaterialButton(
                                                            onPressed: () {
                                                              {
                                                                pageTrasition(
                                                                  context,
                                                                  ShopVNPT_Detail(
                                                                    maNV: item
                                                                        .maSmcs
                                                                        .toString(),
                                                                    tenNV: item
                                                                        .hoTen
                                                                        .toString(),
                                                                    trangThaiGiao:
                                                                        selectedTrangThai
                                                                            .value,
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
                                                      '$pageNumber/${ShopVNPT_Variable.totalPage} trang, ${ShopVNPT_Variable.totalItem} mục'),
                                                ),
                                                ShopVNPT_Variable.totalPage != 0
                                                    ? SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Pager(
                                                          currentPage:
                                                              pageNumber,
                                                          totalPages:
                                                              ShopVNPT_Variable
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
      ),
    );
  }
}
