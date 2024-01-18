import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/C3DieuHanhGiamHuy.dart';
import 'package:vnptapp/Models/ChiTietDieuHanhGiamHuy.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/DieuHanhGiamHuy/Route.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/DieuHanhGiamHuy/Variable.dart';

// Future<NgungPsc> ngungPsc(
//     String? timekey, int? maDonVic3, String subUrlApi) async {
//   var responseStatus = '';
//   try {
//     http.Response response;
//     String url =
//         '$subUrlApi${DieuHanhGiamHuy_Route.getNgungPsc}?timekey=$timekey&maDonVic3=$maDonVic3';
//     response = await http.get(Uri.parse(url), headers: requestHeader);
//     if (response.statusCode == 200) {
//       var jsonResponse = json.decode(response.body)['data'];
//       return NgungPsc.fromJson(jsonResponse);
//     } else if (response.reasonPhrase == "Unauthorized") {
//       responseStatus = 'Unauthorized';
//       throw Exception('Unauthorize');
//     }
//     //  else if(response.body== 'Không tìm thấy mã NV'){
//     //   return tmp;
//     // }
//     else {
//       throw Exception('Lỗi khi load điều hành quản lý');
//     }
//   } catch (e) {
//     if (responseStatus == 'Unauthorized') {
//       throw Exception('Unauthorized');
//     }
//     // print(e);
//     throw Exception('Lỗi khi load  điều hành quản lý');
//   }
// }

// Future<String> getC3Name(int c3Id, String subUrlApi) async {
//   var responseStatus = '';
//   try {
//     String tmp = '';
//     http.Response response;
//     String url = '$subUrlApi${DieuHanhGiamHuy_Route.getC3Name}?c3Id=$c3Id';
//     response = await http.get(Uri.parse(url), headers: requestHeader);
//     if (response.statusCode == 200) {
//       String responseString = json.decode(response.body)['data'];
//       return responseString;
//     } else if (response.reasonPhrase == "Unauthorized") {
//       responseStatus = 'Unauthorized';
//       throw Exception('Unauthorize');
//     } else if (json.decode(response.body)['data'] == 'Không tìm thấy mã NV') {
//       return tmp;
//     } else {
//       throw Exception('Lỗi khi load gói cước di dộng trả sau');
//     }
//   } catch (e) {
//     if (responseStatus == 'Unauthorized') {
//       throw Exception('Unauthorized');
//     }
//     // print(e);
//     throw Exception('Lỗi khi load gói cước di dộng trả sau');
//   }
// }

// Future<List<TamDungThanhLyPtm>> listTamDungThanhLyPtm(
//     int pageNumber,
//     int pageSize,
//     String maNVTHNS,
//     String subUrlApi,
//     String timeKey,
//     int nhanVienDonVi) async {
//   var responseStatus = '';
//   try {
//     List<TamDungThanhLyPtm> tmp = [];
//     http.Response response;
//     String url =
//         '$subUrlApi${DieuHanhGiamHuy_Route.getlistTamDungThanhLyPtm}?timekey=$timeKey';

//     //?PageNumber=$pageNumber&PageSize=$pageSize&maNVTHNS=$maNVTHNS&timekey=$timeKey&nhanVienDonVi=$nhanVienDonVi';
//     response = await http.post(Uri.parse(url),
//         headers: requestHeader,
//         body: json.encode(<String, dynamic>{
//           "pageNumber": pageNumber,
//           "pageSize": pageSize,
//           "tenDonVi": "",
//           "nhanVienDonVi": nhanVienDonVi.toString(),
//           "maNV": maNVTHNS,
//           "chucDanh": 0
//         }));
//     if (response.statusCode == 200) {
//       DieuHanhGiamHuy_Variable.totalPage =
//           json.decode(response.body)['totalPage'];
//       DieuHanhGiamHuy_Variable.totalRecord =
//           json.decode(response.body)['totalItem'];
//       List jsonResponse = json.decode(response.body)['data'];
//       return jsonResponse
//           .map((data) => TamDungThanhLyPtm.fromJson(data))
//           .toList();
//     } else if (response.reasonPhrase == "Unauthorized") {
//       responseStatus = 'Unauthorized';
//       throw Exception('Unauthorize');
//     } else if (response.body == 'Không tìm thấy thời gian vừa nhập') {
//       DieuHanhGiamHuy_Variable.totalPage = 1;
//       DieuHanhGiamHuy_Variable.totalRecord = 0;
//       return tmp;
//     } else {
//       throw Exception('Lỗi khi load điều hành quản lý');
//     }
//   } catch (e) {
//     if (responseStatus == 'Unauthorized') {
//       throw Exception('Unauthorized');
//     }
//     // print(e);
//     throw Exception('Lỗi khi load  điều hành quản lý');
//   }
// }

Future<List<C3DieuHanhGiamHuy>> getListc2(
    int pageNumber,
    int pageSize,
    String maNVTHNS,
    String subUrlApi,
    String timeKey,
    int nhanVienDonVi,
    int donvi_Pttb,
    var keyword) async {
  var responseStatus = '';
  try {
    List<C3DieuHanhGiamHuy> tmp = [];
    http.Response response;
    String url =
        '$subUrlApi${DieuHanhGiamHuy_Route.getListc2}?timekey=$timeKey&donvi_pttb=$donvi_Pttb&keyword=$keyword';

    //?PageNumber=$pageNumber&PageSize=$pageSize&maNVTHNS=$maNVTHNS&timekey=$timeKey&nhanVienDonVi=$nhanVienDonVi';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSize,
          "tenDonVi": "",
          "nhanVienDonVi": nhanVienDonVi.toString(),
          "maNV": maNVTHNS,
          "chucDanh": localNhanVien.nhanvien_chucdanh
        }));
    if (response.statusCode == 200) {
      DieuHanhGiamHuy_Variable.totalPage =
          json.decode(response.body)['totalPage'];
      DieuHanhGiamHuy_Variable.totalRecord =
          json.decode(response.body)['totalItem'];
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => C3DieuHanhGiamHuy.fromJson(data))
          .toList();
    }else if(response.body == "Không tìm thấy mã NV"){
      throw('loi ma nv');
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else if (response.body == 'Không tìm thấy thời gian vừa nhập') {
      DieuHanhGiamHuy_Variable.totalPage = 1;
      DieuHanhGiamHuy_Variable.totalRecord = 0;
      return tmp;
    } else {
      throw Exception('Lỗi khi load điều hành giảm hủy');
    }
  } catch (e) {
    print(e);
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    if(e=='loi ma nv'){
      throw Exception("Nhân viên không thuộc C3 nào");
    }
    // print(e);
    throw Exception('Lỗi khi load  điều hành giảm hủy');
  }
}

Future<ChiTietDieuHanhGiamHuy> detailDhgh(String? timekey, String subUrlApi,
    int maKVC3, String? nhanvienDonVi) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${DieuHanhGiamHuy_Route.getDetailHGH}?timekey=$timekey&maKVC3=$maKVC3';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": 0,
          "pageSize": 0,
          "tenDonVi": "",
          "nhanVienDonVi": nhanvienDonVi,
          "maNV": "",
          "chucDanh": 0
        }));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['data'];

      if(jsonResponse == null){
        throw Exception("nodata"); 
      }
      return ChiTietDieuHanhGiamHuy.fromJson(jsonResponse);
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load chi tiết điều hành giảm hủy');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    else if(e.toString() == "Exception: nodata"){
      throw Exception("Chưa có dữ liệu tháng $timekey");
    }
    throw Exception('Lỗi khi load chi tiết điều hành giảm hủy');
  }
}
