import 'package:http/http.dart' as http;

// ignore_for_file: file_names
// import 'package:http/http.dart' as http;
// // import 'package:vnptapp/Models/NhanVien.dart';
// // import 'package:vnptapp/Models/User.dart';
// // import 'package:vnptapp/screen/Drawer/Drawer_Route.dart';
// // Future<int> logout() async {
// //   try {
// //     http.Response response = await http.get(
// //         // Uri.parse('https://reqres.in/api/login'),
// //         //Uri.parse('https://10.0.2.2:7205/api/AppUsers/login/'),
// //         Uri.parse(Drawer.logout),
// //         headers: <String, String>{
// //           'Content-Type': 'application/json; charset=UTF-8'
// //         });
// //     if (response.statusCode == 200) {
// //       localNhanVien = NhanVien();
// //       return response.statusCode;
// //     } else {
// //       return response.statusCode;
// //     }
// //   } catch (e) {
// //     return -1;
// //   }
// // }

// //viết ở đây
// //hàm check connection
//update lại id thiết bị
import 'package:vnptapp/Variable/Constant.dart';

Future<String> updateIdThietBiNull(int nhanvienId, String subUrlApi) async {
  String url =
      '${subUrlApi}token/updateNullIdThietBi?nhanvien_id=$nhanvienId';
  try {
    http.Response response;
    response = await http.put(Uri.parse(url), headers: requestHeader);
    if(response.statusCode == 200){
      return response.body;
    }else{
      return response.body;
    }
  } catch (e) {
    throw Exception("Lỗi khi đăng xuất");
  }
}
