import 'dart:convert';

import 'package:vnptapp/Models/C3DieuHanhGiamHuy.dart';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/TongHop.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/TongHop/Route.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/TongHop/Variable.dart';

Future<List<C3DieuHanhGiamHuy>> getlistTongHop(
    int pageNumber,
    int pageSize,
    String maNVTHNS,
    String subUrlApi,
    String timeKey,
    int nhanVienDonVi,
    String? donvi_Pttb,
    String? chucDanh,
    String? keyword) async {
  var responseStatus = '';
  try {
    List<C3DieuHanhGiamHuy> tmp = [];
    http.Response response;
    String url =
        '$subUrlApi${TongHop_Route.listTongHop}?timekey=$timeKey&donvi_pttb=$donvi_Pttb&keyword=$keyword';
    //?PageNumber=$pageNumber&PageSize=$pageSize&maNVTHNS=$maNVTHNS&timekey=$timeKey&nhanVienDonVi=$nhanVienDonVi';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSize,
          "tenDonVi": "",
          "nhanVienDonVi": nhanVienDonVi.toString(),
          "maNV": maNVTHNS,
          "chucDanh": chucDanh
        }));
    if (response.statusCode == 200) {
      TongHop_Variable.totalPage = json.decode(response.body)['totalPage'];
      TongHop_Variable.totalRecord = json.decode(response.body)['totalItem'];
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => C3DieuHanhGiamHuy.fromJson(data))
          .toList();
    } else if (response.body == "Không tìm thấy mã NV") {
      throw ('loi ma nv');
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else if (response.body == 'Không tìm thấy thời gian vừa nhập') {
      TongHop_Variable.totalPage = 1;
      TongHop_Variable.totalRecord = 0;
      return tmp;
    } else {
      throw Exception('Lỗi khi load điều hành giảm hủy');
    }
  } catch (e) {
    print(e);
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    if (e == 'loi ma nv') {
      throw Exception("Nhân viên không thuộc C3 nào");
    }
    // print(e);
    throw Exception('Lỗi khi load tổng hợp');
  }
}

Future<TongHop> getDetailTonngHop(
    String? subUrlApi, String? timeKey, int? maKVC3) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${TongHop_Route.detailTongHop}?timekey=$timeKey&maKVC3=$maKVC3';
    response = await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['data'];
      if (jsonResponse == null) {
        throw Exception("nodata");
      }
      return TongHop.fromJson(jsonResponse);
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load chi tiết điều hành giảm hủy');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    } else if (e.toString() == "Exception: nodata") {
      throw Exception("Chưa có dữ liệu tháng $timeKey");
    }
    throw Exception('Lỗi khi load chi tiết điều hành giảm hủy');
  }
}
