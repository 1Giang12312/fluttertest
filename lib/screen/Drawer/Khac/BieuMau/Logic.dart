// // ignore_for_file: file_names

// import 'dart:convert';

// import 'package:vnptapp/Models/Test.dart';
// import 'package:http/http.dart' as http;
// import 'package:vnptapp/screen/Drawer/Khac/BieuMau/Variable.dart';
// Future<List<Test>> test123() async {
//   try {
//     http.Response response = await http.get(
//         Uri.parse(
//             'https://api.publicapis.org/entries'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//         });
//     if (response.statusCode == 200) {
//      List jsonResponse = json.decode(response.body)['entries'];
//      BieuMau_Variable.count=json.decode(response.body)['count'];
//       return jsonResponse.map((data) => Test.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to loa dữ liệu');
//     }
//   } catch (e) {
//     //print(e);
//     throw Exception('Failed to load dữ liệu');
//   }
// }
