// ignore_for_file: file_names

import 'dart:convert';

BanHangShopVnpt banHangShopVnptFromJson(String str) => BanHangShopVnpt.fromJson(json.decode(str));

String banHangShopVnptToJson(BanHangShopVnpt data) => json.encode(data.toJson());

class BanHangShopVnpt {
    String? maDonHang;
    String? soThueBao;
    String? loaiTb;
    String? nvGiaoHang;
    String? trangThai;
    String? trangThaiGiao;
    String? loaiSim;
    String? maSmcs;
    String? hoTen;
    String? pbh;
    int? soLuong;

    BanHangShopVnpt({
        this.maDonHang,
        this.soThueBao,
        this.loaiTb,
        this.nvGiaoHang,
        this.trangThai,
        this.trangThaiGiao,
        this.loaiSim,
        this.maSmcs,
        this.hoTen,
        this.pbh,
        this.soLuong
    });

    factory BanHangShopVnpt.fromJson(Map<String, dynamic> json) => BanHangShopVnpt(
        maDonHang: json["maDonHang"],
        soThueBao: json["soThueBao"],
        loaiTb: json["loaiTb"],
        nvGiaoHang: json["nvGiaoHang"],
        trangThai: json["trangThai"],
        trangThaiGiao: json["trangThaiGiao"],
        loaiSim: json["loaiSim"],
        maSmcs: json["maSmcs"],
        hoTen: json["hoTen"],
        pbh: json["pbh"],
        soLuong: json["soLuong"]
    );

    Map<String, dynamic> toJson() => {
        "maDonHang": maDonHang,
        "soThueBao": soThueBao,
        "loaiTb": loaiTb,
        "nvGiaoHang": nvGiaoHang,
        "trangThai": trangThai,
        "trangThaiGiao": trangThaiGiao,
        "loaiSim": loaiSim,
        "maSmcs": maSmcs,
        "hoTen": hoTen,
        "pbh": pbh,
        "soLuong":soLuong
    };
}
