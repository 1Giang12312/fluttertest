// ignore_for_file: file_names

import 'dart:convert';

TheoDoiDuLieuVtci theoDoiDuLieuVtciFromJson(String str) =>
    TheoDoiDuLieuVtci.fromJson(json.decode(str));

String theoDoiDuLieuVtciToJson(TheoDoiDuLieuVtci data) =>
    json.encode(data.toJson());

class TheoDoiDuLieuVtci {
  dynamic timekey;
  int? nam;
  DateTime? ngaySd;
  int? idDonvi;
  String? tenDonvi;
  String? sdt;
  String? tenTt;
  String? diachiTt;
  String? goi;
  int? loai;
  String? psll;
  int? doanhThu;
  String? nvPhattrien;
  String? maNvtc;
  String? tenNvtc;
  int? llOnnetOg;
  int? llOffnetOg;
  int? llOnnetIc;
  int? llOffnetIc;
  int? llSmsOnnetOg;
  int? llSmsOffnetOg;
  int? llSmsOnnetIc;
  int? llSmsOffnetIc;
  int? llData;
  int? soNgayThang;
  dynamic trangthaipheduyetQuy;
  dynamic nguoiCn;
  dynamic thoigianCn;
  dynamic ghichu;
  TheoDoiDuLieuVtci({
    this.timekey,
    this.nam,
    this.ngaySd,
    this.idDonvi,
    this.tenDonvi,
    this.sdt,
    this.tenTt,
    this.diachiTt,
    this.goi,
    this.loai,
    this.psll,
    this.doanhThu,
    this.nvPhattrien,
    this.maNvtc,
    this.tenNvtc,
    this.llOnnetOg,
    this.llOffnetOg,
    this.llOnnetIc,
    this.llOffnetIc,
    this.llSmsOnnetOg,
    this.llSmsOffnetOg,
    this.llSmsOnnetIc,
    this.llSmsOffnetIc,
    this.llData,
    this.soNgayThang,
    this.trangthaipheduyetQuy,
    this.nguoiCn,
    this.thoigianCn,
    this.ghichu,
  });
  factory TheoDoiDuLieuVtci.fromJson(Map<String, dynamic> json) =>
      TheoDoiDuLieuVtci(
        timekey: json["timekey"],
        nam: json["nam"],
        ngaySd: json["ngaySd"] == null ? null : DateTime.parse(json["ngaySd"]),
        idDonvi: json["idDonvi"],
        tenDonvi: json["tenDonvi"],
        sdt: json["sdt"],
        tenTt: json["tenTt"],
        diachiTt: json["diachiTt"],
        goi: json["goi"],
        loai: json["loai"],
        psll: json["psll"],
        doanhThu: json["doanhThu"],
        nvPhattrien: json["nvPhattrien"],
        maNvtc: json["maNvtc"],
        tenNvtc: json["tenNvtc"],
        llOnnetOg: json["llOnnetOg"],
        llOffnetOg: json["llOffnetOg"],
        llOnnetIc: json["llOnnetIc"],
        llOffnetIc: json["llOffnetIc"],
        llSmsOnnetOg: json["llSmsOnnetOg"],
        llSmsOffnetOg: json["llSmsOffnetOg"],
        llSmsOnnetIc: json["llSmsOnnetIc"],
        llSmsOffnetIc: json["llSmsOffnetIc"],
        llData: json["llData"],
        soNgayThang: json["soNgayThang"],
        trangthaipheduyetQuy: json["trangthaipheduyetQuy"],
        nguoiCn: json["nguoiCn"],
        thoigianCn: json["thoigianCn"],
        ghichu: json["ghichu"],
      );

  Map<String, dynamic> toJson() => {
        "timekey": timekey,
        "nam": nam,
        "ngaySd": ngaySd?.toIso8601String(),
        "idDonvi": idDonvi,
        "tenDonvi": tenDonvi,
        "sdt": sdt,
        "tenTt": tenTt,
        "diachiTt": diachiTt,
        "goi": goi,
        "loai": loai,
        "psll": psll,
        "doanhThu": doanhThu,
        "nvPhattrien": nvPhattrien,
        "maNvtc": maNvtc,
        "tenNvtc": tenNvtc,
        "llOnnetOg": llOnnetOg,
        "llOffnetOg": llOffnetOg,
        "llOnnetIc": llOnnetIc,
        "llOffnetIc": llOffnetIc,
        "llSmsOnnetOg": llSmsOnnetOg,
        "llSmsOffnetOg": llSmsOffnetOg,
        "llSmsOnnetIc": llSmsOnnetIc,
        "llSmsOffnetIc": llSmsOffnetIc,
        "llData": llData,
        "soNgayThang": soNgayThang,
        "trangthaipheduyetQuy": trangthaipheduyetQuy,
        "nguoiCn": nguoiCn,
        "thoigianCn": thoigianCn,
        "ghichu": ghichu,
      };
}
