// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:vnptapp/GlobalFunction/SaveExcelFile.dart';
import 'package:vnptapp/Models/HeSoQuyDoiBrcd.dart';
import 'package:vnptapp/Models/HeSoQuyDoiDdts.dart';
import 'package:vnptapp/Models/HeSoQuyDoiDdtt.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/ChiTietSanLuongVT_CNTT/Route.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/ChiTietSanLuongVT_CNTT/Variable.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;
Future<List<HeSoQuyDoiBrcd>> listBrcd(
    int pageNumber,
    int pageSize,
    String month,
    String year,
    String MaNV_THNS,
    var donViID,
    int nhanVienDonvi,
    int chucDanh,
    String subUrlApi) async {
  var responseStatus = '';
  String url =
      '$subUrlApi${ChiTietSanLuongVT_CNTT_Route.getListBrcd}?thang=$month&nam=$year';
  try {
    // url =
    //     '$url?PageNumber=$pageNumber&PageSize=$pageSize&donViID=$donViID&nhanVienDonVi=$nhanVienDonvi&MaNV_THNS=$MaNV_THNS&chucDanh=$chucDanh&thang=$month&nam=$year';
    http.Response response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSize,
          "tenDonVi": donViID,
          "nhanVienDonVi": nhanVienDonvi.toString(),
          "maNV": MaNV_THNS,
          "chucDanh": 0
        }));
    // http.Response response = await checkLocalConnectionApi().then((value) => http.get(Uri.parse(value + url),headers: requestHeader ));
    if (response.statusCode == 200) {
      // if (donViID != "null" || nhanVienDonvi != 13) {
      try {
        List jsonResponse1 = json.decode(response.body)['data'];
        // List<HeSoQuyDoiBrcd> jsonResponse = [];
        // for (var item in jsonResponse1) {
        //   HeSoQuyDoiBrcd heSoQuyDoi =
        //       HeSoQuyDoiBrcd.fromJson(item['hesoQuydoiBrcd']);
        //   jsonResponse.add(heSoQuyDoi);
        // }
        ChiTietSanLuongVT_CNTT_Variable.totalPageBrcd =
            json.decode(response.body)['totalPage'];
        ChiTietSanLuongVT_CNTT_Variable.totalItemBrcd =
            json.decode(response.body)['totalItem'];
        return jsonResponse1
            .map((data) => HeSoQuyDoiBrcd.fromJson(data['hesoQuydoiBrcd']))
            .toList();
      } catch (e) {
        //print(e);
        List jsonResponse = json.decode(response.body)['data'];
        ChiTietSanLuongVT_CNTT_Variable.totalPageBrcd =
            json.decode(response.body)['totalPage'];
        ChiTietSanLuongVT_CNTT_Variable.totalItemBrcd =
            json.decode(response.body)['totalItem'];
        return jsonResponse
            .map((data) => HeSoQuyDoiBrcd.fromJson(data))
            .toList();
      }
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Không thể load hệ số quy đổi băng rộng cố định');
    }
  } catch (e) {
    //print(e);
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    throw Exception('Không thể load hệ số quy đổi băng rộng cố định');
  }
}
Future<List<HeSoQuyDoiDdtt>> listDdtt(
    int pageNumber,
    int pageSize,
    String month,
    String year,
    String MaNV,
    String nhanVienDonVi,
    var selectedValue,
    String chucDanh,
    String subUrlApi) async {
  var responseStatus = '';
  String url =
      '$subUrlApi${ChiTietSanLuongVT_CNTT_Route.getListDdtt}?thang=$month&nam=$year';
  try {
    // url =
    //     '$url?PageNumber=$pageNumber&PageSize=$pageSize&tenDonVi=$selectedValue&nhanVienDonVi=$nhanVienDonVi&maNV=$MaNV&chucDanh=$chucDanh&thang=$month&nam=$year';
    http.Response response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSize,
          "tenDonVi": selectedValue,
          "nhanVienDonVi": nhanVienDonVi.toString(),
          "maNV": MaNV,
          "chucDanh": chucDanh
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      ChiTietSanLuongVT_CNTT_Variable.totalPageDdtt =
          json.decode(response.body)['totalPage'];
      ChiTietSanLuongVT_CNTT_Variable.totalItemDdtt =
          json.decode(response.body)['totalItem'];
      return jsonResponse.map((data) => HeSoQuyDoiDdtt.fromJson(data)).toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Không thể load hệ số quy đổi di động trả trước');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Không thể load hệ số quy đổi di động trả trước');
  }
}
Future<List<HeSoQuyDoiDdts>> listDdts(
    int pageNumber,
    int pageSize,
    String month,
    String year,
    String MaNV_THNS,
    String nhanVienDonVi,
    var selectedValue,
    String chucDanh,
    String subUrlApi) async {
  var responseStatus = '';
  String url =
      '$subUrlApi${ChiTietSanLuongVT_CNTT_Route.getListDdts}?thang=$month&nam=$year';
  try {
    http.Response response = await http.post(Uri.parse(url),
        headers: requestHeader,
        body: json.encode(<String, dynamic>{
          "pageNumber": pageNumber,
          "pageSize": pageSize,
          "tenDonVi": selectedValue,
          "nhanVienDonVi": nhanVienDonVi.toString(),
          "maNV": MaNV_THNS,
          "chucDanh": chucDanh
        }));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      ChiTietSanLuongVT_CNTT_Variable.totalPageDdts =
          json.decode(response.body)['totalPage'];
      ChiTietSanLuongVT_CNTT_Variable.totalItemDdts =
          json.decode(response.body)['totalItem'];
      return jsonResponse.map((data) => HeSoQuyDoiDdts.fromJson(data)).toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Không thể load hệ số quy đổi di động trả sau');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Không thể load hệ số quy đổi di động trả sau');
  }
}
Future<List<HeSoQuyDoiDdtt>> listDdttExcel(
    String month,
    String year,
    String MaNV,
    String nhanVienDonVi,
    var selectedValue,
    String chucDanh,
    String subUrlApi,
    int soLuong) async {
  var responseStatus = '';
  String url = subUrlApi + ChiTietSanLuongVT_CNTT_Route.getListDdttExcel;
  try {
    url =
        '$url?tenDonVi=$selectedValue&nhanVienDonVi=$nhanVienDonVi&maNV=$MaNV&chucDanh=$chucDanh&thang=$month&nam=$year&totalItem=$soLuong';
    http.Response response =
        await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      // ChiTietSanLuongVT_CNTT_Variable.totalPageDdtt =
      //     json.decode(response.body)['totalPages'];
      // ChiTietSanLuongVT_CNTT_Variable.totalItemDdtt =
      //     json.decode(response.body)['totalRecords'];
      (jsonResponse.length);
      return jsonResponse.map((data) => HeSoQuyDoiDdtt.fromJson(data)).toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception(
          'Không thể load hệ số quy đổi di động trả trước khi xuất file Excel');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception(
        'Không thể load hệ số quy đổi di động trả trước khi xuất file Excel');
  }
}

