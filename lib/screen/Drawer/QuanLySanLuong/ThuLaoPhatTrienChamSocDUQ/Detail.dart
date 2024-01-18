// ignore_for_file: camel_case_types, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_Data_Rows_Color.dart';

class ThuLaoPhatTrienChamSocDUQ_Detail extends StatelessWidget {
  ThuLaoPhatTrienChamSocDUQ_Detail({
    super.key,
    required this.timekey,
    required this.donvi,
    required this.donviId,
    required this.nhanvienHoten,
    required this.nhanvienChucdanh,
    required this.nhanvienSmcs,
    required this.soluongDuq,
    required this.soluongDuqPtmDkg,
    required this.tileDuqPtmDkg,
    required this.thulaoDuqPtmDkg,
    required this.dktttb0509,
    required this.dktttb1019,
    required this.dktttb2039,
    required this.dktttb40,
    required this.thulaoDktttb,
    required this.ptmCoGoi,
    required this.thulaoPtmCoGoi,
    required this.bangoiSlDuq,
    required this.bangoiSlThuebao,
    required this.bangoiDoanhThu,
    required this.bangoiThulao,
    required this.tongThuLao,
  });
  String timekey;
  String donvi;
  int donviId;
  String nhanvienHoten;
  String nhanvienChucdanh;
  String nhanvienSmcs;
  int soluongDuq;
  int soluongDuqPtmDkg;
  double tileDuqPtmDkg;
  double thulaoDuqPtmDkg;
  int dktttb0509;
  int dktttb1019;
  int dktttb2039;
  int dktttb40;
  double thulaoDktttb;
  int ptmCoGoi;
  double thulaoPtmCoGoi;
  int bangoiSlDuq;
  int bangoiSlThuebao;
  double bangoiDoanhThu;
  double bangoiThulao;
  double tongThuLao;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            Custom_AppBar(title: 'Chi tiết NV $nhanvienHoten'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(title: 'PBH: ', data: donvi),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(title: 'Tên NV: ', data: nhanvienHoten),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(title: 'Mã NV: ', data: nhanvienSmcs),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget:
                    Detail_Rows(title: 'Chức danh:  ', data: nhanvienChucdanh),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget:
                    Detail_Rows(title: 'SL ĐUQ: ', data: soluongDuq.toString()),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(
                    title: 'SL ĐUQ ĐKTTTB kèm gói Data từ 5 TB/tháng: ',
                    data: soluongDuqPtmDkg.toString()),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                    title: 'Tỷ lệ phát sinh sản lượng: ',
                    data: tileDuqPtmDkg.toString()),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(
                    title: 'Thù lao theo tỷ lệ đạt được: ',
                    data: NumberFormat('#,###').format(thulaoDuqPtmDkg)),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                    title: 'SL ĐUQ đăng ký từ 05-09TB: ',
                    data: dktttb0509.toString()),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(
                    title: 'SL ĐUQ đăng ký từ 10-19TB: ',
                    data: dktttb1019.toString()),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                    title: 'SL ĐUQ đăng ký từ 20-39TB: ',
                    data: dktttb2039.toString()),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(
                    title: 'SL ĐUQ đăng ký từ 40TB: ',
                    data: dktttb40.toString()),
              ), Custom_Data_Rows_Color(
                indexCount: true,
                widget:  Detail_Rows(
                title: 'Thù lao theo SL ĐUQ phát sinh: ',
                data: NumberFormat('#,###').format(thulaoDktttb),
              ),),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget:    Detail_Rows(title: 'TB PTM có gói: ', data: ptmCoGoi.toString()),
              ),
               Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                  title: 'Thù lao PTM có gói: ',
                  data: thulaoPtmCoGoi.toString()),
               ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget:   Detail_Rows(
                  title: 'SL ĐUQ bán gói: ', data: bangoiSlDuq.toString()),
               ),
                Custom_Data_Rows_Color(
                indexCount: true,
                widget:   Detail_Rows(
                  title: 'Thuê bao có gói cước: ',
                  data: bangoiSlThuebao.toString()),
               ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget:  Detail_Rows(
                title: 'Doanh thư ghi nhận: ',
                data: NumberFormat('#,###').format(bangoiDoanhThu),
               ),),
                  Custom_Data_Rows_Color(
                indexCount: true,
                widget:    Detail_Rows(
                title: 'Tiền lương dự kiến 5%: ',
                data: NumberFormat('#,###').format(bangoiThulao),
              ),),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget:   Detail_Rows(
                title: 'Tổng thù lao dự kiến: ',
                data: NumberFormat('#,###').format(tongThuLao),
                   ),),
              // Detail_Rows(title: 'PBH: ', data: donvi),
              // Detail_Rows(title: 'Tên NV: ', data: nhanvienHoten),
              // Detail_Rows(title: 'Mã NV: ', data: nhanvienSmcs),
              // Detail_Rows(title: 'Chức danh:  ', data: nhanvienChucdanh),
              // Detail_Rows(title: 'SL ĐUQ: ', data: soluongDuq.toString()),
              // Detail_Rows(
              //     title: 'SL ĐUQ ĐKTTTB kèm gói Data từ 5 TB/tháng: ',
              //     data: soluongDuqPtmDkg.toString()),
              // Detail_Rows(
              //     title: 'Tỷ lệ phát sinh sản lượng: ',
              //     data: tileDuqPtmDkg.toString()),
              // Detail_Rows(
              //     title: 'Thù lao theo tỷ lệ đạt được: ',
              //     data: NumberFormat('#,###').format(thulaoDuqPtmDkg)),
              // Detail_Rows(
              //     title: 'SL ĐUQ đăng ký từ 05-09TB: ',
              //     data: dktttb0509.toString()),
              // // const Divider(),
              // Detail_Rows(
              //     title: 'SL ĐUQ đăng ký từ 10-19TB: ',
              //     data: dktttb1019.toString()),
              // Detail_Rows(
              //     title: 'SL ĐUQ đăng ký từ 20-39TB: ',
              //     data: dktttb2039.toString()),
              // Detail_Rows(
              //     title: 'SL ĐUQ đăng ký từ 40TB: ', data: dktttb40.toString()),
              // Detail_Rows(
              //   title: 'Thù lao theo SL ĐUQ phát sinh: ',
              //   data: NumberFormat('#,###').format(thulaoDktttb),
              // ),
              // Detail_Rows(title: 'TB PTM có gói: ', data: ptmCoGoi.toString()),
              // Detail_Rows(
              //     title: 'Thù lao PTM có gói: ',
              //     data: thulaoPtmCoGoi.toString()),
              // Detail_Rows(
              //     title: 'SL ĐUQ bán gói: ', data: bangoiSlDuq.toString()),
              // Detail_Rows(
              //     title: 'Thuê bao có gói cước: ',
              //     data: bangoiSlThuebao.toString()),
              // Detail_Rows(
              //   title: 'Doanh thư ghi nhận: ',
              //   data: NumberFormat('#,###').format(bangoiDoanhThu),
              // ),
              // Detail_Rows(
              //   title: 'Tiền lương dự kiến 5%: ',
              //   data: NumberFormat('#,###').format(bangoiThulao),
              // ),
              // Detail_Rows(
              //   title: 'Tổng thù lao dự kiến: ',
              //   data: NumberFormat('#,###').format(tongThuLao),
              // ),
            ],
          ),
        ));
  }
}
