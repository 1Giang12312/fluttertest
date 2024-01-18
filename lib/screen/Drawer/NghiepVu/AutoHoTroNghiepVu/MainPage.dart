// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_ShowDialog.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/Custom_TextFormField.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/DecryptResponeStatus.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/AutoHoTroNghiepVu/Detail.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/AutoHoTroNghiepVu/Logic.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/AutoHoTroNghiepVu/Variable.dart';

class AutoHoTroNghiepVu_MainPage extends StatefulWidget {
  const AutoHoTroNghiepVu_MainPage({super.key});

  @override
  State<AutoHoTroNghiepVu_MainPage> createState() =>
      _AutoHoTroNghiepVu_MainPageState();
}

class DropdownItem {
  final String value;
  final String label;
  DropdownItem(this.value, this.label);
}

class _AutoHoTroNghiepVu_MainPageState
    extends State<AutoHoTroNghiepVu_MainPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController soThueBao = TextEditingController();
  TextEditingController keyWord = TextEditingController();
  List<DropdownItem> dropdownItems = [
    DropdownItem('TRACUU-TTTB', 'Tra cứu TTTB'),
    DropdownItem('TUCHOI-PHEDUYET', 'Từ chối phê duyệt TTTB'),
    DropdownItem('RESET-GPRS', 'Reset GPRS'),
    DropdownItem('TRACUU-MYVNPT', 'Tra cứu cài đặt MyVNPT'),
    DropdownItem('XULY-LOI-VOICE-DATA', 'Lỗi thoại hoặc data'),
    DropdownItem('DONGY-PHEDUYET', 'Đồng ý phê duyệt TTTB'),
    DropdownItem('DK-TSAL', 'OBTT DK TSAL'),
    DropdownItem('DK-VOCUC', 'OBTT DK VOCUC'),
    DropdownItem('RESET-ELOAD', 'Reset mật khẩu Eload'),
    DropdownItem('DK-VD149S6T', 'OBTT DK VD149S 6T'),
    DropdownItem('DK-VD149S12T', 'OBTT DK VD149S 6T'),
    DropdownItem('DK-D500S', 'OBTT DK D500S'),
    DropdownItem('DK-D500S1', 'OBTT DK D500S1 (Ezcom)'),
    DropdownItem('GH-CKD', 'OBTT GH gói CKD'),
    DropdownItem('DK-D279', 'OBTT GH gói D500 (DK D279)'),
  ];
  DropdownItem? selectedValue;
  int result = 0;
  bool isLoading = false;
  double heightOfRow = 100;
  @override
  void initState() {
    selectedValue = dropdownItems[0];
    soThueBao.text = '';
    keyWord.text = '';
    super.initState();
  }

  Future<void> guiHoTro(String soThueBao, String loaiYC, String nhanVienYeuCau,
      String subUrlApi) async {
    if (mounted) {
      if (soThueBao.isEmpty) {
        ShowDialog('Lỗi', 'Số thuê bao không được để trống', context);
      } else if (int.tryParse(soThueBao) == null) {
        ShowDialog('Lỗi', 'Hãy nhập số thuê bao là số', context);
      } else if (soThueBao.length != 9) {
        ShowDialog('Lỗi', 'Số thuê bao phải là 9 số', context);
      } else {
        setState(() {
          isLoading = true;
        });
        int result = await addHoTroNghiepVu(
            soThueBao, loaiYC, nhanVienYeuCau, subUrlApi);
        setState(() {
          isLoading = false;
        });
        if (result == 0xc9) {
          // ignore: use_build_context_synchronously
          ShowDialog('Thông báo', 'Gửi thành công', context);
        } else {
          // ignore: use_build_context_synchronously
          await DecryptResponse(context, result);
        }
      }
    }
  }

  int pageNumber = 1;
  int pageSized = 10;
  Future<void> refresh() async {
    setState(() {});
  }

  // ignore: prefer_typing_uninitialized_variables
  var selectedNV;
  @override
  Widget build(BuildContext context) {
    var selectedNghiepVu =
        StateProvider<DropdownItem>((ref) => dropdownItems[0]);
    return Scaffold(
        appBar: Custom_AppBar(title: 'Hỗ trợ nghiệp vụ'),
        body: Padding(
          padding: EdgeInsets.only(right: 8, left: 8),
          child: RefreshIndicator(
            onRefresh: refresh,
            child: isLoading
                ? LoadingScreen(nameOfLoadingScreen: 'Đang tải dữ liệu...')
                : SingleChildScrollView(
                    child: Column(children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            child: Center(
                                child:
                                    Text_medium_dark(title: 'Nhập thuê bao: ')),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: SizedBox(
                              child: Form(
                            key: _formKey,
                            child: Custom_TextFieldNumberPhone(
                              nameOfTextFormField: 'ví dụ: 911998992',
                              controller: soThueBao,
                              isPassword: false,
                            ),
                          )),
                        ),
                      ],
                    ),
                    // Hàng 2
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            child: Center(
                                child: Text_medium_dark(title: 'Nghiệp vụ: ')),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: SizedBox(
                            child: Center(child:
                                Consumer(builder: (context, watch, child) {
                              selectedNV = watch.watch(selectedNghiepVu);
                              return DropdownButton<DropdownItem>(
                                value: selectedNV,
                                onChanged: (newValue) {
                                  watch.read(selectedNghiepVu.notifier).state =
                                      newValue!;
                                  //   print(newValue!.label);
                                  // setState(() {
                                  //   selectedValue = newValue;
                                  // });
                                },
                                items: dropdownItems
                                    .map<DropdownMenuItem<DropdownItem>>(
                                        (DropdownItem item) {
                                  return DropdownMenuItem<DropdownItem>(
                                    value: item,
                                    child: Text_medium_dark(title: item.label),
                                  );
                                }).toList(),
                              );
                            })),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: SizedBox(
                            child: ElevatedButton(
                                onPressed: () async {
                                  await checkLocalConnectionApi().then(
                                      (value) => guiHoTro(
                                          soThueBao.text,
                                          selectedNV!.value,
                                          localNhanVien.nhanvien_manv!,
                                          value));
                                },
                                child: const Text(
                                  'Gửi hỗ trợ',
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: SizedBox(
                              child: OutlinedButton(
                                  onPressed: () async {
                                    setState(() {
                                      keyWord.text = '';
                                    });
                                  },
                                  child: const Text(
                                    'Làm mới dữ liệu',
                                  ))),
                        ),
                      ],
                    ),
                    // Hàng 4
                    Row(
                      children: <Widget>[
                        Expanded(
                            flex: 6,
                            child: SizedBox(
                                child: Container(
                              width: 200,
                              height: 70,
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: keyWord,
                                decoration: const InputDecoration(
                                  labelText: 'Tìm kiếm(theo sdt)',
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
                            ))

                            //         Custom_TextFormField(
                            //   controller:
                            //       keyWord,
                            //   nameOfTextFormField:
                            //       'Tìm kiếm(theo sđt)',
                            //   isPassword: false,
                            // )),
                            ),
                      ],
                    ),
                    FutureBuilder(
                        future: checkLocalConnectionApi().then((value) =>
                            listHoTroNghiepVu(
                                pageNumber,
                                pageSized,
                                localNhanVien.nhanvien_manv!,
                                keyWord.text,
                                value,
                                localNhanVien.nhanvien_donvi!)),
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
                                                        title: 'Mã nhân viên',
                                                        data: item
                                                            .nhanvienYeucau!),
                                                    Detail_Rows(
                                                        title:
                                                            'Trạng thái xử lý:',
                                                        data:
                                                            item.trangthai == 1
                                                                ? 'Đã xử lý'
                                                                : 'Chưa xử lý'),
                                                    Detail_Rows(
                                                        title: 'Số điện thoại:',
                                                        data: '0${item.sdt}'),
                                                    Detail_Rows(
                                                        title:
                                                            'Loại nghiệp vụ:',
                                                        data: item.loaiYc!),
                                                    Detail_Rows(
                                                        title: 'TG yêu cầu:',
                                                        data: item
                                                            .thoigianYeucau
                                                            .toString()),
                                                    MaterialButton(
                                                      onPressed: () {
                                                        {
                                                          pageTrasition(
                                                            context,
                                                            AutoHoTroNghiepVu_Detail(
                                                              id: item.id!,
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
                                                '$pageNumber/${AutoHoTroNghiepVu_Variable.totalPages} trang, ${AutoHoTroNghiepVu_Variable.totalRecords} mục'),
                                          ),
                                          AutoHoTroNghiepVu_Variable
                                                      .totalPages !=
                                                  0
                                              ? SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Pager(
                                                    currentPage: pageNumber,
                                                    totalPages:
                                                        AutoHoTroNghiepVu_Variable
                                                            .totalPages,
                                                    onPageChanged: (page) {
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
                        })
                    //    }
                    // }
                  ])),
          ),
        ));
    //));
  }
}
