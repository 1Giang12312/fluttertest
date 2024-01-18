// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_Data_Rows_Color.dart';

class TapKHSuDungGoiHomeSanhChat_Detail extends StatelessWidget {
  TapKHSuDungGoiHomeSanhChat_Detail(
    this.id,
    this.maTb,
    this.goiCuoc,
    this.tenKh,
    this.sdtLienHe,
    this.diaChiThanhToan,
    this.tuyenThu,
    this.khuVucThu,
    this.nhanvienThucuoc,
    this.nhanvienSmcs,
    this.donviId,
    this.donviTen, {
    super.key,
  });
  int? id;
  String? maTb;
  String? goiCuoc;
  String? tenKh;
  String? sdtLienHe;
  String? diaChiThanhToan;
  String? tuyenThu;
  String? khuVucThu;
  String? nhanvienThucuoc;
  String? nhanvienSmcs;
  int? donviId;
  String? donviTen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(title: 'Chi tiết KH $tenKh'),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Custom_Data_Rows_Color(
              indexCount: false,
              widget: Detail_Rows(title: 'Id: ', data: id.toString()),
            ),
            Custom_Data_Rows_Color(
              indexCount: true,
              widget: Detail_Rows(title: 'Tên đơn vị: ', data: donviTen!),
            ),
            Custom_Data_Rows_Color(
              indexCount: false,
              widget: Detail_Rows(title: 'Mã thuê bao: ', data: maTb!),
            ),
            Custom_Data_Rows_Color(
              indexCount: true,
              widget: Detail_Rows(title: 'Gói cước: ', data: goiCuoc!),
            ),
            Custom_Data_Rows_Color(
              indexCount: false,
              widget: Detail_Rows(title: 'Tên khách hàng:  ', data: tenKh!),
            ),
            Custom_Data_Rows_Color(
              indexCount: true,
              widget: Detail_Rows(title: 'SDT liên hệ: ', data: sdtLienHe!),
            ),
            Custom_Data_Rows_Color(
              indexCount: false,
              widget: Detail_Rows(
                  title: 'Địa chỉ thanh toán: ', data: diaChiThanhToan!),
            ),
            Custom_Data_Rows_Color(
              indexCount: true,
              widget: Detail_Rows(title: 'Tuyến thu: ', data: tuyenThu!),
            ),
            Custom_Data_Rows_Color(
              indexCount: false,
              widget: Detail_Rows(title: 'Khu vực thu: ', data: khuVucThu!),
            ),
            Custom_Data_Rows_Color(
              indexCount: true,
              widget: Detail_Rows(
                  title: 'Nhân viên thu cước ', data: nhanvienThucuoc),
            ),
            Custom_Data_Rows_Color(
              indexCount: false,
              widget:
                  Detail_Rows(title: 'Nhân viên SMCS: ', data: nhanvienSmcs!),
            ),
          ],
        ),
      ),
    );
  }
}
