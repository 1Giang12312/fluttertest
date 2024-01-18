import 'package:http/http.dart' as http;
import 'package:vnptapp/Variable/Constant.dart';

// ignore_for_file: file_names
// // ignore_for_file: file_names

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:vnptapp/Models/User.dart';
// import 'package:vnptapp/screen/Drawer/profile/ProfileScreen_Route.dart';

// // Future<User> getUIByID(String id) async {
// //   try {
// //     http.Response response = await http.get(
// //         // Uri.parse('https://reqres.in/api/login'),
// //         //Uri.parse('https://10.0.2.2:7205/api/AppUsers/login/'),
// //         Uri.parse(ProfileScreen_Route.getUserByID + id),
// //         headers: <String, String>{
// //           'Content-Type': 'application/json; charset=UTF-8'
// //         });
// //     Map<String, dynamic> userMap = json.decode(response.body.toString());
// //    return localUser = User(
// //       Id: userMap['id'],
// //       TenDangNhap: userMap['tenDangNhap'],
// //       MatKhau: userMap['matKhau'],
// //       Ten: userMap['ten'],
// //       Long: userMap['long'],
// //       Lat: userMap['lat'],
// //       DiaDiem: userMap['diaDiem'],
// //     );
// //   } catch (e) {
// //     return User();
// //   }
// // }
Future<String> updateIdThietBiNull(int nhanvienId, String subUrlApi) async {
  String url =
      '${subUrlApi}token/updateNullIdThietBi?nhanvien_id=$nhanvienId';
  try {
    http.Response response;
    response = await http.put(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  } catch (e) {
    throw Exception("Lỗi khi đăng xuất vui lòng kiểm tra lại mạng hoặc thông báo với phòng DHNV");
  }
}
