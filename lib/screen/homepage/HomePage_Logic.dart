// ignore_for_file: file_names
// // ignore_for_file: file_names

// import 'package:http/http.dart' as http;
// import 'package:vnptapp/Models/DonVi.dart';
// import 'package:vnptapp/Models/GiaoBscNhanVien.dart';
// import 'package:vnptapp/Models/NVNhanBSC.dart';
// import 'package:vnptapp/screen/homepage/HomePage_Route.dart';
// import 'dart:convert';
// // late Map mapRespone;
// // late Map dataRespone;
// // late List listRespone;
// // Future<List> callListDataApi() async {
// //   http.Response response; 
// //   response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
// //   if (response.statusCode == 200) {
// //     mapRespone = json.decode(response.body);
// //     listRespone = mapRespone['data'];
// //     return listRespone;
// //   } else {
// //     return listRespone;
// //   }
// // }
// // Future<List<BSC>> listBSCs(
// //     int pageNumber, int pageSize, int month, int year, var id_DonVi) async {
// //   try {
// //     if (id_DonVi == null) {
// //       http.Response response = await http.get(
// //           Uri.parse(
// //               '${HomePageAPI.listBSCs}?PageNumber=$pageNumber&PageSize=$pageSize&month=$month&year=$year'),
// //           //http.Response response = await http.get(Uri.parse(HomePageAPI.listBSCs),
// //           headers: <String, String>{
// //             'Content-Type': 'application/json; charset=UTF-8'
// //           });
// //       if (response.statusCode == 200) {
// //         TotalPages.BSCTotalPage=json.decode(response.body)['totalPages'];
// //         //List jsonResponse = json.decode(response.body)['data'];
// //         List jsonResponse = json.decode(response.body)['data'];
// //         return jsonResponse.map((data) => BSC.fromJson(data)).toList();
// //       } else {
// //         throw Exception('Failed to load BSC');
// //       }
// //     } else {
// //       http.Response response = await http.get(
// //           Uri.parse(
// //               '${HomePageAPI.listBSCs}?PageNumber=$pageNumber&PageSize=$pageSize&month=$month&year=$year&id_DonVi=${int.parse(id_DonVi)}'),
// //           //http.Response response = await http.get(Uri.parse(HomePageAPI.listBSCs),
// //           headers: <String, String>{
// //             'Content-Type': 'application/json; charset=UTF-8'
// //           });
// //       if (response.statusCode == 200) {
// //         TotalPages.BSCTotalPage=json.decode(response.body)['totalPages'];
// //         //List jsonResponse = json.decode(response.body)['data'];
// //         List jsonResponse = json.decode(response.body)['data'];
// //         return jsonResponse.map((data) => BSC.fromJson(data)).toList();
// //       } else {
// //         throw Exception('Failed to load BSC');
// //       }
// //     }
// //   } catch (e) {
// //     print(e);
// //     throw Exception('Failed to load BSC');
// //   }
// // }
// // lấy tên đơn vị
// // Future<List<ChiTietDSNVNBSC>> listChiTietNhanVienBSC(String MaNV) async {
// //   try { 
// //       http.Response response = await http.get(
// //           Uri.parse(
// //               '${HomePageAPI.listDSNVNBSC}?MaNV=$MaNV'),
// //           //http.Response response = await http.get(Uri.parse(HomePageAPI.listBSCs),
// //           headers: <String, String>{
// //             'Content-Type': 'application/json; charset=UTF-8'
// //           });
// //       if (response. statusCode == 200) {
// //         List jsonResponse = json.decode(response.body);
// //         return jsonResponse.map((data) => ChiTietDSNVNBSC.fromJson(data)).toList();
// //       } 
// //       if(response.statusCode==404){
// //         return List.empty();
// //       }
// //       else {
// //         throw Exception('Failed to load');
// //       }
// //   } catch (e) {
// //     print(e);
// //     throw Exception('Failed to load');
// //   }}
// //   //lấy tên đơn vị
// // Future<String> layTenDonVi (String Id_DonVi) async{
// //  try { 
// //       http.Response response = await http.get(
// //           Uri.parse(
// //               '${HomePageAPI.listDonVi}$Id_DonVi'),
// //           //http.Response response = await http.get(Uri.parse(HomePageAPI.listBSCs),
// //           headers: <String, String>{
// //             'Content-Type': 'application/json; charset=UTF-8'
// //           });
// //       if (response.statusCode == 200) {
// //         var jsonResponse = json.decode(response.body)['st_TenDonVi'];
// //         return jsonResponse;
// //       } 
// //       else {
// //         throw Exception('Failed to load');
// //       }
// //   } catch (e) {
// //     print(e);
// //     throw Exception('Failed to load');
// //   }}