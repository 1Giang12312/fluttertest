import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/ThueBaoKhongPSLLC2.dart';
import 'package:vnptapp/Models/ThueBaoKhongPSLLC3.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/ThueBaoKHongPSLL/Route.dart';

Future<List<ThueBaoKhongPSLLC3>> myTVFiberKPSLLC3(String? timekey,
    String subUrlApi, String manv, String nhanvienDonVi) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${ThueBaoKhongPSLLC3_Route.c3MytvFiber}?timekey=$timekey';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": 0,
          "pageSize": 0,
          "tenDonVi": "",
          "nhanVienDonVi": nhanvienDonVi,
          "maNV": manv,
          "chucDanh": 0
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => ThueBaoKhongPSLLC3.fromJson(data))
          .toList();
    } else if (response.body == "Khong tim thay ma nv") {
      throw ('loi ma nv');
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load tổng hợp điều hành giảm  hủy');
    }
  } catch (e) {
    if (e == 'loi ma nv') {
      throw Exception("Nhân viên không thuộc C3 nào");
    }
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
  }
}

// Future<List<ThueBaoKhongPSLLC3>> fiberKPSLLC3(String? timekey, String subUrlApi,
//      String manv,String nhanvienDonVi) async {
//   var responseStatus = '';
//   try {
//     http.Response response;
//     String url =
//         '$subUrlApi${ThueBaoKhongPSLLC3_Route.c3Fiber}?timekey=$timekey';
//     response = await http.post(Uri.parse(url), headers: requestHeader,body: json.encode(<String, dynamic>{
//           "pageNumber": 0,
//           "pageSize": 0,
//           "tenDonVi": "",
//           "nhanVienDonVi": nhanvienDonVi,
//           "maNV": manv,
//           "chucDanh": 0
//         }));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body)['data'];
//       return jsonResponse
//           .map((data) => ThueBaoKhongPSLLC3.fromJson(data))
//           .toList();
//     } else if (response.reasonPhrase == "Unauthorized") {
//       responseStatus = 'Unauthorized';
//       throw Exception('Unauthorize');
//     } else {
//       throw Exception('Lỗi khi load tổng hợp điều hành giảm  hủy');
//     }
//   } catch (e) {
//     if (responseStatus == 'Unauthorized') {
//       throw Exception('Unauthorized');
//     }
//     // print(e);
//     throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
//   }
// }

Future<List<ThueBaoKHongPsllC2>> MyTViberKPSLLC2(String? timekey,
    String subUrlApi, String manv, String nhanvienDonVi) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${ThueBaoKhongPSLLC3_Route.c2MyTVFiber}?timekey=$timekey';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": 0,
          "pageSize": 0,
          "tenDonVi": "",
          "nhanVienDonVi": nhanvienDonVi,
          "maNV": manv,
          "chucDanh": 0
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => ThueBaoKHongPsllC2.fromJson(data))
          .toList();
    } else if (response.body == "Khong tim thay ma nv") {
      throw ('loi ma nv');
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Lỗi khi load tổng hợp điều hành giảm  hủy');
    }
  } catch (e) {
    if (e == 'loi ma nv') {
      throw Exception("Không tìm thấy mã nhân viên");
    }
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
  }
}

// Future<List<ThueBaoKHongPsllC2>> myTVKPSLLC2(String? timekey, String subUrlApi,
//      String manv,String nhanvienDonVi) async {
//   var responseStatus = '';
//   try {
//     http.Response response;
//     String url =
//         '$subUrlApi${ThueBaoKhongPSLLC3_Route.c2MyTV}?timekey=$timekey';
//     response = await http.post(Uri.parse(url), headers: requestHeader,body: json.encode(<String, dynamic>{
//           "pageNumber": 0,
//           "pageSize": 0,
//           "tenDonVi": "",
//           "nhanVienDonVi": nhanvienDonVi,
//           "maNV": manv,
//           "chucDanh": 0
//         }));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body)['data'];
//       return jsonResponse
//           .map((data) => ThueBaoKHongPsllC2.fromJson(data))
//           .toList();
//     } else if (response.reasonPhrase == "Unauthorized") {
//       responseStatus = 'Unauthorized';
//       throw Exception('Unauthorize');
//     } else {
//       throw Exception('Lỗi khi load tổng hợp điều hành giảm  hủy');
//     }
//   } catch (e) {
//     if (responseStatus == 'Unauthorized') {
//       throw Exception('Unauthorized');
//     }
//     // print(e);
//     throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
//   }
// }

Future<List<ThueBaoKhongPSLLC3>> fiberKPSLLUserView(
    String? timekey,
    String subUrlApi,
    String manv,
    String nhanvienDonVi,
    String donvi_pttb,
    int chucDanh) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${ThueBaoKhongPSLLC3_Route.fiberUserView}?donvi_pttb=$donvi_pttb&timeKey=$timekey';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": 0,
          "pageSize": 0,
          "tenDonVi": "",
          "nhanVienDonVi": nhanvienDonVi,
          "maNV": manv,
          "chucDanh": chucDanh
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => ThueBaoKhongPSLLC3.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw ('Unauthorize');
    } else if (response.body == 'Khong tim thay ma nv') {
      throw ('Khong tim thay ma nv');
    } else {
      throw Exception('Lỗi khi load tổng hợp điều hành giảm  hủy');
    }
  } catch (e) {
    print(e);
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    if (e == 'Khong tim thay ma nv') {
      throw Exception('NV không thuộc C3 nào');
    }
    // print(e);
    throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
  }
}

Future<List<ThueBaoKhongPSLLC3>> myTVKPSLLUserView(
    String? timekey,
    String subUrlApi,
    String manv,
    String nhanvienDonVi,
    String donvi_pttb,
    int chucDanh) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url =
        '$subUrlApi${ThueBaoKhongPSLLC3_Route.MyTVUserView}?donvi_pttb=$donvi_pttb&timeKey=$timekey';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": 0,
          "pageSize": 0,
          "tenDonVi": "",
          "nhanVienDonVi": nhanvienDonVi,
          "maNV": manv,
          "chucDanh": chucDanh
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse
          .map((data) => ThueBaoKhongPSLLC3.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw ('Unauthorize');
    } else if (response.body == 'Khong tim thay ma nv') {
      throw Exception('Khong tim thay ma nv');
    } else {
      throw Exception('Lỗi khi load tổng hợp điều hành giảm  hủy');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    if (e == 'Khong tim thay ma nv') {
      throw Exception('NV không thuộc C3 nào');
    }
    // print(e);
    throw Exception('Lỗi khi load tổng hợp điều hành giảm hủy');
  }
}
