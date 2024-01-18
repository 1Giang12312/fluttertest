// ignore_for_file: file_names

import 'dart:convert';
import 'package:vnptapp/Models/HeSoSanLuongVT-CNTT.dart';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/HeSoVT-CNTT/Route.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/HeSoVT-CNTT/Variable.dart';

Future<List<HeSoSanLuongVT_CNTT>> listHeSoSanLuong(
    int pageNumber,
    int pageSize,
    String month,
    String year,
    var tenDonVi,
    String tendonviNhanvien,
    String maNhanVien,
    String chucDanh,
    String subUrlApi) async {
  http.Response response;
  String url = subUrlApi + HeSoSanLuongVT_CNTT_Route.listHeSoSanLuong;
  var responseStatus = '';
  try {
    // if (tendonviNhanvien == 'Phòng Điều hành - Nghiệp vụ') {
    //   if (tenDonVi == '') {
    //     url =
    //         '$url?pageNumber=$pageNumber&pageSize=$pageSize&nhanVienDonVi=$tendonviNhanvien&thang=$month&nam=$year';
    //   } else {
    //     url =
    //         '$url?pageNumber=$pageNumber&pageSize=$pageSize&tenDonVi=$tenDonVi&nhanVienDonVi=Ph%C3%B2ng%20%C4%90i%E1%BB%81u%20h%C3%A0nh%20-%20Nghi%E1%BB%87p%20v%E1%BB%A5&maNV=$maNhanVien&chucDanh=$chucDanh&thang=$month&nam=$year';
    //   }
    //   response = await http.get(Uri.parse(url), headers: requestHeader);
    // } else {
    //   if (chucDanh == '1' || chucDanh == '2') {
    //     url =
    //         '$url?PageNumber=1&PageSize=5&tenDonVi=$tenDonVi&chucDanh=$chucDanh&thang=$month&nam=$year';
    //   } else {
    //     url =
    //         '$url?PageNumber=1&PageSize=5&maNV=$maNhanVien&chucDanh=$chucDanh&thang=$month&nam=$year';
    //   }
    //   response = await http.get(Uri.parse(url), headers: requestHeader);
    // }
    url =
        '$url?PageNumber=$pageNumber&PageSize=$pageSize&tenDonVi=$tenDonVi&nhanVienDonVi=$tendonviNhanvien&maNV=$maNhanVien&chucDanh=$chucDanh&thang=$month&nam=$year';
   response = await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      HeSoVT_CNTT_Variable.totalResponsePages =
          json.decode(response.body)['totalPages'];
      HeSoVT_CNTT_Variable.totalResponseItem =
          json.decode(response.body)['totalRecords'];
      return jsonResponse
          .map((data) => HeSoSanLuongVT_CNTT.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Không thể load hệ số sản lượng VT_CNTT');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
   // print(e);
    throw Exception('Không thể load hệ số sản lượng VT_CNTT');
  }
}

Future<String> getNameNhanVien(String maNV, String subUrlApi) async {
  var responseStatus = '';
  String url = subUrlApi + HeSoSanLuongVT_CNTT_Route.getNameNhanVien;
  try {
    http.Response response = await http.get(Uri.parse('$url?maNhanVien=$maNV'),
        headers: requestHeader);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['nhanvienHoten'];
      return jsonResponse;
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Failed to load lấy tên nhân viên');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
   // print(e);
    throw Exception('Failed to load  lấy tên nhân viên');
  }
}
