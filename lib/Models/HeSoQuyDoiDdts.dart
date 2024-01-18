// ignore_for_file: file_names

import 'dart:convert';

HeSoQuyDoiDdts heSoQuyDoiDdtsFromJson(String str) =>
    HeSoQuyDoiDdts.fromJson(json.decode(str));

String heSoQuyDoiDdtsToJson(HeSoQuyDoiDdts data) => json.encode(data.toJson());

class HeSoQuyDoiDdts {
  String? timeKey;
  String? loaiTb;
  int? thtbId;
  String? maTb;
  String? tenTb;
  String? maNv;
  String? tenNv;
  String? ngaySd;
  String? goicuoc;
  double? giacuoc;
  String? nguoiCn;
  String? tenDv;
  double? hesoQuydoi;

  HeSoQuyDoiDdts({
    this.timeKey,
    this.loaiTb,
    this.thtbId,
    this.maTb,
    this.tenTb,
    this.maNv,
    this.tenNv,
    this.ngaySd,
    this.goicuoc,
    this.giacuoc,
    this.nguoiCn,
    this.tenDv,
    this.hesoQuydoi,
  });

  factory HeSoQuyDoiDdts.fromJson(Map<String, dynamic> json) => HeSoQuyDoiDdts(
        timeKey: json["timeKey"],
        loaiTb: json["loaiTb"],
        thtbId: json["thtbId"],
        maTb: json["maTb"],
        tenTb: json["tenTb"],
        maNv: json["maNv"],
        tenNv: json["tenNv"],
        ngaySd: json["ngaySd"],
        goicuoc: json["goicuoc"] ?? 'null',
        giacuoc: json["giacuoc"] == null ? 0.0 : json["giacuoc"].toDouble(),
        nguoiCn: json["nguoiCn"],
        tenDv: json["tenDv"],
        hesoQuydoi:
            json["hesoQuydoi"] == null ? 0.0 : json["hesoQuydoi"].toDouble(),
      );
  Map<String, dynamic> toJson() => {
        "timeKey": timeKey,
        "loaiTb": loaiTb,
        "thtbId": thtbId,
        "maTb": maTb,
        "tenTb": tenTb,
        "maNv": maNv,
        "tenNv": tenNv,
        "ngaySd": ngaySd,
        "goicuoc": goicuoc,
        "giacuoc": giacuoc,
        "nguoiCn": nguoiCn,
        "tenDv": tenDv,
        "hesoQuydoi": hesoQuydoi,
      };
}
