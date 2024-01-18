// // ignore_for_file: file_names

// import 'dart:convert';

// import 'package:vnptapp/Models/NhanVien.dart';
// import 'package:vnptapp/Models/PhanQuyen.dart';
// import 'package:vnptapp/Variable/Constant.dart';
// import 'package:vnptapp/screen/Drawer/Khac/QuanLyPhanQuyen/Route.dart';
// import 'package:http/http.dart' as http;
// import 'package:vnptapp/screen/Drawer/Khac/QuanLyPhanQuyen/Variable.dart';

// Future<List<NhanVien>> getListNhanVien(int pageNumber, int pageSized,
//     String? donViID, String? keyword, String subUrlApi) async {
//   String url = subUrlApi + QuanLyPhanQuyen_Route.nhanvien;
//   var responseStatus = '';

//   try {
//     http.Response response;
//     response = await http.get(
//         Uri.parse(
//             '$url?pageNumber=$pageNumber&pageSize=$pageSized&keyword=$keyword&donVi=$donViID'),
//         //http.Response response = await http.get(Uri.parse(HomePageAPI.listBSCs),
//         headers: requestHeader);
//     if (response.statusCode == 200) {
//       QuanLyPhanQuyen_Variable.totalPages =
//           json.decode(response.body)['totalPage'];
//       QuanLyPhanQuyen_Variable.totalRecords =
//           json.decode(response.body)['totalItem'];
//       List jsonResponse = json.decode(response.body)['data'];
//       return jsonResponse.map((data) => NhanVien.fromJson(data)).toList();
//     } else if (response.reasonPhrase == "Unauthorized") {
//       responseStatus = 'Unauthorized';
//       throw Exception('Unauthorize');
//     } else {
//       throw Exception('Failed to load nhan vien nhan');
//     }
//   } catch (e) {
//     if (responseStatus == 'Unauthorized') {
//       throw Exception('Unauthorized');
//     }
//     //print(e);
//     throw Exception('Failed to load nhan vien nhan');
//   }
// }

// Future<PhanQuyen> getPhanQuyen(int nhanvienId) async {
//   String url = QuanLyPhanQuyen_Route.phaQuyen;
//   try {
//     http.Response response;
//     response = await http.get(Uri.parse('$url?nhanVienId=$nhanvienId'),
//         //http.Response response = await http.get(Uri.parse(HomePageAPI.listBSCs),
//         headers: requestHeader);
//     if (response.statusCode == 200) {
//       // List chiTietPhanQuyen = json.decode(response.body)['chiTietPhanQuyen'];
//       // localChiTietPhanQuyen = chiTietPhanQuyen
//       //     .map((data) => ChiTietPhanQuyen.fromJson(data))
//       //     .toList();
//       return PhanQuyen.fromJson(json.decode(response.body)['phanQuyen']);
//       //return response.statusCode;
//     } else {
//       throw Exception('Failed to load nhan vien nhan');
//     }
//   } catch (e) {
//    // print(e);
//     throw Exception('Failed to load nhan vien nhan');
//   }
// }
