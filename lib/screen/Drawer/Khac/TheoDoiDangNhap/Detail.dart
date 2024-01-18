import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Data_Rows_Color.dart';
import 'package:vnptapp/Models/TheoDoiDangNhap.dart';

class TheoDoiDangNhap_Detail extends StatelessWidget {
  TheoDoiDangNhap_Detail({super.key, required this.tddn});
  TheoDoiDangNhap tddn;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(
        title: "Chi tiết ${tddn.nhanvienHoten}",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Custom_Data_Rows_Color_SmallData(
                indexCount: false, title: "- Tên đơn vị:", data: tddn.donviTen),
            Custom_Data_Rows_Color_SmallData(
                indexCount: true,
                title: "- Tên nhân viên:",
                data: tddn.nhanvienHoten),
            Custom_Data_Rows_Color_SmallData(
                indexCount: false,
                title: "- Số lần đăng nhập trong tháng:",
                data: tddn.soLanLogin),
            Custom_Data_Rows_Color_SmallData(
                indexCount: true,
                title: "- Lần đăng nhập gần nhất:",
                data: tddn.ngayLoginCuoiCung),
            Custom_Data_Rows_Color_SmallData(
                indexCount: false, title: "- Thiết bị:", data: tddn.tenThietBi),
            Custom_Data_Rows_Color_SmallData(
                indexCount: true,
                title: "- Hãng thiết bị:",
                data: tddn.tenHangThietBi),
            Custom_Data_Rows_Color_SmallData(
                indexCount: false,
                title: "- Hệ điều hành:",
                data: tddn.heDieuHanh),
          ],
        ),
      ),
    );
  }
}
