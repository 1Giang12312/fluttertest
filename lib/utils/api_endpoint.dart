// ignore_for_file: constant_identifier_names, non_constant_identifier_names
class ApiEndPoint {
//server debug
  // static String baseUrl = '';
  // static String httpUrl = 'http://www.vnptangiang.vn/api/api/';
  // static String httpsUrl = 'https://www.vnptangiang.vn/api/api/';
  // static String TestConnection ='${httpsUrl}TestConnection';
  // static String checkAuthorized = 'CheckAuthorize';


//android debug
  static String baseUrl = 'https://10.0.2.2:7016/api/';
  static String httpUrl = baseUrl;
  static String httpsUrl = baseUrl;
  static String TestConnection ='https://10.0.2.2:7016/api/TestConnection';
  static String checkAuthorized = 'CheckAuthorize';

//iis server
  // static String baseUrl = 'https://10.0.2.2:8082/api/';
  // static String httpUrl = baseUrl;
  // static String httpsUrl = baseUrl;
  // static String TestConnection ='https://10.0.2.2:8082/api/TestConnection';

//chrome debug
  // static String baseUrl = 'https://localhost:7016/api/';
  // static String httpUrl = baseUrl;
  // static String httpsUrl = baseUrl;
  // static String TestConnection ='https://localhost:7016/api/TestConnection';
  // static String checkAuthorized = 'CheckAuthorize';

  // static String connectionTest =
  //     '${baseUrl}NhomKpis/1';
  // static String donVi = '${baseUrl}Donvis';
  // static String GiaoBSCNhanVien = '${baseUrl}Giaobscnhanviens';
  // static String HeSoSanLuongVT_CNTT = '${baseUrl}HesoSanluongVtCntts';
  // static String NhanVien = '${baseUrl}Nhanviens';
  // static String bSCNhanVien = '${baseUrl}BscNhanviens';
  // static String Kpis = '${baseUrl}Kpis';
  // static String Donvitinhs = '${baseUrl}Donvitinhs';
  // static String Nhomkpis = '${baseUrl}NhomKpis';
  // static String AutoHoTroNghiepVus = '${baseUrl}AutoHoTroNghiepVus';
  // static String LoginJWT = '${baseUrl}token';
  // static String TheoDoiGoiCuocPTM = '${baseUrl}TheodoiGoicuocPtm';
  // static String ChiTietSanLuongVT_CNTT = '${baseUrl}ChiTietSanLuongVT_CNTT';
  // static String ThuLaoPhatTrienChamSocDUQ = '${baseUrl}ThulaoChamsocPhattrienDuq';
  // static String DanhSachGoiCuocTruoc15_6_2023='${baseUrl}TmpDanhsachGoicuocSmc';
  // static String GoiCuocDDTS='${baseUrl}TmpCamNangGoiCuocDdts';
}
class SecondaryApiEndPint {
  static const String SecondaryBaseUrl = 'https://10.0.2.2:7273/api/';
  static const String AppUsers = '${SecondaryBaseUrl}PhanQuyen';
}