Future<List<HeSoQuyDoiDdts>> listDdtsExcel(
    String month,
    String year,
    String MaNV_THNS,
    String nhanVienDonVi,
    var selectedValue,
    String chucDanh,
    String subUrlApi,
    int soLuong) async {
  var responseStatus = '';
  String url = subUrlApi + ChiTietSanLuongVT_CNTT_Route.getListDdtsExcel;
  try {
    url =
        '$url?tenDonVi=$selectedValue&nhanVienDonVi=$nhanVienDonVi&MaNV_THNS=$MaNV_THNS&chucDanh=$chucDanh&thang=$month&nam=$year&totalItem=$soLuong';
    http.Response response =
        await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      // ChiTietSanLuongVT_CNTT_Variable.totalPageDdtt =
      //     json.decode(response.body)['totalPages'];
      // ChiTietSanLuongVT_CNTT_Variable.totalItemDdtt =
      //     json.decode(response.body)['totalRecords'];
      return jsonResponse.map((data) => HeSoQuyDoiDdts.fromJson(data)).toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception(
          'Không thể load hệ số quy đổi di động trả sau khi xuất file Excel');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception(
        'Không thể load hệ số quy đổi di động trả sau khi xuất file Excel');
  }
}

Future<List<HeSoQuyDoiBrcd>> listBrcdExcel(
    String month,
    String year,
    String MaNV_THNS,
    var donViID,
    int nhanVienDonvi,
    int chucDanh,
    String subUrlApi,
    int totalItem) async {
  var responseStatus = '';
  String url = subUrlApi + ChiTietSanLuongVT_CNTT_Route.getListBrcdExcel;
  try {
    url =
        '$url?donViID=$donViID&nhanVienDonVi=$nhanVienDonvi&MaNV_THNS=$MaNV_THNS&chucDanh=$chucDanh&thang=$month&nam=$year&totalItem=$totalItem';
    http.Response response =
        await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      try {
        List jsonResponse1 = json.decode(response.body)['data'];
        List<HeSoQuyDoiBrcd> jsonResponse = [];
        for (var item in jsonResponse1) {
          HeSoQuyDoiBrcd heSoQuyDoi =
              HeSoQuyDoiBrcd.fromJson(item['hesoQuydoiBrcd']);
          jsonResponse.add(heSoQuyDoi);
        }
        return jsonResponse;
      } catch (e) {
        List jsonResponse = json.decode(response.body)['data'];
        return jsonResponse
            .map((data) => HeSoQuyDoiBrcd.fromJson(data))
            .toList();
      }
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = 'Unauthorized';
      throw Exception('Unauthorize');
    } else {
      throw Exception('Không thể load hệ số quy đổi băng rộng cố định');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Không thể load hệ số quy đổi băng rộng cố định');
  }
}

