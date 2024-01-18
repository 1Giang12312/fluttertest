// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Data_Rows_Color.dart';
import 'package:vnptapp/Models/OBThayTheTBDC2023.dart';

class OBThayTheTBDC2023_Detail extends StatelessWidget {
  OBThayTheTBDC2023_Detail({super.key, required this.obThayTheTbdc2023});
  ObThayTheTbdc2023 obThayTheTbdc2023;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(
        title: "Chi tiết TB ${obThayTheTbdc2023.tenTt}",
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
        child: Column(
          children: [
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Tên đơn vị:",
                data: obThayTheTbdc2023.donviTen),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false, title: "Địa bàn C3:", data: obThayTheTbdc2023.c3),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Mã TB:",
                data: obThayTheTbdc2023.maTb),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false, title: "SDT:", data: obThayTheTbdc2023.sdt),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Mã TT:",
                data: obThayTheTbdc2023.maTt),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "Tên thanh toán:",
                data: obThayTheTbdc2023.tenTt),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Tên gói:",
                data: obThayTheTbdc2023.tenGoi),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "Giá gói:",
                data: obThayTheTbdc2023.giaGoi),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Tốc độ:",
                data: "${obThayTheTbdc2023.tocDo} Mb"),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "MyTV:",
                data: obThayTheTbdc2023.mytv),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true, title: "Mesh:", data: obThayTheTbdc2023.mesh),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "DTC:",
                data: obThayTheTbdc2023.dtc ?? "-"),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Số tháng:",
                data: obThayTheTbdc2023.soThang),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "Loại ONT:",
                data: obThayTheTbdc2023.loaiOnt),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Đối tượng:",
                data: obThayTheTbdc2023.doiTuong),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "Ngày SD:",
                data: obThayTheTbdc2023.ngaySd),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Mức ưu tiên:",
                data: obThayTheTbdc2023.mucUuTien),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "Tuổi TB:",
                data: obThayTheTbdc2023.tuoiTb),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true, title: "NVKD:", data: obThayTheTbdc2023.nvkd),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "SMCS:",
                data: obThayTheTbdc2023.smcs),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Trạng thái OB:",
                data: obThayTheTbdc2023.userCapNhat == null
                    ? "Chưa OB"
                    : "Đã OB"),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "User cập nhật:",
                data: obThayTheTbdc2023.userCapNhat ?? "-"),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Thời gian cập nhật:",
                data: obThayTheTbdc2023.thoigianCapNhat ?? "-"),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "Nội dung cập nhật:",
                data: obThayTheTbdc2023.noidungCapnhat ?? "-"),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Ghi chú:",
                data: obThayTheTbdc2023.ghiChu ?? "-"),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "User cập nhật gd:",
                data: obThayTheTbdc2023.userCapNhatGd ?? "-"),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Thời gian cập nhật gd:",
                data: obThayTheTbdc2023.thoiGianCapNhatGd ?? "-"),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: false,
                title: "Nội dung cập nhật gd:",
                data: obThayTheTbdc2023.noiDungCapNhatGd ?? "-"),
            Custom_Data_Rows_Color_SmallTile(
                indexCount: true,
                title: "Ghi chú gd:",
                data: obThayTheTbdc2023.ghiChuGd ?? "-"),
          ],
        ),
      )),
    );
  }
}
