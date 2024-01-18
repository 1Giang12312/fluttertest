// ignore_for_file: file_names

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:vnptapp/Models/AutoHoTroNghiepVu.dart';
import 'package:http/http.dart' as http;
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/AutoHoTroNghiepVu/Route.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/AutoHoTroNghiepVu/Variable.dart';

Future<List<AutoHoTroNghiepVu>> listHoTroNghiepVu(var pageNumber, var pageSize,
    String maNV, String keyWord, String subUrlApi, int nhanVienDonViID) async {
  var responseStatus = '';
  try {
    http.Response response;
    String url = "$subUrlApi${HoTroNghiepVu_Route.auToHoTroNghiepVu}?keyword=$keyWord";
    // url =
    //     '$url?PageNumber=$pageNumber&PageSize=$pageSize&maNV=$maNV&keyword=$keyWord&nhanVienDonVi=$nhanVienDonViID';
    response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSize,
          "tenDonVi": "",
          "nhanVienDonVi": nhanVienDonViID.toString(),
          "maNV": maNV,
          "chucDanh": 0
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      AutoHoTroNghiepVu_Variable.totalPages =
          json.decode(response.body)['totalPage'];
      AutoHoTroNghiepVu_Variable.totalRecords =
          json.decode(response.body)['totalItem'];
      return jsonResponse
          .map((data) => AutoHoTroNghiepVu.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Không thể load auto hỗ trợ nghiệp vụ');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    //print(e);
    throw Exception('Không thể load auto hỗ trợ nghiệp vụ');
  }
}

//add hỗ trợ nghiệp vụ
Future<int> addHoTroNghiepVu(
    String sdt, String loaiYC, String nhanVienYeuCau, String subUrlApi) async {
  String url = subUrlApi + HoTroNghiepVu_Route.auToHoTroNghiepVu;
  String hethong;
  if (loaiYC == 'RESET-ELOAD' || loaiYC == 'THAYDOI-SERI-ELOAD') {
    hethong = 'QLCTV';
  } else if (loaiYC == 'TUCHOI-PHEDUYET' || loaiYC == 'DONGY-PHEDUYET') {
    hethong = 'DKTT';
  } else {
    hethong = 'CCOS';
  }
  final dateTime = DateTime.now(); // Thay bằng giá trị DateTime của bạn
  final thoiGianYeuCau = DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateTime);
  // ignore: unused_local_variable
  AutoHoTroNghiepVu autoHoTroNghiepVu = AutoHoTroNghiepVu(
    id: null,
    sdt: sdt,
    loaiYc: loaiYC,
    hethong: hethong,
    nhanvienYeucau: nhanVienYeuCau,
    thoigianYeucau: DateTime.parse(thoiGianYeuCau),
    trangthai: 0,
    trangthaiDahuongluong: 0,
    thoigianXuly: DateTime.parse(thoiGianYeuCau),
    tenTb: null,
    ketquaXuly: null,
    seri: null,
    loaiTb: null,
    loaiSim: null,
    ngayKh: null,
    ngaySinh: null,
    soGt: null,
    ngayCap: null,
    soDu: null,
    hanSuDung: null,
    goiDi: null,
    goiDen: null,
    goiCuocKmcbDeXuat: null,
    ngayChuyenTsSangTt: null,
    tieuDungBinhQuan2Thang: null,
    goiCuocDangSuDung: null,
    ngayHetHanGoiCuoc: null,
    packageName: null,
    parameterBuffer1: null,
    longNumCycle: null,
    currentUsingCycle: null,
    loaiChuKy: null,
    dangKyLanDau: null,
    thoiGianHetHanCk: null,
    goiCuocDk: null,
  );
  try {
    http.Response response = await http.post(Uri.parse('$url/them'),
        headers: requestHeader,
        body: jsonEncode(<String, dynamic>{
          "id": 0,
          "sdt": sdt,
          "loaiYc": loaiYC,
          "hethong": hethong,
          "nhanvienYeucau": nhanVienYeuCau.toString(),
          "thoigianYeucau": thoiGianYeuCau.toString(),
          "trangthai": 0,
          "trangthaiDahuongluong": 0,
          "ketquaXuly": "",
          "thoigianXuly": thoiGianYeuCau,
          "seri": "",
          "loaiTb": "",
          "loaiSim": "",
          "tenTb": "",
          "ngayKh": "",
          "ngaySinh": "",
          "soGt": "",
          "ngayCap": "",
          "soDu": "",
          "hanSuDung": "",
          "goiDi": "",
          "goiDen": "",
          "goiCuocKmcbDeXuat": "",
          "ngayChuyenTsSangTt": "",
          "tieuDungBinhQuan2Thang": 0,
          "goiCuocDangSuDung": "",
          "ngayHetHanGoiCuoc": "",
          "parameterBuffer1": "",
          "packageName": "",
          "longNumCycle": 0,
          "currentUsingCycle": 0,
          "loaiChuKy": "",
          "dangKyLanDau": "",
          "thoiGianHetHanCk": "",
          "goiCuocDk": ""
        }));

    return response.statusCode;
  } catch (e) {
    //print(e);
    throw Exception('Không thể load auto hỗ trợ nghiệp vụ');
  }
}

//lấy theo id
Future<AutoHoTroNghiepVu> getHoTroNghiepVuByID(int id, String subUrlApi) async {
  String url = subUrlApi + HoTroNghiepVu_Route.auToHoTroNghiepVu;
  try {
    http.Response response =
        await http.get(Uri.parse('$url/$id'), headers: requestHeader);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var result = AutoHoTroNghiepVu.fromJson(jsonResponse);
      return result;
    } else {
      throw Exception('Load kết quả xử lý thất bại vui lòng thử lại...');
    }
  } catch (e) {
    // print(e);
    throw Exception('Load kết quả xử lý thất bại vui lòng thử lại...');
  }
}
