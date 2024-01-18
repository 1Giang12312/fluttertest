// ignore_for_file: camel_case_types, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_Data_Rows_Color.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
class GoiCuocDDTS_Detail extends StatelessWidget {
  GoiCuocDDTS_Detail({
    super.key,
    this.tenGoiCuoc,
    this.thoaiNoiMang,
    this.thoaiNgoaiMang,
    this.sms,
    this.dataNgay,
    this.dataThang,
    this.uuDaiKhac,
    this.nhuCau,
    this.hetDungLuong,
    this.chuKy1T,
    this.chuKy3T,
    this.chuKy6T,
    this.chuKy9T,
    this.chuKy12T,
  });
  String? tenGoiCuoc;
  String? nhuCau;
  String? thoaiNoiMang;
  String? thoaiNgoaiMang;
  String? dataNgay;
  String? hetDungLuong;
  String? sms;
  String? uuDaiKhac;
  String? dataThang;
  String? chuKy1T;
  String? chuKy3T;
  String? chuKy6T;
  String? chuKy9T;
  String? chuKy12T;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(title: 'Chi tiết gói cước $tenGoiCuoc'),
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Custom_Data_Rows_Color(
            indexCount:true,
            widget: Detail_Rows(title: 'Tên gói: ', data: tenGoiCuoc!),
          ),
          Custom_Data_Rows_Color(
            indexCount: false, widget: Detail_Rows(
                title: 'Giá gói chu kì 1T :', data: formatString(chuKy1T!)),
          ),
          Custom_Data_Rows_Color(
            indexCount: true,
            widget: Detail_Rows(
                title: 'Giá gói chu kì 3T :', data: formatString(chuKy3T!)),
          ),
          Custom_Data_Rows_Color(
            indexCount:false,
            widget: Detail_Rows(
                title: 'Giá gói chu kì 6T :', data: formatString(chuKy6T!)),
          ),
          Custom_Data_Rows_Color(
            indexCount: true,
            widget: Detail_Rows(
                title: 'Giá gói chu kì 9T :', data: formatString(chuKy9T!)),
          ),
          Custom_Data_Rows_Color(
            indexCount: false,
            widget: Detail_Rows(
                title: 'Giá gói chu kì 12T :', data: formatString(chuKy12T!)),
          ),
          Custom_Data_Rows_Color(
            indexCount: true,
            widget: Detail_Rows(title: 'Nhu cầu sử dụng: ', data: nhuCau!),
          ),
          Custom_Data_Rows_Color(
            indexCount: false,
            widget: Detail_Rows(
                title: 'Thoại nội mạng: ', data: '${thoaiNoiMang!}(phút)'),
          ),
          Custom_Data_Rows_Color(
            indexCount:true,
            widget: Detail_Rows(
                title: 'Thoại ngoại  mạng: ', data: '${thoaiNgoaiMang!}(phút)'),
          ),
          Custom_Data_Rows_Color(
            indexCount: false,
            widget: Detail_Rows(title: 'Data ngày: ', data: '${dataNgay!}GB'),
          ),
          Custom_Data_Rows_Color(
            indexCount:true,
            widget: Detail_Rows(title: 'Data tháng: ', data: dataThang!),
          ),
          Custom_Data_Rows_Color(
            indexCount: false,
            widget: Detail_Rows(title: 'Hết dung lượng: ', data: hetDungLuong!),
          ),
          Custom_Data_Rows_Color(
            indexCount:true,
            widget: Detail_Rows(title: 'Tin nhắn: ', data: sms!),
          ),
          Custom_Data_Rows_Color(
            indexCount:false,
            widget: Detail_Rows(title: 'Ưu đãi khác: ', data: uuDaiKhac!),
          ),
          // Detail_Rows(title: 'Tên gói: ', data: tenGoiCuoc!),
          // const Divider(),
          // Detail_Rows(
          //     title: 'Giá gói chu kì 1T :', data: formatString(chuKy1T!)),
          // const Divider(),
          // Detail_Rows(
          //     title: 'Giá gói chu kì 3T :', data: formatString(chuKy3T!)),
          // const Divider(),
          // Detail_Rows(
          //     title: 'Giá gói chu kì 6T :', data: formatString(chuKy6T!)),
          // const Divider(),
          // Detail_Rows(
          //     title: 'Giá gói chu kì 9T :', data: formatString(chuKy9T!)),
          // const Divider(),
          // Detail_Rows(
          //     title: 'Giá gói chu kì 12T :', data: formatString(chuKy12T!)),
          // const Divider(),
          // Detail_Rows(title: 'Nhu cầu sử dụng: ', data: nhuCau!),
          // const Divider(),
          // Detail_Rows(
          //     title: 'Thoại nội mạng: ', data: '${thoaiNoiMang!}(phút)'),
          // const Divider(),
          // Detail_Rows(
          //     title: 'Thoại ngoại  mạng: ', data: '${thoaiNgoaiMang!}(phút)'),
          // const Divider(),
          // Detail_Rows(title: 'Data ngày: ', data: '${dataNgay!}GB'),
          // const Divider(),
          // Detail_Rows(title: 'Data tháng: ', data: dataThang!),
          // const Divider(),
          // Detail_Rows(title: 'Hết dung lượng: ', data: hetDungLuong!),
          // const Divider(),
          // Detail_Rows(title: 'Tin nhắn: ', data: sms!),
          // const Divider(),
          // Detail_Rows(title: 'Ưu đãi khác: ', data: uuDaiKhac!),
        ])));
  }
}
