// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/TheoDoiGoiCuocPTM.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/ThongKeBaoCao/TheoDoiGoiCuocPTM/Route.dart';
import 'package:vnptapp/screen/Drawer/ThongKeBaoCao/TheoDoiGoiCuocPTM/Variable.dart';
Future<List<TheoDoiGoiCuocPtm>> listTheoDoiPTM(
    int pageNumber,
    int pageSize,
    DateTime ngayBatDau,
    DateTime ngayKetThuc,
    var donViId,
    int nhanVienDonViID,
    String maNhanVien,
    int chucDanh,
    String subUrlApi,
    //var soLuongPhanTu
    ) async {
  var responseStatus = '';
  http.Response response;
  String url = subUrlApi + TheoDoiGoiCuocPTM_Route.getList;
  try {
    url =
        '$url?pageNumber=$pageNumber&pageSize=$pageSize&ngayBatDau=$ngayBatDau&ngayKetThuc=$ngayKetThuc&manv=$maNhanVien&donViID=$donViId&chucDanh=$chucDanh&nhanVienDonViID=$nhanVienDonViID';
    response = await http.get(Uri.parse(url), headers: requestHeader);
   // print(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      TheoDoiGoiCuocPTM_Variable.totalPages =
          json.decode(response.body)['totalPage'];
      TheoDoiGoiCuocPTM_Variable.totalRecord =
          json.decode(response.body)['totalItem'];
      return jsonResponse
          .map((data) => TheoDoiGoiCuocPtm.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorized');
    } else {
      throw Exception('Không thể load theo dõi gói cước phát triển mới');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
   // print(e);
    throw Exception('Không thể load theo dõi gói cước phát triển mới');
  }
}

Future<String> getMaxTime(String subUrlApi) async {
  var responseStatus = '';
  try {
    http.Response response = await http.get(
        Uri.parse(subUrlApi + TheoDoiGoiCuocPTM_Route.getTimeMax),
        headers: requestHeader);
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lấy time max bị lỗi');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    throw Exception('Lấy time max bị lỗi');
  }
}
