// // ignore_for_file: file_names

// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/SubModel/subModel_DemDangNhap.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/ODPScreen/ODPScreen_Route.dart';
import 'package:vnptapp/screen/login/LoginScreen_Logic.dart';
import 'package:vnptapp/screen/login/LoginScreen_Route.dart';
// Future sendAndSaveOTP(String phoneNumber) async {
//   String substring = phoneNumber.substring(1);
//   try {
//     // ignore: unused_local_variable
//     http.Response response = await http.post(
//         Uri.parse('${OTPScreen_Route.sendAndSaveOTP}?phoneNumber=%2B$substring'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8'
//         },
//         );
//   } catch (e) {
//     throw Exception(e);
//   }
// }
// // ignore: non_constant_identifier_names
// Future<int> AuthOTP(String phoneNumber,String otpCode) async {
//   try {
//     http.Response response = await http.post(
//         Uri.parse(OTPScreen_Route.authOTP),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8'
//         },
//         body: jsonEncode(<String, String>{
//           'otpCode': otpCode,
//           'phoneNumber':  phoneNumber
//         }));
//    return response.statusCode;
//   } catch (e) {
//     return -1;
//   }
// }

//login nếu không thành công thì cho nhập odp

Future<String> loginODPAuto(String subUrlApi) async {
  try {
    // print(ApiEndPoint.baseUrl );
    var odp = shared_preferences.getString('odp');
    if (shared_preferences.getString('odp') == null) {
      odp = '';
    }
    String url = subUrlApi + ODPScreen_Route.loginWithODP;
    http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'tenDangNhap': shared_preferences.getString('taikhoan'),
          'matKhau': shared_preferences.getString('matkhau') + odp
        }));
    if (json.decode(response.body)['message'] == 'Success') {
      jwt = json.decode(response.body)['token'];
      //set jwt
      shared_preferences.setString('jwt', jwt);
      //set odp
      //shared_preferences.setString('odp', json.decode(response.body)['odp']);
      //print(prefs.getString('odp'));
      jwtToNhanVien();
      //print(tenDonVi);
    }
    return json.decode(response.body)['message'];
  } catch (e) {
    throw Exception('Lỗi khi đăng nhập vui lòng thử lại');
  }
}

Future<String> loginODP(String odp) async {
  try {
    // print(ApiEndPoint.baseUrl );
    String subUrlApi = await checkLocalConnectionApi();

    String url = subUrlApi + ODPScreen_Route.loginWithODP;
    http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'tenDangNhap': shared_preferences.getString('taikhoan'),
          'matKhau': shared_preferences.getString('matkhau') + odp
        }));
    if (json.decode(response.body)['message'] == 'Success') {
      jwt = json.decode(response.body)['token'];
      //set jwt
      shared_preferences.setString('jwt', jwt);
      //set odp
      //shared_preferences.setString('odp', json.decode(response.body)['odp']);
      //print(prefs.getString('odp'));
      jwtToNhanVien();
      //print(tenDonVi);
    }
    return json.decode(response.body)['message'];
  } catch (e) {
    throw Exception('Lỗi khi đăng nhập vui lòng thử lại');
  }
}
Future<String> loginCounter(int nhanvienId, String subUrlApi) async {
  try {
    String url =
        '$subUrlApi${ODPScreen_Route.loginCounter}?nhanvienId=$nhanvienId';
    http.Response response = await http.put(Uri.parse(url),
        headers: requestHeader);
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      return 'Fail';
    }
  } catch (e) {
    return 'Fail';
  }
}

Future<String> getODPWithTaiKhoanNV(
    String taiKhoanNhanVien, String subUrlApi) async {
  try {
    String url =
        '$subUrlApi${ODPScreen_Route.getODP}?taiKhoanNhanVien=$taiKhoanNhanVien';
    http.Response response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    return response.body;
  } catch (e) {
    return e.toString();
  }
}
Future<String> loginKiemTraInfor(
    int nhanvienId, subModel_DemDangNhap subddn, String subUrlApi) async {
  try {
    String url =
        '$subUrlApi${LoginScreen_Route.kiemTraIdThietBiVaPhienBan}?nhanvien_id=$nhanvienId';
    http.Response response = await http.put(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "idThietBi": subddn.idThietBi,
          "appPhienBan": subddn.appPhienBan,
          "tenThietBi": subddn.tenThietBi,
          "tenHangThietBi": subddn.tenHangThietBi,
          "heDieuHanh": subddn.heDieuHanh,
          "phienBanHeDieuHanh": subddn.phienBanHeDieuHanh
        }));
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      return response.body;
    }
  } catch (e) {
    return 'Fail';
  }
}
