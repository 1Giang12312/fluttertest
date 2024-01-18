import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_MonthYearPicker.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/ThueBaoKHongPSLL/Logic.dart';

class ThueBaoKHongPSLL_MainPage extends StatefulWidget {
  const ThueBaoKHongPSLL_MainPage({super.key});

  @override
  State<ThueBaoKHongPSLL_MainPage> createState() =>
      _ThueBaoKHongPSLL_MainPageState();
}

var selectedC2C3 = StateProvider<dynamic>((ref) => null);
var selectedLoaiHinh = StateProvider<dynamic>((ref) => null);

class DropdownItem {
  final String value;
  final String label;
  DropdownItem(this.value, this.label);
}

List<DropdownItem> dropdownItems = [
  DropdownItem('c2', 'C2'),
  DropdownItem('c3', 'C3'),
];
DropdownItem? selectedValue;
List<DropdownItem> dropdownItems1 = [
  DropdownItem('Fiber', 'Fiber(BRCĐ)'),
  DropdownItem('MyTV', 'MyTV'),
];

class _ThueBaoKHongPSLL_MainPageState extends State<ThueBaoKHongPSLL_MainPage> {
  Future<void> refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(title: "Thuê bao không PSLL"),
        body: RefreshIndicator(
            onRefresh: refresh,
            child: Consumer(builder: (context, ref, child) {
              var selectedValueC2C3 = ref.watch(selectedC2C3);
              var selectedValueLoaiHinh = ref.watch(selectedLoaiHinh);
              var selectedMonth =
                  ref.watch(riverpod_instance.selectedMonthMonthYearPicker);
              var selectedYear =
                  ref.watch(riverpod_instance.selectedYearMonthYearPicker);
              selectedValueC2C3 == null
                  ? selectedValueC2C3 = dropdownItems[0]
                  : selectedValueC2C3 = selectedValueC2C3;
              selectedValueLoaiHinh == null
                  ? selectedValueLoaiHinh = dropdownItems1[0]
                  : selectedValueLoaiHinh = selectedValueLoaiHinh;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        localNhanVien.nhanvien_donvi == 13 ||
                                localNhanVien.nhanvien_donvi == 2
                            ? DropdownButton<DropdownItem>(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                value: selectedValueC2C3,
                                onChanged: (newValue) {
                                  ref.read(selectedC2C3.notifier).state =
                                      newValue!;
                                },
                                items: dropdownItems
                                    .map<DropdownMenuItem<DropdownItem>>(
                                        (DropdownItem item) {
                                  return DropdownMenuItem<DropdownItem>(
                                    value: item,
                                    child: Text(item.label),
                                  );
                                }).toList(),
                              )
                            : SizedBox(),
                        // const SizedBox(
                        //   width: 7,
                        // ),
                        // DropdownButton<DropdownItem>(
                        //   borderRadius:
                        //       const BorderRadius.all(Radius.circular(20)),
                        //   value: selectedValueLoaiHinh,
                        //   onChanged: (newValue) {
                        //     ref.read(selectedLoaiHinh.notifier).state =
                        //         newValue!;
                        //   },
                        //   items: dropdownItems1
                        //       .map<DropdownMenuItem<DropdownItem>>(
                        //           (DropdownItem item) {
                        //     return DropdownMenuItem<DropdownItem>(
                        //       value: item,
                        //       child: Text(item.label),
                        //     );
                        //   }).toList(),
                        // ),
                      ],
                    ),
                    Custom_MonthYearPicker(),
                    localNhanVien.nhanvien_donvi == 13 ||
                            localNhanVien.nhanvien_donvi == 2
                        ? FutureBuilder(
                            future: checkLocalConnectionApi(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null &&
                                  snapshot.connectionState !=
                                      ConnectionState.waiting) {
                                if (selectedValueC2C3.value == "c2") {
                                  return FutureBuilder(
                                      future: MyTViberKPSLLC2(
                                          '$selectedYear${selectedMonth}01',
                                          snapshot.data!,
                                          localNhanVien.nhanvien_manv_thns!,
                                          localNhanVien.nhanvien_donvi
                                              .toString()),
                                      builder: (context, snapshot1) {
                                        return Custom_FutureBuilder(
                                            contextParam: context,
                                            snapshot: snapshot1,
                                            widgetParam: snapshot1.hasData
                                                ? snapshot1.data!.isEmpty ||
                                                        snapshot1.data == []
                                                    ? Text(
                                                        "Không có dữ liệu tháng $selectedMonth năm $selectedYear")
                                                    : Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width: 100,
                                                                child:
                                                                    tableCustomTenC2(
                                                                  headerTitle:
                                                                      "Tên địa bàn C2",
                                                                  list: snapshot1
                                                                      .data!,
                                                                )),
                                                            Column(
                                                              children: [
                                                                Container(
                                                                  width: 200,
                                                                  height: 50,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.black)),
                                                                  child: const Center(
                                                                      child: Text(
                                                                          'Không phát sinh lưu lượng')),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    SizedBox(
                                                                        width:
                                                                            100,
                                                                        child:
                                                                            tableCustomKPSLLC2Fiber(
                                                                          headerTitle:
                                                                              "Fiber",
                                                                          list:
                                                                              snapshot1.data!,
                                                                        )),
                                                                    SizedBox(
                                                                        width:
                                                                            100,
                                                                        child:
                                                                            tableCustomKPSLLC2MyTV(
                                                                          headerTitle:
                                                                              "MyTV",
                                                                          list:
                                                                              snapshot1.data!,
                                                                        )),
                                                                  ],
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                : const Text(
                                                    'Lỗi vui lòng login lại'));
                                      });
                                } else {
                                  if (snapshot.data != null &&
                                      snapshot.connectionState !=
                                          ConnectionState.waiting) {
                                    return FutureBuilder(
                                        future: myTVFiberKPSLLC3(
                                            '$selectedYear${selectedMonth}01',
                                            snapshot.data!,
                                            localNhanVien.nhanvien_manv_thns!,
                                            localNhanVien.nhanvien_donvi
                                                .toString()),
                                        builder: (context, snapshot3) {
                                          return Custom_FutureBuilder(
                                              contextParam: context,
                                              snapshot: snapshot3,
                                              widgetParam: snapshot3.hasData
                                                  ? snapshot3.data!.isEmpty ||
                                                          snapshot3.data == []
                                                      ? Text(
                                                          "Không có dữ liệu tháng $selectedMonth năm $selectedYear")
                                                      : Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // SizedBox(
                                                              //     width: 100,
                                                              //     child:
                                                              //         tableCustomTenC3(
                                                              //       headerTitle:
                                                              //           "Tên địa bàn C3",
                                                              //       list: snapshot1
                                                              //           .data!,
                                                              //     )),
                                                              // SizedBox(
                                                              //     width: 100,
                                                              //     child:
                                                              //         tableCustomTenC2(
                                                              //       headerTitle:
                                                              //           "Tên địa bàn C2",
                                                              //       list: snapshot1
                                                              //           .data!,
                                                              //     )),
                                                              listTenC2(
                                                                  list: snapshot3
                                                                      .data!),
                                                              Column(
                                                                children: [
                                                                  Container(
                                                                    width: 200,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            border:
                                                                                Border.all(color: Colors.black)),
                                                                    child: const Center(
                                                                        child: Text(
                                                                            'Không phát sinh lưu lượng')),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              100,
                                                                          child:
                                                                              tableCustomKPSLLC2Fiber(
                                                                            headerTitle:
                                                                                "Fiber",
                                                                            list:
                                                                                snapshot3.data!,
                                                                          )),
                                                                      SizedBox(
                                                                          width:
                                                                              100,
                                                                          child:
                                                                              tableCustomKPSLLC2MyTV(
                                                                            headerTitle:
                                                                                "MyTV",
                                                                            list:
                                                                                snapshot3.data!,
                                                                          )),
                                                                    ],
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                  : const Text(
                                                      'Lỗi vui lòng login lại'));
                                        });
                                  } else {
                                    return LoadingScreen(
                                        nameOfLoadingScreen:
                                            'Đang kiểm tra mạng...');
                                  }
                                }
                              } else {
                                return LoadingScreen(
                                    nameOfLoadingScreen:
                                        "Đang kiểm tra mạng..");
                              }
                            })
                        : FutureBuilder(
                            future: checkLocalConnectionApi(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null ||
                                  snapshot.connectionState !=
                                      ConnectionState.waiting) {
                                return FutureBuilder(
                                    future: fiberKPSLLUserView(
                                        '$selectedYear${selectedMonth}01',
                                        snapshot.data!,
                                        localNhanVien.nhanvien_manv_thns!,
                                        localNhanVien.nhanvien_donvi.toString(),
                                        nhanvien_donvi_Pttb,
                                        localNhanVien.nhanvien_chucdanh!),
                                    builder: (context, snapshot1) {
                                      return Custom_FutureBuilder(
                                          contextParam: context,
                                          snapshot: snapshot1,
                                          widgetParam: snapshot1.hasData
                                              ? snapshot1.data!.isEmpty ||
                                                      snapshot1.data == []
                                                  ? Text(
                                                      "Không có dữ liệu tháng $selectedMonth năm $selectedYear")
                                                  : SingleChildScrollView(
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                          for (var item
                                                              in snapshot1
                                                                  .data!)
                                                            Custom_Card(
                                                                item: item,
                                                                list: snapshot1
                                                                    .data,
                                                                widget: Column(
                                                                  children: [
                                                                    Detail_Rows(
                                                                        title:
                                                                            'Địa bàn C2',
                                                                        data: item
                                                                            .tenDvPbh!),
                                                                    Detail_Rows(
                                                                        title:
                                                                            'Địa bàn C3:',
                                                                        data: item
                                                                            .tenKvC3),
                                                                    Detail_Rows(
                                                                        title:
                                                                            'Fiber không PSLL:',
                                                                        data: item
                                                                            .kopsLlFiber),
                                                                    Detail_Rows(
                                                                        title:
                                                                            'MyTV không PSLL:',
                                                                        data: item
                                                                            .kopsLlMyTv),
                                                                  ],
                                                                ))
                                                        ]))
                                              : const Text(
                                                  'Lỗi vui lòng login lại'));
                                    });
                              } else {
                                return LoadingScreen(
                                    nameOfLoadingScreen:
                                        "Đang kiểm tra mạng..");
                              }
                            })
                  ],
                ),
              );
            })));
  }
}

