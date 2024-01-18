// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/DonViTinh.dart';
import 'package:vnptapp/Models/GiaoBscNhanVien.dart';
import 'package:vnptapp/Models/KPI.dart';
import 'package:vnptapp/Models/NVNhanBSC.dart';
import 'package:vnptapp/Models/NhomKpis.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/KiemTraGiaoBSC/GiaoBscNhanVien/Route.dart';
import 'dart:convert';

import 'package:vnptapp/screen/Drawer/KiemTraGiaoBSC/GiaoBscNhanVien/Variable.dart';

// Future<List<DonVi>> listDonVi() async {
//   try {
//     http.Response response = await http
//         .get(Uri.parse(NhanVienBsc_Route.listDonVi), headers: requestHeader);
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => DonVi.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load list don vi');
//     }
//   } catch (e) {
//     print(e);
//     throw Exception('Failed to load list don vi');
//   }
// }
Future<List<GiaoBscNhanVien>> listNhanVienNhanBSC(
    int pageNumber,
    int pageSize,
    String month,
    String year,
    var idDonvi,
    var keyword,
    String subUrlApi,
    int chucDanh,
    int nhanVienDonVi,
    int nhanVienID) async {
  var responseStatus = '';
  String url = subUrlApi + NhanVienBsc_Route.listBSCs;
  var monthParse = int.tryParse(month);
  var yearParse = int.tryParse(year);
  monthParse ??= DateTime.now().month;
  yearParse ??= DateTime.now().year;

  try {
    http.Response response;
    url =
        '$url?PageNumber=$pageNumber&PageSize=$pageSize&thang=$monthParse&nam=$yearParse&keyword=$keyword&idDonVi=$idDonvi&NhanVienID=$nhanVienID&chucDanh=$chucDanh&nhanVienDonVi=$nhanVienDonVi';
    // if (idDonvi == null) {
    //   if (keyword == null) {
    //     response = await http.get(
    //         Uri.parse(
    //             '$url?PageNumber=$pageNumber&PageSize=$pageSize&thang=$month&nam=$year'),
    //         headers: requestHeader);
    //   } else {
    //     response = await http.get(
    //         Uri.parse(
    //             '$url?PageNumber=$pageNumber&PageSize=$pageSize&thang=$month&nam=$year&keyword=$keyword'),
    //         headers: requestHeader);
    //   }
    // } else {
    //   if (keyword == null) {
    //     response = await http.get(
    //         Uri.parse(
    //             '$url?PageNumber=$pageNumber&PageSize=$pageSize&thang=$month&nam=$year&idDonVi=$idDonvi'),
    //         //http.Response response = await http.get(Uri.parse(HomePageAPI.listBSCs),
    //         headers: requestHeader);
    //   } else {
    //     response = await http.get(
    //         Uri.parse(
    //             '$url?PageNumber=$pageNumber&PageSize=$pageSize&thang=$month&nam=$year&idDonVi=$idDonvi&keyword=$keyword'),
    //         //http.Response response = await http.get(Uri.parse(HomePageAPI.listBSCs),
    //         headers: requestHeader);
    //   }
    // }
    response = await http.get(Uri.parse(url), headers: requestHeader);
    //print(url);
    if (response.statusCode == 200) {
      GiaoBscNhanVien_Variable.totalResponsePages =
          json.decode(response.body)['totalPages'];
      GiaoBscNhanVien_Variable.totalResponseItem =
          json.decode(response.body)['totalRecords'];
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => GiaoBscNhanVien.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load nhân viên bsc Vui lòng thử lại');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    //print(e);
    throw Exception('Lỗi khi load nhân viên bsc Vui lòng thử lại');
  }
}

Future<int> getDonViByNhanVienNhan(int nhanvienNhan, String subUrlApi) async {
  String url = subUrlApi + NhanVienBsc_Route.ApiNhanVien;
  // print(url);
  try {
    http.Response response =
        await http.get(Uri.parse('$url/$nhanvienNhan'), headers: requestHeader);
    if (response.statusCode == 200) {
      int jsonResponse = json.decode(response.body)['nhanvienDonvi'];
      return jsonResponse;
    } else {
      throw Exception('Failed to load don vi');
    }
  } catch (e) {
    // print(e);
    throw Exception('Failed to load don vi');
  }
}

// Future<GiaoBscNhanVien> getGiaoBSCByID(
//     int nhanVienGiao, int nhanvienNhan, int thanng, int nam) async {
//   try {
//     http.Response response = await http.get(
//         Uri.parse(
//             '${NhanVienBsc_Route.layTenGiaoBSC}?Nhanviengiao=$nhanVienGiao&Nhanviennhan=$nhanvienNhan&thang=$thanng&nam=$nam'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8'
//         });
//     if (response.statusCode == 200) {
//       var jsonResponse = json.decode(response.body);
//       var result = GiaoBscNhanVien.fromJson(jsonResponse);
//       return result;
//     } else {
//       throw Exception('Failed to load don vi by id');
//     }
//   } catch (e) {
//     print(e);
//     throw Exception('Failed to load don vi by id');
//   }
// }
Future<String> getNameNhanVien(String idNhanVien, String subUrlApi) async {
  try {
    http.Response response = await http.get(
        Uri.parse('${subUrlApi + NhanVienBsc_Route.ApiNhanVien}/$idNhanVien'),
        headers: requestHeader);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['nhanvienHoten'];
      return jsonResponse;
    } else {
      throw Exception('Failed to load lấy tên nhân viên');
    }
  } catch (e) {
    //print(e);
    throw Exception('Failed to load  lấy tên nhân viên');
  }
}

