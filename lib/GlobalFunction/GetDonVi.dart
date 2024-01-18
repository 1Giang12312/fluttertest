// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/DonVi.dart';
import 'package:vnptapp/Variable/Constant.dart';

Future<String> getDonViByID(int idDonvi, String subUrlApi) async {
  var responseStatus = '';
  String url = '${subUrlApi}Donvis';
  try {
    http.Response response =
        await http.get(Uri.parse('$url/$idDonvi'), headers: requestHeader);
    if (response.statusCode == 200) {
      String jsonResponse = json.decode(response.body)['donviTen'];
      return jsonResponse;
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Failed to load don vi');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    //print(e);
    throw Exception('Failed to load don vi');
  }
}

Future<List<DonVi>> listDonVi(String subUrlApi) async {
  var responseStatus = '';
  String url = '${subUrlApi}Donvis';
  try {
    http.Response response =
        await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<DonVi> listDv =[];
       listDv =
          jsonResponse.map((data) => DonVi.fromJson(data)).toList();
      DonVi defaultDV = DonVi(
          donvi_id: null,
          donvi_ten: null,
          donvi_mota: 'null',
          donvi_ma: '0 ',
          donvi_loai: 0,
          donvi_map_id: 0,
          thutu_hienthi: 0,
          donvi_pttb: 0,
          donvi_ten_2: 'null');
    listDv.add(defaultDV);
    return listDv;
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Failed to load list don vi');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
  //  print(e);
    throw Exception('Failed to load list don vi');
  }
}

Future<List<DonVi>> listDonVi11PBH(String subUrlApi) async {
  var responseStatus = '';
  String url = '${subUrlApi}Donvis/11pbh';
  try {
    http.Response response =
        await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<DonVi> listDv =[];
       listDv =
          jsonResponse.map((data) => DonVi.fromJson(data)).toList();
      DonVi defaultDV = DonVi(
          donvi_id: null,
          donvi_ten: null,
          donvi_mota: 'null',
          donvi_ma: '0 ',
          donvi_loai: 0,
          donvi_map_id: 0,
          thutu_hienthi: 0,
          donvi_pttb: 0,
          donvi_ten_2: 'null');
    listDv.add(defaultDV);
    return listDv;
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Failed to load list don vi');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
  //  print(e);
    throw Exception('Failed to load list don vi');
  }
}

Future<List<DonVi>> listDonVi11PBHVaPBCN(String subUrlApi) async {
  var responseStatus = '';
  String url = '${subUrlApi}Donvis/11pbhVapbcn';
  try {
    http.Response response =
        await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<DonVi> listDv =[];
       listDv =
          jsonResponse.map((data) => DonVi.fromJson(data)).toList();
      DonVi defaultDV = DonVi(
          donvi_id: null,
          donvi_ten: null,
          donvi_mota: 'null',
          donvi_ma: '0 ',
          donvi_loai: 0,
          donvi_map_id: 0,
          thutu_hienthi: 0,
          donvi_pttb: 0,
          donvi_ten_2: 'null');
    listDv.add(defaultDV);
    return listDv;
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Failed to load list don vi');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
  //  print(e);
    throw Exception('Failed to load list don vi');
  }
}
