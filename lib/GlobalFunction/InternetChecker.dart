// ignore_for_file: file_names

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/utils/api_endpoint.dart';

// Future<bool> checkServerConnection() async {
//   try {
//     final response = await http.get(Uri.parse(ApiEndPoint.connectionTest),
//         headers: requestHeader);
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   } catch (error) {
//     print(error);
//     return false;
//   }
// }

// ignore: non_constant_identifier_names
Future<bool> InternetChecker() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

//swap URL for PDF viewer
Future<String> checkLocalConnection() async {
  try {
    http.Response response = await http
        .get(Uri.parse(ApiEndPoint.TestConnection), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    }).timeout(const Duration(seconds: 3));
    if (response.statusCode == 200 && response.body == 'Connection is fine') {
      //    print('check connection for PDF URL : https://www.vnptangiang.vn');
      return 'https://www.vnptangiang.vn';
    } else {
      //   print('check connection for PDF URL : http://www.vnptangiang.vn');
      return 'http://www.vnptangiang.vn';
    }
  } catch (e) {
    // print('check connection for PDF URL : http://www.vnptangiang.vn');
    //  print(e);
    return 'http://www.vnptangiang.vn';
  }
}

// Future<String> checkLocalConnectionApi() async {
//   try {
//     http.Response response = await http.get(
//         Uri.parse('http://www.vnptangiang.vn/api/api/NhomKpis/1'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8'
//         }).timeout(const Duration(seconds: 5));
//     if (response.statusCode == 200) {
//       ApiEndPoint.baseUrl = ApiEndPoint.httpUrl;
//       print(ApiEndPoint.baseUrl);
//       return 'http';
//     } else {
//       ApiEndPoint.baseUrl = ApiEndPoint.httpsUrl;
//       print(ApiEndPoint.baseUrl);
//       return 'https';
//     }
//   } catch (e) {
//     print(e);
//     ApiEndPoint.baseUrl = ApiEndPoint.httpsUrl;
//     print(ApiEndPoint.baseUrl);
//     return 'https';
//   }
// }
Future<String> checkLocalConnectionApi() async {
  try {
    http.Response response = await http
        .get(Uri.parse(ApiEndPoint.TestConnection), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    }).timeout(const Duration(seconds: 2));
    if (response.statusCode == 200 && response.body == 'Connection is fine') {
      //   print(ApiEndPoint.httpsUrl);
      return ApiEndPoint.httpsUrl;
    } else {
      //  print(ApiEndPoint.httpUrl);
      return ApiEndPoint.httpUrl;
    }
  } catch (e) {
    // print(e);
    //  print(ApiEndPoint.httpUrl);
    return ApiEndPoint.httpUrl;
  }
}

Future<bool> checkAuthorized(String subUrlApi) async {
  var responseStatus = '';
  try {
    http.Response response = await http.get(
        Uri.parse(subUrlApi + ApiEndPoint.checkAuthorized),
        headers: requestHeader);
    if (response.statusCode == 200 && response.body == 'Authorized') {
      //   print(ApiEndPoint.httpsUrl);
      return true;
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = "Unauthorized";
      return false;
    } else {
      //  print(ApiEndPoint.httpUrl);
      return false;
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      return false;
    }
    return false;
  }
}

Future<String> checkWeburl() async {
  try {
    http.Response response = await http
        .get(Uri.parse(ApiEndPoint.TestConnection), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    }).timeout(const Duration(seconds: 2));
    if (response.statusCode == 200 && response.body == 'Connection is fine') {
      return 'https://www.vnptangiang.vn/';
    } else {
      return 'http://www.vnptangiang.vn/';
    }
  } catch (e) {
    return 'http://www.vnptangiang.vn/';
  }
}
