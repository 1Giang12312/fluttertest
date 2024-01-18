// ignore_for_file: file_names

import 'dart:convert';

import 'package:vnptapp/Models/BanHang.dart';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/PTTB.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/BanHang/PTTB/Route.dart';
import 'package:vnptapp/screen/Drawer/BanHang/PTTB/Variable.dart';

Future<List<BanHang>> getListPTTB(
    int pageNumber,
    int pageSized,
    String? tenDonVi,
    String? nhanVienDonVi,
    String? maNV,
    int? chucDanh,
    String subUrlApi,
    var searchkey) async {
      //print(localNhanVien.nhanvien_manv);
  var responseStatus = '';
  try {
    http.Response response;
    String url = '$subUrlApi${PTTB_Route.listPTTB}';
    //?PageNumber=$pageNumber&PageSize=$pageSized&tenDonVi=$tenDonVi&nhanVienDonVi=$nhanVienDonVi&maNV=$maNV&chucDanh=$chucDanh&keyword=$searchkey';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSized,
          "tenDonVi": tenDonVi,
          "nhanVienDonVi": nhanVienDonVi,
          "maNV": maNV,
          "chucDanh": chucDanh,
          "keyword": searchkey,
          "timekey": ""
        }));
    if (response.statusCode == 200) {
      PTTB_Variable.totalItem = json.decode(response.body)['totalItem'];
      PTTB_Variable.totalPage = json.decode(response.body)['totalPage'];
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => BanHang.fromJson(data)).toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load PTTB');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Lỗi khi load PTTB');
  }
}

Future<List<Pttb>> getDetailPTTB(
    int pageNumber, int pageSized, String subUrlApi, String maNV) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url = '$subUrlApi${PTTB_Route.chitietPTTB}';

    // ?PageNumber=$pageNumber&PageSize=$pageSized&maNV=$maNV';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSized,
          "tenDonVi": "",
          "nhanVienDonVi": "",
          "maNV": maNV,
          "chucDanh": 0,
          "keyword": "",
          "timekey": ""
        }));
    if (response.statusCode == 200) {
      PTTB_Variable.totalItemDetail =
          json.decode(response.body)['totalItem'];
      PTTB_Variable.totalPageDetail = json.decode(response.body)['totalPage'];
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => Pttb.fromJson(data)).toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load chi tiết PTTB');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }

    // print(e);
    throw Exception('Lỗi khi load chi tiết PTTB');
  }
}
