// ignore_for_file: non_constant_identifier_names, file_names

class ChiTietDSNVNBSC {
  late int id_ChiTietGiaoBSC;
  late String st_KPI;
  late String st_NhomCongViec;
  late int in_TyTrong;
  late String st_DonViTinh;
  late String do_ChiTieu;
  late String do_ThamDinh;
  late String do_TyLeThucHien;
  late String do_HeSoQuyDoi;
  late String st_GhiChu;
  late String st_LyDoThamDinh;
  late int id_NhanVien;
  late String st_MaNhanVienGiao;
  ChiTietDSNVNBSC(
      {required this.id_ChiTietGiaoBSC,
      required this.st_KPI,
      required this.st_NhomCongViec,
      required this.in_TyTrong,
      required this.st_DonViTinh,
      required this.do_ChiTieu,
      required this.do_ThamDinh,
      required this.do_TyLeThucHien,
      required this.do_HeSoQuyDoi,
      required this.st_GhiChu,
      required this.st_LyDoThamDinh,
      required this.id_NhanVien,
      required this.st_MaNhanVienGiao});
  factory ChiTietDSNVNBSC.fromJson(Map<String, dynamic> json) {
    return ChiTietDSNVNBSC(
        id_ChiTietGiaoBSC: json['id_ChiTietGiaoBSC'],
        st_KPI: json['st_KPI'],
        st_NhomCongViec: json['st_NhomCongViec'],
        in_TyTrong: json['in_TyTrong'],
        st_DonViTinh: json['st_DonViTinh'],
        do_ChiTieu: json['do_ChiTieu'].toString(),
        do_ThamDinh: json['do_ThamDinh'].toString(),
        do_TyLeThucHien: json['do_TyLeThucHien'].toString(),
        do_HeSoQuyDoi: json['do_HeSoQuyDoi'].toString(),
        st_GhiChu: json['st_GhiChu'] ?? "",
        st_LyDoThamDinh: json['st_LyDoThamDinh'] ?? "",
        id_NhanVien: json['id_NhanVien'],
        st_MaNhanVienGiao: json['st_MaNhanVienGiao']);
  }
}
