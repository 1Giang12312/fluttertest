// ignore_for_file: file_names

import 'dart:convert';

PhanQuyen phanQuyenFromJson(String str) => PhanQuyen.fromJson(json.decode(str));

String phanQuyenToJson(PhanQuyen data) => json.encode(data.toJson());

class PhanQuyen {
  int phanquyenId;
  int nhanvienId;
  int? nhanvienDonvi;
  int? nhanvienChucdanh;
  bool? quyMo;
  bool? c1;
  bool? c2;
  bool? c3;
  bool? c4;

  PhanQuyen({
    required this.phanquyenId,
    required this.nhanvienId,
    required this.nhanvienDonvi,
    required this.nhanvienChucdanh,
    required this.quyMo,
    required this.c1,
    required this.c2,
    required this.c3,
    required this.c4,
  });

  factory PhanQuyen.fromJson(Map<String, dynamic> json) => PhanQuyen(
        phanquyenId: json["phanquyenId"],
        nhanvienId: json["nhanvienId"],
        nhanvienDonvi: json["nhanvienDonvi"],
        nhanvienChucdanh: json["nhanvienChucdanh"],
        quyMo: json["quyMo"],
        c1: json["c1"],
        c2: json["c2"],
        c3: json["c3"],
        c4: json["c4"],
      );

  Map<String, dynamic> toJson() => {
        "phanquyenId": phanquyenId,
        "nhanvienId": nhanvienId,
        "nhanvienDonvi": nhanvienDonvi,
        "nhanvienChucdanh": nhanvienChucdanh,
        "quyMo": quyMo,
        "c1": c1,
        "c2": c2,
        "c3": c3,
        "c4": c4,
      };
}

PhanQuyen localPhanQuyen = PhanQuyen(
    phanquyenId: -1,
    nhanvienId: -1,
    nhanvienDonvi: -1,
    nhanvienChucdanh: -1,
    quyMo: null,
    c1: null,
    c2: null,
    c3: null,
    c4: null);
