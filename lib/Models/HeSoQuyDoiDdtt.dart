// ignore_for_file: file_names

import 'dart:convert';

HeSoQuyDoiDdtt heSoQuyDoiDdttFromJson(String str) => HeSoQuyDoiDdtt.fromJson(json.decode(str));

String heSoQuyDoiDdttToJson(HeSoQuyDoiDdtt data) => json.encode(data.toJson());

class HeSoQuyDoiDdtt {
    String? timekey;
    String? nhanvienSmcs;
    String? nhanvienHoten;
    String? donvi;
    String? sodt;
    String? tengoi;
    double? tiengoi;
    String? thoigianDkgoi;
    double? hesoQuydoi;

    HeSoQuyDoiDdtt({
         this.timekey,
         this.nhanvienSmcs,
         this.nhanvienHoten,
         this.donvi,
         this.sodt,
         this.tengoi,
         this.tiengoi,
         this.thoigianDkgoi,
         this.hesoQuydoi,
    });

    factory HeSoQuyDoiDdtt.fromJson(Map<String, dynamic> json) => HeSoQuyDoiDdtt(
        timekey: json["timekey"],
        nhanvienSmcs: json["nhanvienSmcs"],
        nhanvienHoten: json["nhanvienHoten"],
        donvi: json["donvi"],
        sodt: json["sodt"],
        tengoi: json["tengoi"],
        tiengoi: json["tiengoi"]==null ? 0.0: json["tiengoi"].toDouble(),
        thoigianDkgoi: json["thoigianDkgoi"],
        hesoQuydoi: json["hesoQuydoi"]==null ? 0.0:json["hesoQuydoi"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "timekey": timekey,
        "nhanvienSmcs": nhanvienSmcs,
        "nhanvienHoten": nhanvienHoten,
        "donvi": donvi,
        "sodt": sodt,
        "tengoi": tengoi,
        "tiengoi": tiengoi,
        "thoigianDkgoi": thoigianDkgoi,
        "hesoQuydoi": hesoQuydoi,
    };
}
