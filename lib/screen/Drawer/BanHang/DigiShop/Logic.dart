// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/BanHangDigiShop.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/BanHang/DigiShop/Route.dart';
import 'package:vnptapp/screen/Drawer/BanHang/DigiShop/Variable.dart';

Future<List<BanHangDigiShop>> getListDiGiShop(
    int pageNumber,
    int pageSized,
    String? tenDonVi,
    String? nhanVienDonVi,
    String? maNV,
    int? chucDanh,
    String subUrlApi,
    String? timeKey,
    var searchkey) async {
  var responseStatus = '';
  try {
    http.Response response;

    String url = '$subUrlApi${DigiShop_Route.listDigiShop}';
    //?PageNumber=$pageNumber&PageSize=$pageSized&tenDonVi=$tenDonVi&nhanVienDonVi=$nhanVienDonVi&maNV=$maNV&chucDanh=$chucDanh&keyword=$searchkey&timekey=$timeKey';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: jsonEncode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSized,
          "tenDonVi": tenDonVi,
          "nhanVienDonVi": nhanVienDonVi,
          "maNV": maNV,
          "chucDanh": chucDanh,
          "keyword": searchkey,
          "timekey": timeKey
        }));
    //print(url);
    if (response.statusCode == 200) {
      DigiShop_Variable.totalItem = json.decode(response.body)['totalItem'];
      DigiShop_Variable.totalPage = json.decode(response.body)['totalPage'];
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => BanHangDigiShop.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load DigiShop');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    throw Exception('Lỗi khi load DigiShop');
  }
}

Future<List<BanHangDigiShop>> getDetailDigiShop(int pageNumber, int pageSized,
    String subUrlApi, String maNVTHNS, String? timeKey) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url = '$subUrlApi${DigiShop_Route.chitietDigiShop}';

    //?PageNumber=$pageNumber&PageSize=$pageSized&maNVTHNS=$maNVTHNS&timeKey=$timeKey';
    // print(url);

    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSized,
          "tenDonVi": "",
          "nhanVienDonVi": "",
          "maNV": maNVTHNS,
          "chucDanh": 0,
          "keyword": "",
          "timekey": ""
        }));
    if (response.statusCode == 200) {
      DigiShop_Variable.totalItemDetail =
          json.decode(response.body)['totalItem'];
      DigiShop_Variable.totalPageDetail =
          json.decode(response.body)['totalPage'];
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => BanHangDigiShop.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load chi tiết DigiShop');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }

    //print(e);
    throw Exception('Lỗi khi load chi tiết DigiShop');
  }
}
