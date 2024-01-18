// ignore_for_file: file_names

import 'dart:convert';

import 'package:vnptapp/Models/TheoDoiDuLieuVTCI.dart';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/VTCI/TheoDoiDuLieuVTCI/Route.dart';
import 'package:vnptapp/screen/Drawer/VTCI/TheoDoiDuLieuVTCI/Variable.dart';

Future<List<TheoDoiDuLieuVtci>> getListVTCI(
    int pageNumber,
    int pageSize,
    String timeKey,
    String maNVTHNS,
    int chucDanh,
    String? nhanVienDonVi,
    int? namTrienKhai,
    double? loai,
    String? searchKey,
    String? tenDonVi2,
    String? trangThai,
    String? tenNhanVienDonVi,
    String subUrlApi) async {
  var timeKeyParse = double.tryParse(timeKey);
  timeKeyParse ??= double.parse(
      DateTime.now().month.toString() + DateTime.now().year.toString());
  var responseStatus = '';
  http.Response response;
  String url = subUrlApi + TheoDoiDuLieuVTCI_Route.getListVTCI;
  try {
    // url =
    //     '$url?PageNumber=$pageNumber&PageSize=$pageSize&timeKey=$timeKey&nhanVienDonVi=$nhanVienDonViID&namTrienKhai=$namTrienKhai&loai=$loai&searchkey=$searchKey&tenDonVi2=$tenDonVi2&trangThai=$trangThai&tenNhanVienDonVi=$tenNhanVienDonVi';
    url =
        '$url?timeKey=$timeKey&trangThai=$trangThai&namTrienKhai=$namTrienKhai&loai=$loai&searchkey=$searchKey';

    //print(url);
    response = await http.post(Uri.parse(url),
        body: jsonEncode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSize,
          "tenDonVi": tenDonVi2,
          "nhanVienDonVi": nhanVienDonVi,
          "maNV": maNVTHNS,
          "chucDanh": chucDanh,
          "keyword": searchKey,
          "timekey": timeKey
        }),
        headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      TheoDoiDuLieuVTCI_Variable.totalPage =
          json.decode(response.body)['totalPage'];
      TheoDoiDuLieuVTCI_Variable.totalItem =
          json.decode(response.body)['totalItem'];
      return jsonResponse.map((e) => TheoDoiDuLieuVtci.fromJson(e)).toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = "Unauthorized";
      throw Exception("Unauthorize");
    } else {
      throw Exception("Không thể load theo dõi dữ liệu VTCI");
    }
  } catch (e) {
    // print(e);
    if (responseStatus == 'Unauthorized') {
      throw Exception("Unauthorized");
    }
    throw Exception("Không thể load theo dõi dữ liệu VTCI");
  }
}

Future<List<int>> getListNamTrienKhai(String subUrlApi) async {
  http.Response response;
  try {
    String url = subUrlApi + TheoDoiDuLieuVTCI_Route.getListNamTrienKhai;
    response = await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<int> listNam = [];
      listNam =
          jsonResponse.map<int>((jsonObject) => jsonObject["nam"]).toList();
      listNam.add(0);
      return listNam;
    } else {
      throw Exception("Không thể load năm triển khai");
    }
  } catch (e) {
    throw Exception("Không thể load năm triển khai");
  }
}

Future<List<String>> getTenDonVi2(String subUrlApi) async {
  http.Response response;
  try {
    String url = subUrlApi + TheoDoiDuLieuVTCI_Route.getListTenDonVi2;
    response = await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<String> listDV = [];
      listDV = jsonResponse
          .map<String>((jsonObject) => jsonObject["tenDonvi"])
          .toList();
      listDV.add("null");
      return listDV;
    } else {
      throw Exception("Không thể load tên đơn vị 2");
    }
  } catch (e) {
    throw Exception("Không thể load tên đơn vị 2");
  }
}
