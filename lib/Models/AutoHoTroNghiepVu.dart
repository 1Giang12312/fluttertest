// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

AutoHoTroNghiepVu AutoHoTroNghiepVuFromJson(String str) =>
    AutoHoTroNghiepVu.fromJson(json.decode(str));
String AutoHoTroNghiepVuToJson(AutoHoTroNghiepVu data) =>
    json.encode(data.toJson());

class AutoHoTroNghiepVu {
  int? id;
  String? sdt;
  String? loaiYc;
  String? hethong;
  String? nhanvienYeucau;
  DateTime? thoigianYeucau;
  int? trangthai;
  int? trangthaiDahuongluong;
  String? ketquaXuly;
  DateTime? thoigianXuly;
  String? seri;
  String? loaiTb;
  String? loaiSim;
  String? tenTb;
  String? ngayKh;
  String? ngaySinh;
  String? soGt;
  String? ngayCap;
  String? soDu;
  String? hanSuDung;
  String? goiDi;
  String? goiDen;
  String? goiCuocKmcbDeXuat;
  String? ngayChuyenTsSangTt;
  dynamic tieuDungBinhQuan2Thang;
  dynamic goiCuocDangSuDung;
  dynamic ngayHetHanGoiCuoc;
  String? parameterBuffer1;
  String? packageName;
  int? longNumCycle;
  int? currentUsingCycle;
  String? loaiChuKy;
  String? dangKyLanDau;
  String? thoiGianHetHanCk;
  String? goiCuocDk;
  AutoHoTroNghiepVu({
    this.id,
    required this.sdt,
    required this.loaiYc,
    required this.hethong,
    required this.nhanvienYeucau,
    required this.thoigianYeucau,
    required this.trangthai,
    required this.trangthaiDahuongluong,
    this.ketquaXuly,
    this.thoigianXuly,
    this.seri,
    this.loaiTb,
    this.loaiSim,
    this.tenTb,
    this.ngayKh,
    this.ngaySinh,
    this.soGt,
    this.ngayCap,
    this.soDu,
    this.hanSuDung,
    this.goiDi,
    this.goiDen,
    this.goiCuocKmcbDeXuat,
    this.ngayChuyenTsSangTt,
    this.tieuDungBinhQuan2Thang,
    this.goiCuocDangSuDung,
    this.ngayHetHanGoiCuoc,
    this.parameterBuffer1,
    this.packageName,
    this.longNumCycle,
    this.currentUsingCycle,
    this.loaiChuKy,
    this.dangKyLanDau,
    this.thoiGianHetHanCk,
    this.goiCuocDk,
  });
  factory AutoHoTroNghiepVu.fromJson(Map<String, dynamic> json) =>
      AutoHoTroNghiepVu(
        id: json["id"],
        sdt: json["sdt"] ?? '',
        loaiYc: json["loaiYc"] ?? '',
        hethong: json["hethong"] ?? '',
        nhanvienYeucau: json["nhanvienYeucau"] ?? '',
        thoigianYeucau: json['thoigianYeucau'] == null
            ? DateTime(0)
            : DateTime.parse(json["thoigianYeucau"]),
        trangthai: json["trangthai"],
        trangthaiDahuongluong: json["trangthaiDahuongluong"],
        ketquaXuly: json["ketquaXuly"] ?? '',
        thoigianXuly: json['thoigianXuly'] == null
            ? DateTime(0)
            : DateTime.parse(json["thoigianXuly"]),
        seri: json["seri"] ?? '',
        loaiTb: json["loaiTb"] ?? '',
        loaiSim: json["loaiSim"] ?? '',
        tenTb: json["tenTb"] ?? '',
        ngayKh: json["ngayKh"] ?? '',
        ngaySinh: json["ngaySinh"] ?? '',
        soGt: json["soGt"] ?? '',
        ngayCap: json["ngayCap"] ?? '',
        soDu: json["soDu"] ?? '',
        hanSuDung: json["hanSuDung"] ?? '',
        goiDi: json["goiDi"] ?? '',
        goiDen: json["goiDen"] ?? '',
        goiCuocKmcbDeXuat: json["goiCuocKmcbDeXuat"] ?? '',
        ngayChuyenTsSangTt: json["ngayChuyenTsSangTt"] ?? '',
        tieuDungBinhQuan2Thang: json["tieuDungBinhQuan2Thang"] ?? '',
        goiCuocDangSuDung: json["goiCuocDangSuDung"] ?? '',
        ngayHetHanGoiCuoc: json["ngayHetHanGoiCuoc"] ?? '',
        parameterBuffer1: json["parameterBuffer1"] ?? '',
        packageName: json["packageName"] ?? '',
        longNumCycle: json["longNumCycle"] ?? 0,
        currentUsingCycle: json["currentUsingCycle"] ?? 0,
        loaiChuKy: json["loaiChuKy"] ?? '',
        dangKyLanDau: json["dangKyLanDau"] ?? '',
        thoiGianHetHanCk: json["thoiGianHetHanCk"] ?? '',
        goiCuocDk: json["goiCuocDk"] ?? '',
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "sdt": sdt,
        "loaiYc": loaiYc,
        "hethong": hethong,
        "nhanvienYeucau": nhanvienYeucau,
        "thoigianYeucau": thoigianYeucau?.toIso8601String(),
        "trangthai": trangthai,
        "trangthaiDahuongluong": trangthaiDahuongluong,
        "ketquaXuly": ketquaXuly,
        "thoigianXuly": thoigianXuly?.toIso8601String(),
        "seri": seri,
        "loaiTb": loaiTb,
        "loaiSim": loaiSim,
        "tenTb": tenTb,
        "ngayKh": ngayKh,
        "ngaySinh": ngaySinh,
        "soGt": soGt,
        "ngayCap": ngayCap,
        "soDu": soDu,
        "hanSuDung": hanSuDung,
        "goiDi": goiDi,
        "goiDen": goiDen,
        "goiCuocKmcbDeXuat": goiCuocKmcbDeXuat,
        "ngayChuyenTsSangTt": ngayChuyenTsSangTt,
        "tieuDungBinhQuan2Thang": tieuDungBinhQuan2Thang,
        "goiCuocDangSuDung": goiCuocDangSuDung,
        "ngayHetHanGoiCuoc": ngayHetHanGoiCuoc,
        "parameterBuffer1": parameterBuffer1,
        "packageName": packageName,
        "longNumCycle": longNumCycle,
        "currentUsingCycle": currentUsingCycle,
        "loaiChuKy": loaiChuKy,
        "dangKyLanDau": dangKyLanDau,
        "thoiGianHetHanCk": thoiGianHetHanCk,
        "goiCuocDk": goiCuocDk,
      };
}
