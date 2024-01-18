// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names

class HeSoSanLuongVT_CNTT {
  late String? timekey;
  late String? nhanvien_pbh;
  late String? nhanvien_smcs;
  late String? nhanvien_chucdanh;
  late double? ke_hoach;
  late int? sl_fiber;
  late double? fiber_quy_doi;
  late int? sl_mytv;
  late double? mytv_quy_doi;
  late int? sl_mesh;
  late double? mesh_quy_doi;
  late int? sl_camera;
  late double? camera_quy_doi;
  late int? sl_ddts;
  late double? doanh_thu_ddts;
  late double? ddts_quy_doi;
  late int? sl_ddtt;
  late double? doanh_thu_ddtt;
  late double? ddtt_quy_doi;
  late double? tong_diem;
  late double? he_so_quy_doi;
  late double? he_so_p1;
  late double? he_so_p2;
  HeSoSanLuongVT_CNTT({
    required this.timekey,
    required this.nhanvien_pbh,
    required this.nhanvien_smcs,
    required this.nhanvien_chucdanh,
    required this.ke_hoach,
    required this.sl_fiber,
    required this.fiber_quy_doi,
    required this.sl_mytv,
    required this.mytv_quy_doi,
    required this.sl_mesh,
    required this.mesh_quy_doi,
    required this.sl_camera,
    required this.camera_quy_doi,
    required this.sl_ddts,
    required this.doanh_thu_ddts,
    required this.ddts_quy_doi,
    required this.sl_ddtt,
    required this.doanh_thu_ddtt,
    required this.ddtt_quy_doi,
    required this.tong_diem,
    required this.he_so_quy_doi,
    required this.he_so_p1,
    required this.he_so_p2,
  });
  factory HeSoSanLuongVT_CNTT.fromJson(Map<String, dynamic> json) {
    return HeSoSanLuongVT_CNTT(
        timekey: json['timekey'],
        nhanvien_pbh: json['nhanvienPbh'],
        nhanvien_smcs: json['nhanvienSmcs'],
        nhanvien_chucdanh: json['nhanvienChucdanh'],
        ke_hoach: double.parse(json['keHoach'].toString()),
        sl_fiber: json['slFiber'],
        fiber_quy_doi: double.parse(json['fiberQuyDoi'].toString()),
        sl_mytv: json['slMytv'],
        mytv_quy_doi: double.parse(json['mytvQuyDoi'].toString()),
        sl_mesh: json['slMesh'],
        mesh_quy_doi: double.parse(json['meshQuyDoi'].toString()),
        sl_camera: json['slCamera'],
        camera_quy_doi: double.parse(json['cameraQuyDoi'].toString()),
        sl_ddts: json['slDdts'],
        doanh_thu_ddts: double.parse(json['doanhThuDdts'].toString()),
        ddts_quy_doi:  double.parse(json['ddtsQuyDoi'].toString()),
        sl_ddtt: json['slDdtt'],
        doanh_thu_ddtt: double.parse( json['doanhThuDdtt'].toString()),
        ddtt_quy_doi:  double.parse(json['ddttQuyDoi'].toString()),
        tong_diem:  double.parse(json['tongDiem'].toString()),
        he_so_quy_doi:  double.parse(json['heSoQuyDoi'].toString()),
        he_so_p1:  double.parse(json['heSoP1'].toString()),
        he_so_p2:  double.parse(json['heSoP2'].toString()));
  }
}
