// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_Data_Rows_Color.dart';

class HeSoVT_CNTT_Detail extends StatelessWidget {
  HeSoVT_CNTT_Detail(
      {super.key,
      required this.fiber_quy_doi,
      required this.mytv_quy_doi,
      required this.mesh_quy_doi,
      required this.camera_quy_doi,
      required this.ddts_quy_doi,
      required this.ddtt_quy_doi,
      required this.he_so_quy_doi,
      required this.he_so_p1,
      required this.he_so_p2,
      required this.tong_diem,
      required this.tenNV});
  double fiber_quy_doi;
  String mytv_quy_doi;
  String mesh_quy_doi;
  String camera_quy_doi;
  String ddts_quy_doi;
  String ddtt_quy_doi;
  String he_so_quy_doi;
  String he_so_p1;
  String he_so_p2;
  double tong_diem;
  String tenNV;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(title: 'Chi tiết NV $tenNV'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                    title: 'Fiber quy đổi: ',
                    data: fiber_quy_doi.toStringAsFixed(2)),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget:
                    Detail_Rows(title: 'MyTV quy đổi: ', data: mytv_quy_doi),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget:
                    Detail_Rows(title: 'Mesh quy đổi: ', data: mesh_quy_doi),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(
                    title: 'Camera quy đổi:  ', data: camera_quy_doi),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(
                    title: 'Điểm trả sau quy đổi: ', data: ddts_quy_doi),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(
                    title: 'Điểm trả trước quy đổi: ', data: ddtt_quy_doi),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget:
                    Detail_Rows(title: 'Hệ số đạt được: ', data: he_so_quy_doi),
              ),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(title: 'Hệ số P1: ', data: he_so_p1),
              ),
              Custom_Data_Rows_Color(
                indexCount: true,
                widget: Detail_Rows(title: 'Hệ số P2: ', data: he_so_p2),
              ),
              const Divider(),
              Custom_Data_Rows_Color(
                indexCount: false,
                widget: Detail_Rows(
                    title: 'Tổng điểm: ', data: tong_diem.toStringAsFixed(2)),
              ),

              // Detail_Rows(title: 'MyTV quy đổi: ', data: mytv_quy_doi),
              // Detail_Rows(title: 'Mesh quy đổi: ', data: mesh_quy_doi),
              // Detail_Rows(title: 'Camera quy đổi:  ', data: camera_quy_doi),
              // Detail_Rows(title: 'Điểm trả sau quy đổi: ', data: ddts_quy_doi),
              // Detail_Rows(
              //     title: 'Điểm trả trước quy đổi: ', data: ddtt_quy_doi),
              // Detail_Rows(title: 'Hệ số đạt được: ', data: he_so_quy_doi),
              // Detail_Rows(title: 'Hệ số P1: ', data: he_so_p1),
              // Detail_Rows(title: 'Hệ số P2: ', data: he_so_p2),
              // const Divider(),
              // Detail_Rows(
              //     title: 'Tổng điểm: ', data: tong_diem.toStringAsFixed(2)),
            ],
          ),
        ));
  }
}