Future<String> getMaNhanVien(String idNhanVien, String subUrlApi) async {
  try {
    http.Response response = await http.get(
        Uri.parse('${subUrlApi + NhanVienBsc_Route.ApiNhanVien}/$idNhanVien'),
        headers: requestHeader);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['nhanvienManv'];
      return jsonResponse;
    } else {
      throw Exception('Failed to load lấy tên nhân viên');
    }
  } catch (e) {
    // print(e);
    throw Exception('Failed to load  lấy tên nhân viên');
  }
}

Future<NVNhanBSC> getBSCThamDinh(int nhanviengiao, int nhanviennhan, int thang,
    int nam, String subUrlApi) async {
  String url = subUrlApi + NhanVienBsc_Route.bscNhanVien;
  try {
    http.Response response = await http.get(
        Uri.parse(
            '$url/thamdinh?nhanviengiao=$nhanviengiao&nhanviennhan=$nhanviennhan&thang=$thang&nam=$nam'),
        headers: requestHeader);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var result = NVNhanBSC.fromJson(jsonResponse);
      return result;
    } else {
      throw Exception('Failed to load don vi by id');
    }
  } catch (e) {
    //print(e);
    throw Exception('Failed to load don vi by id');
  }
}

Future<List<NVNhanBSC>> getListBscNhanVien(int nhanviengiao, int nhanviennhan,
    int thang, int nam, String subUrlApi) async {
  String url = subUrlApi + NhanVienBsc_Route.bscNhanVien;
  try {
    http.Response response;
    response = await http.get(
        Uri.parse(
            '$url/BscDetail?nhanviengiao=$nhanviengiao&nhanviennhan=$nhanviennhan&thang=$thang&nam=$nam'),
        //http.Response response = await http.get(Uri.parse(HomePageAPI.listBSCs),
        headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => NVNhanBSC.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load nhan vien nhan bsc');
    }
  } catch (e) {
    // print(e);
    throw Exception('Failed to load nhan vien nhan bsc');
  }
}

Future<KPI> getKPIByID(int id, String subUrlApi) async {
  String url = subUrlApi + NhanVienBsc_Route.Kpis;
  try {
    http.Response response =
        await http.get(Uri.parse('$url/$id'), headers: requestHeader);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var result = KPI.fromJson(jsonResponse);
      return result;
    } else {
      throw Exception('Failed to load don vi by id');
    }
  } catch (e) {
    //print(e);
    throw Exception('Failed to load don vi by id');
  }
}

Future<DonviTinh> getDonviTinhByID(int id, String subUrlApi) async {
  String url = subUrlApi + NhanVienBsc_Route.Donvitinhs;
  try {
    http.Response response =
        await http.get(Uri.parse('$url/$id'), headers: requestHeader);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var result = DonviTinh.fromJson(jsonResponse);
      return result;
    } else {
      throw Exception('Failed to load don vi by id');
    }
  } catch (e) {
    //print(e);
    throw Exception('Failed to load don vi by id');
  }
}

Future<NhomKpis> getNhomKpisByID(int id, String subUrlApi) async {
  String url = subUrlApi + NhanVienBsc_Route.Nhomkpis;
  try {
    http.Response response =
        await http.get(Uri.parse('$url/$id'), headers: requestHeader);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var result = NhomKpis.fromJson(jsonResponse);
      return result;
    } else {
      throw Exception('Failed to load don vi by id');
    }
  } catch (e) {
    //  print(e);
    throw Exception('Failed to load don vi by id');
  }
}
