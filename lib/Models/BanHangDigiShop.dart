// ignore_for_file: file_names

import 'dart:convert';

BanHangDigiShop banHangDigiShopFromJson(String str) => BanHangDigiShop.fromJson(json.decode(str));

String banHangDigiShopToJson(BanHangDigiShop data) => json.encode(data.toJson());

class BanHangDigiShop {
    String? timekey;
    String? sdt;
    String? loaiThueBao;
    String? loaiSim;
    String? maGioiThieu;
    String? tenNguoiGt;
    String? userDktttb;
    String? ketQua;
    String? pbh;
    int? soLuong;
    BanHangDigiShop({
        this.timekey,
        this.sdt,
        this.loaiThueBao,
        this.loaiSim,
        this.maGioiThieu,
        this.tenNguoiGt,
        this.userDktttb,
        this.ketQua,
        this.pbh,
        this.soLuong
    });

    factory BanHangDigiShop.fromJson(Map<String, dynamic> json) => BanHangDigiShop(
        timekey: json["timekey"],
        sdt: json["sdt"],
        loaiThueBao: json["loaiThueBao"],
        loaiSim: json["loaiSim"],
        maGioiThieu: json["maGioiThieu"],
        tenNguoiGt: json["tenNguoiGt"],
        userDktttb: json["userDktttb"],
        ketQua: json["ketQua"],
        pbh: json["pbh"],
        soLuong: json["soLuong"]
    );

    Map<String, dynamic> toJson() => {
        "timekey": timekey,
        "sdt": sdt,
        "loaiThueBao": loaiThueBao,
        "loaiSim": loaiSim,
        "maGioiThieu": maGioiThieu,
        "tenNguoiGt": tenNguoiGt,
        "userDktttb": userDktttb,
        "ketQua": ketQua,
        "pbh": pbh,
        "soLuong": soLuong
    };
}
