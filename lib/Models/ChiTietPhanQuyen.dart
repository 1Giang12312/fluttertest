// ignore_for_file: file_names

import 'dart:convert';

ChiTietPhanQuyen chiTietPhanQuyenFromJson(String str) =>
    ChiTietPhanQuyen.fromJson(json.decode(str));

String chiTietPhanQuyenToJson(ChiTietPhanQuyen data) =>
    json.encode(data.toJson());

class ChiTietPhanQuyen {
  int id;
  int nhanvienId;
  int bangId;
  int nhanvienChucdanh;
  int nhanvienDonvi;
  bool? xem;
  bool? them;
  bool? xoa;
  bool? sua;

  ChiTietPhanQuyen({
    required this.id,
    required this.nhanvienId,
    required this.bangId,
    required this.nhanvienChucdanh,
    required this.nhanvienDonvi,
    required this.xem,
    required this.them,
    required this.xoa,
    required this.sua,
  });

  factory ChiTietPhanQuyen.fromJson(Map<String, dynamic> json) =>
      ChiTietPhanQuyen(
        id: json["id"],
        nhanvienId: json["nhanvienId"],
        bangId: json["bangId"],
        nhanvienChucdanh: json["nhanvienChucdanh"],
        nhanvienDonvi: json["nhanvienDonvi"],
        xem: json["xem"],
        them: json["them"],
        xoa: json["xoa"],
        sua: json["sua"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nhanvienId": nhanvienId,
        "bangId": bangId,
        "nhanvienChucdanh": nhanvienChucdanh,
        "nhanvienDonvi": nhanvienDonvi,
        "xem": xem,
        "them": them,
        "xoa": xoa,
        "sua": sua,
      };
}
List<ChiTietPhanQuyen> localChiTietPhanQuyen = [];
