// ignore_for_file: file_names

import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vnptapp/Models/LongLatPosition.dart';
bool isMapLoading = false;
String currentAddress = "";
bool serviceEnable = false;
late LocationPermission permission;
Future<LongLatPosition> determinePosition() async {
  serviceEnable = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnable) {
    return Future.error("Chưa bật định vị");
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Từ chối định vị");
    }
  }
  if (permission == LocationPermission.deniedForever) {
    Fluttertoast.showToast(msg: "Định vị từ chối vĩnh viễn!");
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  try {
    // //lỗi
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    currentAddress = "${place.locality},${place.street},${place.country}";
    return longLatPosition = LongLatPosition(
        long: position.longitude.toString(),
        lat: position.latitude.toString(),
        diaDiem: currentAddress);
  } catch (e) {
    return longLatPosition;
  }
}

Future<void> openGoogleMap(LongLatPosition position) async {
  String googleUrl =
      'https://www.google.com/maps/search/?api=1&query=${position.lat},${position.long}';
  try {
    await launchUrlString(googleUrl);
  } catch (e) {
    throw Exception(e);
  }
}

//lưu vị trí
// Future<int> updateLongLat(
//     User user, String? long, String? lat, String? diaDiem) async {
//   try {
//     http.Response response = await http.put(
//         Uri.parse('${GoogleMap_Route.updateUserByID}/${user.Id}'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8'
//         },
//         body: jsonEncode(<String, String>{
//           'id': user.Id.toString(),
//           'tenDangNhap': user.TenDangNhap.toString(),
//           'matKhau': user.MatKhau.toString(),
//           'ten': user.Ten.toString(),
//           'long': long.toString(),
//           'lat': lat.toString(),
//           'diaDiem': diaDiem.toString(),
//           'soDienThoai':user.SoDienThoai.toString()
//         })
//         );
//     return response.statusCode;
//   } catch (e) {
//     return -1;
//   }
// }