class FileStorage {
  static Future<String> createExcelDdtt(List<HeSoQuyDoiDdtt> list) async {
    DateTime now = DateTime.now();
    String formattedString = DateFormat("HH_mm_ss_yyyy_MM_dd").format(now);
    final xcel.Workbook workbook = xcel.Workbook();
    final xcel.Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByIndex(1, 1).setText("timekey");
    sheet.getRangeByIndex(1, 2).setText("nhanvien_smcs");
    sheet.getRangeByIndex(1, 3).setText("donvi");
    sheet.getRangeByIndex(1, 4).setText("nhanvien_hoten");
    sheet.getRangeByIndex(1, 5).setText("sodt");
    sheet.getRangeByIndex(1, 6).setText("tengoi");
    sheet.getRangeByIndex(1, 7).setText("tiengoi");
    sheet.getRangeByIndex(1, 8).setText("thoigian_dkgoi");
    sheet.getRangeByIndex(1, 9).setText("heso_quydoi");
    for (var i = 0; i < list.length; i++) {
      final item = list[i];
      sheet.getRangeByIndex(i + 2, 1).setText(item.timekey!.toString());
      sheet.getRangeByIndex(i + 2, 2).setText(item.nhanvienSmcs!.toString());
      sheet.getRangeByIndex(i + 2, 3).setText(item.donvi!.toString());
      sheet.getRangeByIndex(i + 2, 4).setText(item.nhanvienHoten.toString());
      sheet.getRangeByIndex(i + 2, 5).setText(item.sodt.toString());
      sheet.getRangeByIndex(i + 2, 6).setText(item.tengoi.toString());
      sheet.getRangeByIndex(i + 2, 7).setText(item.tiengoi.toString());
      sheet.getRangeByIndex(i + 2, 8).setText(item.thoigianDkgoi.toString());
      sheet.getRangeByIndex(i + 2, 9).setText(item.hesoQuydoi.toString());
      //ref.read(selectedIdDonVi.notifier).state = i;
      //print(i);
    }
    final List<int> bytes = workbook.saveAsStream();
    String fileName = "chitietsanluong_ddtt_$formattedString.xlsx";
    File file = await WriteFileMethod.writeCounter(bytes, fileName);
    //String path = await WriteFileMethod.getPath();
    //OpenFile.open("$path/$fileName");
    bool temp = file.existsSync();
    workbook.dispose();
    if (temp == true) {
      return "Lưu thành công, vui lòng kiểm tra mục Download với tên file là: $fileName";
    } else {
      return "Lưu file thất bại, vui lòng thông báo đến nhà phát triển";
    }
  }

  static Future<String> createExcelDdts(List<HeSoQuyDoiDdts> list) async {
    DateTime now = DateTime.now();
    String formattedString = DateFormat("HH_mm_ss_yyyy_MM_dd").format(now);
    final xcel.Workbook workbook = xcel.Workbook();
    final xcel.Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByIndex(1, 1).setText("timekey");
    sheet.getRangeByIndex(1, 2).setText("loai_TB");
    sheet.getRangeByIndex(1, 3).setText("THTB_ID");
    sheet.getRangeByIndex(1, 4).setText("MA_TB");
    sheet.getRangeByIndex(1, 5).setText("TEN_TB");
    sheet.getRangeByIndex(1, 6).setText("MA_NV");
    sheet.getRangeByIndex(1, 7).setText("TEN_NV");
    sheet.getRangeByIndex(1, 8).setText("NGAY_SD");
    sheet.getRangeByIndex(1, 9).setText("GOCUOC");
    sheet.getRangeByIndex(1, 10).setText("GIACUOC");
    sheet.getRangeByIndex(1, 11).setText("NGUOI_CN");
    sheet.getRangeByIndex(1, 12).setText("TEN_DV");
    sheet.getRangeByIndex(1, 13).setText("heso_quydoi");
    for (var i = 0; i < list.length; i++) {
      final item = list[i];
      sheet.getRangeByIndex(i + 2, 1).setText(item.timeKey!.toString());
      sheet.getRangeByIndex(i + 2, 2).setText(item.loaiTb.toString());
      sheet.getRangeByIndex(i + 2, 3).setText(item.thtbId.toString());
      sheet.getRangeByIndex(i + 2, 4).setText(item.maTb.toString());
      sheet.getRangeByIndex(i + 2, 5).setText(item.tenTb.toString());
      sheet.getRangeByIndex(i + 2, 6).setText(item.maNv.toString());
      sheet.getRangeByIndex(i + 2, 7).setText(item.tenNv.toString());
      sheet.getRangeByIndex(i + 2, 8).setText(item.ngaySd.toString());
      sheet.getRangeByIndex(i + 2, 9).setText(item.goicuoc.toString());
      sheet.getRangeByIndex(i + 2, 10).setText(item.giacuoc.toString());
      sheet.getRangeByIndex(i + 2, 11).setText(item.nguoiCn.toString());
      sheet.getRangeByIndex(i + 2, 12).setText(item.tenDv.toString());
      sheet.getRangeByIndex(i + 2, 13).setText(item.hesoQuydoi.toString());

      //ref.read(selectedIdDonVi.notifier).state = i;
      //print(i);
    }
    final List<int> bytes = workbook.saveAsStream();
    String fileName = "chitietsanluong_ddts_$formattedString.xlsx";
    File file = await WriteFileMethod.writeCounter(bytes, fileName);
    //String path = await WriteFileMethod.getPath();
    //OpenFile.open("$path/$fileName");
    bool temp = file.existsSync();
    workbook.dispose();
    if (temp == true) {
      return "Lưu thành công, vui lòng kiểm tra mục Download với tên file là: $fileName";
    } else {
      return "Lưu file thất bại, vui lòng thông báo đến nhà phát triển";
    }
  }