class headerRowCustom extends StatelessWidget {
  headerRowCustom({super.key, this.title});
  String? title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60.0,
        child: Center(
          child: Text(title!),
        ));
  }
}

class listTenC2 extends StatelessWidget {
  listTenC2({super.key, required this.list});
  List list;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 80,
            child: tableCustomTenC3(headerTitle: "Địa bàn C3", list: list)),
        SizedBox(
          width: 80.0,
          child: Table(
            border: TableBorder.all(width: 1),
            children: [
              const TableRow(children: [
                SizedBox(
                    height: 110.0,
                    child: Center(
                      child: Text("Địa bàn C2"),
                    ))
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "An Phú",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Châu Đốc",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Châu Phú",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Châu Thành",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Chợ Mới",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 300,
                  title: "Long Xuyên",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Phú Tân",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Tân Châu",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Thoại Sơn",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 200,
                  title: "Tịnh Biên",
                )
              ]),
              TableRow(children: [
                tableMergeRowCustom(
                  heightSize: 150,
                  title: "Tri Tôn",
                )
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

class tableMergeRowCustom extends StatelessWidget {
  tableMergeRowCustom({super.key, this.title, this.heightSize});
  String? title;
  double? heightSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: heightSize,
        child: Center(
          child: Text(title!),
        ));
  }
}

class tableCustomTenC2 extends StatelessWidget {
  tableCustomTenC2({super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 110.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.tenDvPbh.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomTenC3 extends StatelessWidget {
  tableCustomTenC3({super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 110.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.tenKvC3.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomKPSLLC2Fiber extends StatelessWidget {
  tableCustomKPSLLC2Fiber(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.kopsLlFiber.toString()),
                ))
          ]),
      ],
    );
  }
}

class tableCustomKPSLLC2MyTV extends StatelessWidget {
  tableCustomKPSLLC2MyTV(
      {super.key, required this.list, required this.headerTitle});
  String headerTitle;
  List list;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 0.5),
      children: [
        TableRow(children: [
          SizedBox(
              height: 60.0,
              child: Center(
                child: Text(headerTitle),
              ))
        ]),
        for (var item in list)
          TableRow(children: [
            Container(
                color:
                    list.indexOf(item) % 2 == 0 ? Card_colors_1 : Card_colors_2,
                height: 50.0,
                child: Center(
                  child: Text(item.kopsLlMyTv.toString()),
                ))
          ]),
      ],
    );
  }
}
