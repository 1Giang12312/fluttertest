import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/OBThayTheTBDC2023.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/OBThayTheTBDC2023/Route.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/OBThayTheTBDC2023/Variable.dart';

Future<List<ObThayTheTbdc2023>> listObThayThe(
    var pageNumber,
    var pageSize,
    String maNVSmcs,
    String subUrlApi,
    int nhanVienDonViID,
    var donviId,
    var trangThaiOb,
    var searchKey,
    String chucDanh) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url = subUrlApi + OBThayTheTBDC2023_Route.getListOB;
    url =
        '$url?PageNumber=$pageNumber&PageSize=$pageSize&donViID=$donviId&nhanVienDonVi=$nhanVienDonViID&maNVSmcs=$maNVSmcs&chucDanh=$chucDanh&trangThaiOB=$trangThaiOb&searchKey=$searchKey';
    response = await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      OBThayTheTBDC2023_Variable.totalPages =
          json.decode(response.body)['totalPages'];
      OBThayTheTBDC2023_Variable.totalRecords =
          json.decode(response.body)['totalRecords'];
      return jsonResponse
          .map((data) => ObThayTheTbdc2023.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Không thể load danh sách OB thay thế 2023');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    //print(e);
    throw Exception('Không thể load danh sách OB thay thế 2023');
  }
}