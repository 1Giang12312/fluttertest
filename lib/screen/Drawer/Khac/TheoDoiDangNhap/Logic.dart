import 'dart:convert';

import 'package:vnptapp/Models/TheoDoiDangNhap.dart';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/Khac/TheoDoiDangNhap/Route.dart';
import 'package:vnptapp/screen/Drawer/Khac/TheoDoiDangNhap/Variable.dart';

Future<List<TheoDoiDangNhap>> listTheoDoiDangNhap(
    String subUrlApi,
    var pageNumber,
    var pageSize,
    String nhanVienDonVi,
    var donviId,
    var searchKey,
    String chucDanh) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url = subUrlApi + TheoDoiDangNhap_Route.getListDemDangNhap;
    url = '$url?keyword=$searchKey';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: jsonEncode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSize,
          "tenDonVi": donviId,
          "nhanVienDonVi": nhanVienDonVi,
          "maNV": "",
          "chucDanh": chucDanh,
          "keyword": searchKey,
          "timekey": ""
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      TheoDoiDangNhap_Variable.totalPages =
          json.decode(response.body)['totalPage'];
      TheoDoiDangNhap_Variable.totalRecords =
          json.decode(response.body)['totalItem'];
      return jsonResponse
          .map((data) => TheoDoiDangNhap.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Không thể load danh sách theo dõi đăng nhập');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    //print(e);
    throw Exception('Không thể load danh sách theo dõi đăng nhập');
  }
}
