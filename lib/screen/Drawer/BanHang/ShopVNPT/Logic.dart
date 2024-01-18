// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/BanHangShopVNPT.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/BanHang/ShopVNPT/Route.dart';
import 'package:vnptapp/screen/Drawer/BanHang/ShopVNPT/Variable.dart';

Future<List<BanHangShopVnpt>> getListShopVNPT(
    int pageNumber,
    int pageSized,
    String? donViMoTa,
    String? nhanVienDonVi,
    String? maNVSMCS,
    int? chucDanh,
    String subUrlApi,
    var searchkey,
    String? trangThaiGiao) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${ShopVNPT_Route.listShopVNPT}?trangThaiGiao=$trangThaiGiao';

    //  ?PageNumber=$pageNumber&PageSize=$pageSized&trangThaiGiao=$trangThaiGiao&nhanVienDonVi=$nhanVienDonVi&MaNVSMCS=$maNVSMCS&chucDanh=$chucDanh&keyword=$searchkey&donViMoTa=$donViMoTa';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSized,
          "tenDonVi": donViMoTa,
          "nhanVienDonVi": nhanVienDonVi,
          "maNV": maNVSMCS,
          "chucDanh": chucDanh,
          "keyword": searchkey,
          "timekey": ""
        }));
    // print(url);
    if (response.statusCode == 200) {
      ShopVNPT_Variable.totalItem = json.decode(response.body)['totalItem'];
      ShopVNPT_Variable.totalPage = json.decode(response.body)['totalPage'];
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => BanHangShopVnpt.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load Shop VNPT');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Lỗi khi load Shop VNPT');
  }
}

Future<List<BanHangShopVnpt>> getDetailShopVNPT(int pageNumber, int pageSized,
    String subUrlApi, String maNV, String trangThaiGiao) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${ShopVNPT_Route.chitietShopVNPT}?trangThaiGiao=$trangThaiGiao';

    //  ?PageNumber=$pageNumber&PageSize=$pageSized&maNVSMCS=$maNV&trangThaiGiao=$trangThaiGiao';
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
      ShopVNPT_Variable.totalItemDetail =
          json.decode(response.body)['totalItem'];
      ShopVNPT_Variable.totalPageDetail =
          json.decode(response.body)['totalPage'];
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => BanHangShopVnpt.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load chi tiết ShopVNPT');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }

    //print(e);
    throw Exception('Lỗi khi load chi tiết ShopVNPT');
  }
}