  static Future<String> createExcelBrcd(List<HeSoQuyDoiBrcd> list) async {
    DateTime now = DateTime.now();
    String formattedString = DateFormat("HH_mm_ss_yyyy_MM_dd").format(now);
    final xcel.Workbook workbook = xcel.Workbook();
    final xcel.Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByIndex(1, 1).setText("TimeKey");
    sheet.getRangeByIndex(1, 2).setText("LOAIHINH_TB");
    sheet.getRangeByIndex(1, 3).setText("LOAITB_ID");
    sheet.getRangeByIndex(1, 4).setText("MA_TB");
    sheet.getRangeByIndex(1, 5).setText("TEN_TB");
    sheet.getRangeByIndex(1, 6).setText("MA_NV");
    sheet.getRangeByIndex(1, 7).setText("TEN_NV");
    sheet.getRangeByIndex(1, 8).setText("NGAYHT");
    sheet.getRangeByIndex(1, 9).setText("CHUYENMANG");
    sheet.getRangeByIndex(1, 10).setText("NGUOI_CN");
    sheet.getRangeByIndex(1, 11).setText("TEN_DV");
    sheet.getRangeByIndex(1, 12).setText("CUOC_TG");
    sheet.getRangeByIndex(1, 13).setText("LOAI");
    sheet.getRangeByIndex(1, 14).setText("heso_quydoi");

    for (var i = 0; i < list.length; i++) {
      final item = list[i];
      sheet.getRangeByIndex(i + 2, 1).setText(item.timekey!.toString());
      sheet.getRangeByIndex(i + 2, 2).setText(item.loaihinhTb.toString());
      sheet.getRangeByIndex(i + 2, 3).setText(item.loaitbId.toString());
      sheet.getRangeByIndex(i + 2, 4).setText(item.maTb.toString());
      sheet.getRangeByIndex(i + 2, 5).setText(item.tenTb.toString());
      sheet.getRangeByIndex(i + 2, 6).setText(item.maNv.toString());
      sheet.getRangeByIndex(i + 2, 7).setText(item.tenNv.toString());
      sheet.getRangeByIndex(i + 2, 8).setText(item.ngayHt.toString());
      sheet.getRangeByIndex(i + 2, 9).setText(item.chuyenmang.toString());
      sheet.getRangeByIndex(i + 2, 10).setText(item.nguoiCn.toString());
      sheet.getRangeByIndex(i + 2, 11).setText(item.tenDv.toString());
      sheet.getRangeByIndex(i + 2, 12).setText(item.cuocTg.toString());
      sheet.getRangeByIndex(i + 2, 13).setText(item.loai.toString());
      sheet.getRangeByIndex(i + 2, 14).setText(item.hesoQuydoi.toString());
      //ref.read(selectedIdDonVi.notifier).state = i;
      //print(i);
    }
    final List<int> bytes = workbook.saveAsStream();
    String fileName = "chitietsanluong_brcd_$formattedString.xlsx";
    File file = await WriteFileMethod.writeCounter(bytes, fileName);
    //OpenFile.open("$path/$fileName");
    bool temp = file.existsSync();
    workbook.dispose();
    if (temp == true) {
      return "Lưu thành công, vui lòng kiểm tra mục Download với tên file là: $fileName";
    } else {
      return "Lưu file thất bại, vui lòng thông báo đến nhà phát triển";
    }
  }
}
