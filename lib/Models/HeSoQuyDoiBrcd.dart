// ignore_for_file: file_names

import 'dart:convert';

HeSoQuyDoiBrcd heSoQuyDoiBrcdFromJson(String str) =>
    HeSoQuyDoiBrcd.fromJson(json.decode(str));

String heSoQuyDoiBrcdToJson(HeSoQuyDoiBrcd data) => json.encode(data.toJson());

class HeSoQuyDoiBrcd {
  String? timekey;
  String? loaihinhTb;
  int? loaitbId;
  String? maTb;
  String? tenTb;
  String? maNv;
  String? tenNv;
  String? ngayHt;
  int? chuyenmang;
  String? nguoiCn;
  String? tenDv;
  double? cuocTg;
  String? loai;
  double? hesoQuydoi;

  HeSoQuyDoiBrcd({
     this.timekey,
     this.loaihinhTb,
     this.loaitbId,
     this.maTb,
     this.tenTb,
     this.maNv,
     this.tenNv,
     this.ngayHt,
     this.chuyenmang,
     this.nguoiCn,
     this.tenDv,
     this.cuocTg,
     this.loai,
     this.hesoQuydoi,
  });

  factory HeSoQuyDoiBrcd.fromJson(Map<String, dynamic> json) => HeSoQuyDoiBrcd(
        timekey: json["timekey"],
        loaihinhTb: json["loaihinhTb"],
        loaitbId: json["loaitbId"],
        maTb: json["maTb"],
        tenTb: json["tenTb"],
        maNv: json["maNv"],
        tenNv: json["tenNv"],
        ngayHt: json["ngayHt"],
        chuyenmang: json["chuyenmang"],
        nguoiCn: json["nguoiCn"],
        tenDv: json["tenDv"],
        cuocTg: json["cuocTg"] == null ? 0.0 : json["cuocTg"].toDouble(),
        loai: json["loai"],
        hesoQuydoi:
            json["hesoQuydoi"] == null ? 0.0 : json["hesoQuydoi"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "timekey": timekey,
        "loaihinhTb": loaihinhTb,
        "loaitbId": loaitbId,
        "maTb": maTb,
        "tenTb": tenTb,
        "maNv": maNv,
        "tenNv": tenNv,
        "ngayHt": ngayHt,
        "chuyenmang": chuyenmang,
        "nguoiCn": nguoiCn,
        "tenDv": tenDv,
        "cuocTg": cuocTg,
        "loai": loai,
        "hesoQuydoi": hesoQuydoi,
      };
}
