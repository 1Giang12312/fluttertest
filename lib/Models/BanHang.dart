// ignore_for_file: file_names

import 'dart:convert';

BanHang banHangFromJson(String str) => BanHang.fromJson(json.decode(str));

String banHangToJson(BanHang data) => json.encode(data.toJson());

class BanHang {
    int id;
    String phongBanHang;
    String hoTen;
    String taiKhoan;
    int soLuong;

    BanHang({
        required this.id,
        required this.phongBanHang,
        required this.hoTen,
        required this.taiKhoan,
        required this.soLuong,
    });

    factory BanHang.fromJson(Map<String, dynamic> json) => BanHang(
        id: json["id"],
        phongBanHang: json["pbh"],
        hoTen: json["hoTen"],
        taiKhoan: json["taiKhoan"],
        soLuong: json["soLuong"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phongBanHang": phongBanHang,
        "hoTen": hoTen,
        "taiKhoan": taiKhoan,
        "soLuong": soLuong,
    };
}
