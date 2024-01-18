import 'dart:convert';
import 'package:vnptapp/Models/FiberDieuHanhGiamHuy.dart';
import 'package:vnptapp/Models/MyTVDieuHanhGiamHuy.dart';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/MyTvFiberDieuHanhGiamHuyC2.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/TongHopDieuHanhGiamHuy/Route.dart';

Future<List<FiberDieuHanhGiamHuy>> fiberDHGHc3(String? timekey, String subUrlApi,
    String manv,String nhanvienDonVi) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${TongHopDieuHanhGiamHuy_Route.getListFiberc3}?timekey=$timekey';
    response = await http.post(Uri.parse(url), headers: requestHeader,body: json.encode(<String, dynamic>{
          "pageNumber": 0,
          "pageSize": 0,
          "tenDonVi": "",
          "nhanVienDonVi": nhanvienDonVi,
          "maNV": manv,
          "chucDanh": 0
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => FiberDieuHanhGiamHuy.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
  }
}
Future<List<MyTvDieuHanhGiamHuy>> myTVDHGHc3(String? timekey, String subUrlApi,
     String manv,String nhanvienDonVi) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${TongHopDieuHanhGiamHuy_Route.getListMyTVc3}?timekey=$timekey';
    response = await http.post(Uri.parse(url), headers: requestHeader,body: json.encode(<String, dynamic>{
          "pageNumber": 0,
          "pageSize": 0,
          "tenDonVi": "",
          "nhanVienDonVi": nhanvienDonVi,
          "maNV": manv,
          "chucDanh": 0
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => MyTvDieuHanhGiamHuy.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load tổng hợp điều hành giảm  hủy');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
  }
}

Future<List<MyTvFiberDieuHanhGiamHuyC2>> myTVDHGHc2(String? timekey, String subUrlApi,
     String manv,String nhanvienDonVi) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${TongHopDieuHanhGiamHuy_Route.getListMyTVc2}?timekey=$timekey';
    response = await http.post(Uri.parse(url), headers: requestHeader,body: json.encode(<String, dynamic>{
          "pageNumber": 0,
          "pageSize": 0,
          "tenDonVi": "",
          "nhanVienDonVi": nhanvienDonVi,
          "maNV": manv,
          "chucDanh": 0
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => MyTvFiberDieuHanhGiamHuyC2.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
  }
}


Future<List<MyTvFiberDieuHanhGiamHuyC2>> fiberDHGHc2(String? timekey, String subUrlApi,
     String manv,String nhanvienDonVi) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${TongHopDieuHanhGiamHuy_Route.getListFiberc2}?timekey=$timekey';
    response = await http.post(Uri.parse(url), headers: requestHeader,body: json.encode(<String, dynamic>{
          "pageNumber": 0,
          "pageSize": 0,
          "tenDonVi": "",
          "nhanVienDonVi": nhanvienDonVi,
          "maNV": manv,
          "chucDanh": 0
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => MyTvFiberDieuHanhGiamHuyC2.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
  }
}