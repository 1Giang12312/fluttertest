// ignore_for_file: camel_case_types, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_Data_Rows_Color.dart';
class TheoDoiDuLieuVTCI_Detail extends StatelessWidget {
  TheoDoiDuLieuVTCI_Detail({
    super.key,
    this.timekey,
    this.nam,
    this.ngaySd,
    //this.idDonvi,
    this.tenDonvi,
    this.sdt,
    this.tenTt,
    this.diachiTt,
    this.goi,
    this.loai,
    this.psll,
    this.doanhThu,
    this.nvPhattrien,
    this.maNvtc,
    this.tenNvtc,
    // this.llOnnetOg,
    // this.llOffnetOg,
    // this.llOnnetIc,
    // this.llOffnetIc,
    // this.llSmsOnnetOg,
    // this.llSmsOffnetOg,
    // this.llSmsOnnetIc,
    // this.llSmsOffnetIc,
    this.llData,
    this.soNgayThang,
    this.trangthaipheduyetQuy,
    // this.nguoiCn,
    // this.thoigianCn,
    //this.ghichu,
  });
  dynamic timekey;
  int? nam;
  DateTime? ngaySd;
  int? idDonvi;
  String? tenDonvi;
  String? sdt;
  String? tenTt;
  String? diachiTt;
  String? goi;
  int? loai;
  String? psll;
  int? doanhThu;
  String? nvPhattrien;
  String? maNvtc;
  String? tenNvtc;
  // int? llOnnetOg;
  // int? llOffnetOg;
  // int? llOnnetIc;
  // int? llOffnetIc;
  // int? llSmsOnnetOg;
  // int? llSmsOffnetOg;
  // int? llSmsOnnetIc;
  // int? llSmsOffnetIc;
  int? llData;
  int? soNgayThang;
  dynamic trangthaipheduyetQuy;
  // dynamic nguoiCn;
  // dynamic thoigianCn;
  // dynamic ghichu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(title: 'Chi tiết TT $tenTt'),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Custom_Data_Rows_Color(
            indexCount:true,
            widget: Detail_Rows(title: 'Thời gian: ', data: timekey.toString()),
          ),
          Custom_Data_Rows_Color(
              indexCount: false,
              widget:
                  Detail_Rows(title: 'Năm triển khai: ', data: nam.toString())),
          Custom_Data_Rows_Color(
            indexCount: true,
            widget:
                Detail_Rows(title: 'Ngày sử dụng: ', data: ngaySd.toString()),
          ),
          Custom_Data_Rows_Color(
            indexCount:false,
            widget:
                Detail_Rows(title: 'Tên đơn vị: ', data: tenDonvi.toString()),
          ),
          Custom_Data_Rows_Color(
            indexCount: true,
            widget: Detail_Rows(title: 'Số điện thoại: ', data: sdt.toString()),
          ),
          Custom_Data_Rows_Color(
            indexCount: false,
            widget: Detail_Rows(title: 'Tên TT: ', data: tenTt.toString()),
          ),
          Custom_Data_Rows_Color(
            indexCount:true,
            widget:
                Detail_Rows(title: 'Địa chỉ TT: ', data: diachiTt.toString()),
          ),
          Custom_Data_Rows_Color(
            indexCount:false,
            widget: Detail_Rows(
                title: 'PSLL: ',
                data: loai == 0
                    ? 'Không phát sinh lưu lượng'
                    : 'Phát sinh lưu lượng'),
          ),
          Custom_Data_Rows_Color(
            indexCount:true,
            widget: Detail_Rows(
                title: 'Không PSLL liên tiếp: ', data: goi.toString()),
          ),
          Custom_Data_Rows_Color(
            indexCount: false,
            widget: Detail_Rows(
                title: 'Nhân viên phát triển: ', data: nvPhattrien.toString()),
          ),
          Custom_Data_Rows_Color(
            indexCount:true,
            widget:
                Detail_Rows(title: 'LL Data(mb): ', data: llData.toString()),
          ),
          Custom_Data_Rows_Color(
            indexCount: false,
            widget: Detail_Rows(
                title: 'Số ngày hoạt động trong tháng: ',
                data: soNgayThang.toString()),
          ),
          Custom_Data_Rows_Color(
            indexCount: true,
            widget: Detail_Rows(
                title: 'Trạng thái duyệt: ',
                data: trangthaipheduyetQuy.toString() == "null"
                    ? "Chưa duyệt"
                    : trangthaipheduyetQuy),
          ),
          // Detail_Rows(title: 'Thời gian: ', data: timekey.toString()),
          // const Divider(),
          // Detail_Rows(title: 'Năm triển khai: ', data: nam.toString()),
          // const Divider(),
          // Detail_Rows(title: 'Ngày sử dụng: ', data: ngaySd.toString()),
          // const Divider(),
          // Detail_Rows(title: 'Tên đơn vị: ', data: tenDonvi.toString()),
          // const Divider(),
          // Detail_Rows(title: 'Số điện thoại: ', data: sdt.toString()),
          // const Divider(),
          // Detail_Rows(title: 'Tên TT: ', data: tenTt.toString()),
          // const Divider(),
          // Detail_Rows(title: 'Địa chỉ TT: ', data: diachiTt.toString()),
          // const Divider(),
          // Detail_Rows(
          //     title: 'PSLL: ',
          //     data: loai == 0
          //         ? 'Không phát sinh lưu lượng'
          //         : 'Phát sinh lưu lượng'),
          // const Divider(),
          // Detail_Rows(title: 'Không PSLL liên tiếp: ', data: goi.toString()),
          // const Divider(),
          // Detail_Rows(
          //     title: 'Nhân viên phát triển: ', data: nvPhattrien.toString()),
          // const Divider(),
          // Detail_Rows(title: 'LL Data(mb): ', data: llData.toString()),
          // const Divider(),
          // Detail_Rows(
          //     title: 'Số ngày hoạt động trong tháng: ',
          //     data: soNgayThang.toString()),
          // const Divider(),
          // Detail_Rows(
          //     title: 'Trạng thái duyệt: ',
          //     data: trangthaipheduyetQuy.toString() == "null"
          //         ? "Chưa duyệt"
          //         : trangthaipheduyetQuy),
        ]),
      )),
    );
  }
}

