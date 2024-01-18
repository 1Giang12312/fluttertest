// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:vnptapp/Models/TmpDanhsachGoicuocSmc.dart';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/CamNangSuDung/DanhSachGoiCuocTruoc15_6_2023/Route.dart';
import 'package:vnptapp/screen/Drawer/CamNangSuDung/DanhSachGoiCuocTruoc15_6_2023/Variable.dart';

Future<List<TmpDanhsachGoicuocSmc>> listGoiCuocTruoc15_6_2023(
    int pageNumber,
    int pageSize,
    String trangThai,
    String? keyWord,
    String subUrlApi,
    String loai_goi) async {
  http.Response response;
  String url = subUrlApi +
      DanhSachGoiCuocTruoc15_6_2023_Route.getListGoiCuocTruoc15_6_2023;
  var responseStatus = '';
  try {
    String apiString = '$url?pageNumber=$pageNumber&pageSize=$pageSize';
    if (trangThai != 'Tất cả') {
      apiString = '$apiString&trangThai=$trangThai';
    }
    if (keyWord?.isNotEmpty == true) {
      apiString = '$apiString&keyword=$keyWord';
    }
    if (loai_goi != 'Tất cả') {
      apiString = '$apiString&loai_goi=$loai_goi';
    }
    response = await http.get(Uri.parse(apiString), headers: requestHeader);
    if (response.statusCode == 200) {
      DanhSachGoiCuocTruoc15_6_2023_Variable.totalPage =
          json.decode(response.body)['totalPage'];
      DanhSachGoiCuocTruoc15_6_2023_Variable.totalItem =
          json.decode(response.body)['totalItem'];
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => TmpDanhsachGoicuocSmc.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception(
          'Lỗi khi danh sách gói cước trước 15/06/2023 Vui lòng thử lại');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    //print(e);
    throw Exception('Không thể load danh sách gói cước trước 15/06/2023');
  }
}
