// ignore_for_file: camel_case_types, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_Data_Rows_Color.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';

class TheoDoiCuocGoiPTM_Detail extends StatelessWidget {
  TheoDoiCuocGoiPTM_Detail({
    super.key,
    required this.timekey,
    required this.eload,
    required this.sodt,
    required this.tengoi,
    required this.tiengoi,
    required this.thoigianDkgoi,
    required this.loaiId,
    required this.nhanvien,
    required this.nhanvienSmcs,
    required this.idDonvi,
    required this.tenDonvi,
    required this.tieudungTkc,
    required this.trangthaiDuoctinh,
    required this.tieudungTkc6Th,
    required this.nhanvienChucdanh,
    required this.nhanvienTruongnhom,
    required this.loaiTb,
    required this.ghichu,
    required this.chunhomSmcs,
    required this.trangthaiTbPtm,
    required this.ngayDkTttb,
    required this.tinhluongTheoQuyche,
    required this.trangthaiDahuongLuong,
    required this.doanhthuDuocGhinhan,
    required this.sothangChenhlech,
    required this.eloadDuq,
    required this.chukyGoi,
    required this.thulaoThangN,
    required this.thulaoThangN3,
    required this.doanhthuDuocGhinhanKpi,
    required this.doanhthuTangthem,
    required this.thulaoThangN1,
    required this.thulaoThangN2,
    required this.userDktb,
    required this.hrmDktb,
    required this.hrmBanGoi,
  });
  String timekey;
  String eload;
  String sodt;
  String tengoi;
  double tiengoi;
  String thoigianDkgoi;
  String loaiId;
  String nhanvien;
  String nhanvienSmcs;
  int idDonvi;
  String tenDonvi;
  double tieudungTkc;
  int trangthaiDuoctinh;
  double tieudungTkc6Th;
  String nhanvienChucdanh;
  String nhanvienTruongnhom;
  String loaiTb;
  String ghichu;
  String chunhomSmcs;
  int trangthaiTbPtm;
  String ngayDkTttb;
  int tinhluongTheoQuyche;
  int trangthaiDahuongLuong;
  double doanhthuDuocGhinhan;
  int sothangChenhlech;
  int eloadDuq;
  int chukyGoi;
  double thulaoThangN;
  double thulaoThangN3;
  double doanhthuDuocGhinhanKpi;
  double doanhthuTangthem;
  double thulaoThangN1;
  double thulaoThangN2;
  String userDktb;
  String hrmDktb;
  String hrmBanGoi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            Custom_AppBar(title: 'Chi tiết NV $nhanvien'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(title: 'Đơn vị:', data: tenDonvi),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget:
                    Detail_Rows(title: 'Chức danh: ', data: nhanvienChucdanh),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(title: 'Nhân viên: ', data: nhanvien),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(title: 'Hệ thống:  ', data: loaiId),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                    title: 'Thời gian kết nối gói: ',
                    data: getDateFormat(thoigianDkgoi)),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(title: 'Số thuê bao: ', data: sodt),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                    title: 'Ngày DKTTTB: ', data: getDateFormat(ngayDkTttb)),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(title: 'User DKTTTB: ', data: userDktb),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(title: 'HRM DKTTTB: ', data: hrmDktb),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(title: 'HRM bán gói: ', data: hrmBanGoi),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget:
                    Detail_Rows(title: 'Mã nhân viên: ', data: nhanvienSmcs),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(title: 'Tên gói: ', data: tengoi),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                    title: 'Tiền gói: ', data: formatNumber(tiengoi)),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(
                    title: 'Chu kì gói: ', data: chukyGoi.toString()),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                    title: 'Loại phát triển: ',
                    data: nhanvienTruongnhom.toString()),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(
                    title: 'TD TKC BQ: ', data: tieudungTkc6Th.toStringAsFixed(2)),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                    title: 'TD TKC: ', data: formatNumber(tieudungTkc)),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(
                    title: 'Trạng thái hưởng lương: ',
                    data: trangthaiDahuongLuong == 1
                        ? 'Đã hưởng lương'
                        : 'Chưa hưởng lương'),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(title: 'Ghi chú: ', data: ghichu),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(
                    title: 'DT bán gói: ', data: formatNumber(tiengoi)),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                    title: 'DT tiêu dùng TKC: ',
                    data: formatNumber(tieudungTkc)),
              ),
              // Detail_Rows(title: 'Đơn vị:', data: tenDonvi),
              // Detail_Rows(title: 'Chức danh: ', data: nhanvienChucdanh),
              // Detail_Rows(title: 'Nhân viên: ', data: nhanvien),
              // Detail_Rows(title: 'Hệ thống:  ', data: loaiId),
              // Detail_Rows(
              //     title: 'Thời gian kết nối gói: ',
              //     data: getDateFormat(thoigianDkgoi)),
              // Detail_Rows(title: 'Số thuê bao: ', data: sodt),
              // Detail_Rows(
              //     title: 'Ngày DKTTTB: ', data: getDateFormat(ngayDkTttb)),
              // Detail_Rows(title: 'User DKTTTB: ', data: userDktb),
              // Detail_Rows(title: 'HRM DKTTTB: ', data: hrmDktb),
              // Detail_Rows(title: 'HRM bán gói: ', data: hrmBanGoi),
              // Detail_Rows(title: 'Mã nhân viên: ', data: nhanvienSmcs),
              // Detail_Rows(title: 'Tên gói: ', data: tengoi),
              // Detail_Rows(title: 'Tiền gói: ', data: formatNumber(tiengoi)),
              // Detail_Rows(title: 'Chu kì gói: ', data: chukyGoi.toString()),
              // Detail_Rows(
              //     title: 'Loại phát triển: ',
              //     data: nhanvienTruongnhom.toString()),
              // Detail_Rows(
              //     title: 'TD TKC BQ: ', data: tieudungTkc6Th.toString()),
              // Detail_Rows(title: 'TD TKC: ', data: formatNumber(tieudungTkc)),
              // Detail_Rows(
              //     title: 'Trạng thái hưởng lương: ',
              //     data: trangthaiDahuongLuong == 1
              //         ? 'Đã hưởng lương'
              //         : 'Chưa hưởng lương'),
              // Detail_Rows(title: 'Ghi chú: ', data: ghichu),
              // Detail_Rows(title: 'DT bán gói: ', data: formatNumber(tiengoi)),
              // Detail_Rows(
              //     title: 'DT tiêu dùng TKC: ', data: formatNumber(tieudungTkc)),
         
            ],
          ),
        ));
  }
}

String getDateFormat(String inputDate) {
  return "${inputDate.substring(6, 8)}/${inputDate.substring(4, 6)}/${inputDate.substring(0, 4)}";
}
