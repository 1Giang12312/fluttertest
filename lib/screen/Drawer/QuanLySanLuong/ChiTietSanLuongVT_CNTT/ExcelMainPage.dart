// ignore_for_file: camel_case_types, must_be_immutable, prefer_typing_uninitialized_variables, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_ShowDialog.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/ChiTietSanLuongVT_CNTT/Logic.dart';
import 'package:vnptapp/screen/login/LoginScreen_MainPage.dart';

class ChiTietSanLiongVT_CNTT_Excel_MainPage extends StatefulWidget {
  ChiTietSanLiongVT_CNTT_Excel_MainPage(
      {super.key,
      required this.selectedValue,
      required this.year,
      required this.month,
      required this.tongSoLuong,
      this.ddtt,
      this.ddts,
      this.brcd});
  String month;
  String year;
  var selectedValue;
  int tongSoLuong;
  bool? ddtt;
  bool? ddts;
  bool? brcd;
  @override
  State<ChiTietSanLiongVT_CNTT_Excel_MainPage> createState() =>
      _ChiTietSanLiongVT_CNTT_Excel_MainPageState();
}

class _ChiTietSanLiongVT_CNTT_Excel_MainPageState
    extends State<ChiTietSanLiongVT_CNTT_Excel_MainPage> {
  Future<void> thongBao(String messaage) async {
    ShowDialog('Thông báo', messaage, context);
  }

  bool isLoading = false;
  TextEditingController soLuong = TextEditingController();
  String massage = '';

  @override
  void initState() {
    soLuong.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(title: 'Xuất file Excel'),
        body: isLoading
            ? LoadingScreen(nameOfLoadingScreen: massage)
            : Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Text('Lưu ý'),
                      ),
                      Text_medium_light(
                        title:
                            'Nhập số lượng hàng bạn muốn xuất ra Excel (nhập 0 nếu muốn xuất tất cả)',
                      ),
                      Text_medium_light(
                          title:
                              'Khi xuất file thành công, file Excel được lưu ở thư mục Download'),
                      widget.tongSoLuong == 0
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: Text_medium_light(
                                title: 'Chú ý: tổng số lượng đang = 0',
                              ),
                            )
                          : const SizedBox(),
                      Text_medium_light(
                          title: 'Tổng số lượng : ${widget.tongSoLuong}'),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widthOfDevice(context) / 3,
                            height: heightOfDevice(context) / 12,
                            child: TextFormField(
                              controller: soLuong,
                              decoration: const InputDecoration(
                                labelText: "Số lượng",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            child: const Text('Xuất file'),
                            onPressed: () async {
                              if (soLuong.text.isEmpty) {
                                ShowDialog(
                                    'Lỗi', 'Bạn phải nhập số lượng', context);
                              } else if ((int.tryParse(soLuong.text) != null) ==
                                  false) {
                                ShowDialog('Lỗi', 'Bạn phải nhập số', context);
                              } else if (int.parse(soLuong.text) >
                                  widget.tongSoLuong) {
                                ShowDialog(
                                    'Lỗi',
                                    'Số lượng vừa nhập đã vượt quá số lượng của hệ thống',
                                    context);
                              } else {
                                setState(() {
                                  isLoading = true;
                                  massage = 'Đang xác thực';
                                });
                                bool authorized =
                                    await checkLocalConnectionApi().then(
                                        (value) => checkAuthorized(value));
                                if (authorized == false) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginScreen_MainPage(
                                              thongBao: '',
                                            )),
                                    (route) => false,
                                  );
                                }
                                setState(() {
                                  massage = 'Đang thêm vào Excel';
                                });
                                if (widget.ddtt == true) {
                                  await checkLocalConnectionApi()
                                      .then((value) => listDdttExcel(
                                          widget.month,
                                          widget.year,
                                          localNhanVien.nhanvien_manv!,
                                          nhanvien_TenDonVi,
                                          widget.selectedValue,
                                          localNhanVien.nhanvien_chucdanh
                                              .toString(),
                                          value,
                                          int.parse(soLuong.text)))
                                      .then((value) =>
                                          FileStorage.createExcelDdtt(value)
                                              .then(
                                                  (value) => thongBao(value)));
                                }
                                if (widget.ddts == true) {
                                  await checkLocalConnectionApi()
                                      .then((value) => listDdtsExcel(
                                          widget.month,
                                          widget.year,
                                          localNhanVien.nhanvien_manv_thns!,
                                          nhanvien_TenDonVi,
                                          widget.selectedValue,
                                          localNhanVien.nhanvien_chucdanh
                                              .toString(),
                                          value,
                                          int.parse(soLuong.text)))
                                      .then((value) =>
                                          FileStorage.createExcelDdts(value)
                                              .then(
                                                  (value) => thongBao(value)));
                                }
                                if (widget.brcd == true) {
                                  await checkLocalConnectionApi()
                                      .then((value) => listBrcdExcel(
                                          widget.month,
                                          widget.year,
                                          localNhanVien.nhanvien_manv_thns!,
                                          widget.selectedValue,
                                          localNhanVien.nhanvien_donvi!,
                                          localNhanVien.nhanvien_chucdanh!,
                                          value,
                                          int.parse(soLuong.text)))
                                      .then((value) =>
                                          FileStorage.createExcelBrcd(value)
                                              .then(
                                                  (value) => thongBao(value)));
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ));
  }
}
