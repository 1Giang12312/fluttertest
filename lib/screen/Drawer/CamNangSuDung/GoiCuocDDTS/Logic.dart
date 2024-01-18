// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/GoiCuocDDTS.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/CamNangSuDung/GoiCuocDDTS/Route.dart';
import 'package:vnptapp/screen/Drawer/CamNangSuDung/GoiCuocDDTS/Variable.dart';

Future<List<GoiCuocDDTS>> listGoiCuocDDTS(
    int pageNumber, int pageSize, var keyword, String subUrlApi) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url = '$subUrlApi${GoiCuocDDTS_Route.getListDDTS}?pageNumber=$pageNumber&pageSize=$pageSize';
    // if (keyword == '') {
    //   response = await http.get(
    //       Uri.parse('$url?pageNumber=$pageNumber&pageSize=$pageSize'),
    //       headers: requestHeader);
    // } else {
    //   response = await http.get(
    //       Uri.parse(
    //           '$url?pageNumber=$pageNumber&pageSize=$pageSize&keyword=$keyword'),
    //       headers: requestHeader);
    // }
    if (keyword != '') {
      url = '$url&keyword=$keyword';
    }
    response = await http.get(
        Uri.parse(url),
        headers: requestHeader);
    if (response.statusCode == 200) {
      GoiCuocDDTS_Variable.totalPage = json.decode(response.body)['totalPage'];
      GoiCuocDDTS_Variable.totalItem = json.decode(response.body)['totalItem'];
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => GoiCuocDDTS.fromJson(data)).toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load gói cước di dộng trả sau');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
   // print(e);
    throw Exception('Lỗi khi load gói cước di dộng trả sau');
  }
}
