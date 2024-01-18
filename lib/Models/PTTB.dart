// ignore_for_file: file_names

import 'dart:convert';

Pttb pttbFromJson(String str) => Pttb.fromJson(json.decode(str));

String pttbToJson(Pttb data) => json.encode(data.toJson());

class Pttb {
    int? stt;
    String? loaiKenh;
    String? thanhVienKenhCha;
    String? soTb;
    String? userDangKy;
    String? hinhThucDangKy;
    String? smcs;
    String? hoTen;
    String? pbh;
    String? trangThai;

    Pttb({
        this.stt,
        this.loaiKenh,
        this.thanhVienKenhCha,
        this.soTb,
        this.userDangKy,
        this.hinhThucDangKy,
        this.smcs,
        this.hoTen,
        this.pbh,
        this.trangThai,
    });

    factory Pttb.fromJson(Map<String, dynamic> json) => Pttb(
        stt: json["stt"],
        loaiKenh: json["loaiKenh"],
        thanhVienKenhCha: json["thanhVienKenhCha"],
        soTb: json["soTb"],
        userDangKy: json["userDangKy"],
        hinhThucDangKy: json["hinhThucDangKy"],
        smcs: json["smcs"],
        hoTen: json["hoTen"],
        pbh: json["pbh"],
        trangThai: json["trangThai"],
    );

    Map<String, dynamic> toJson() => {
        "stt": stt,
        "loaiKenh": loaiKenh,
        "thanhVienKenhCha": thanhVienKenhCha,
        "soTb": soTb,
        "userDangKy": userDangKy,
        "hinhThucDangKy": hinhThucDangKy,
        "smcs": smcs,
        "hoTen": hoTen,
        "pbh": pbh,
        "trangThai": trangThai,
    };
}
