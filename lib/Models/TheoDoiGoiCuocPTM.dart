// ignore_for_file: file_names

import 'dart:convert';

TheoDoiGoiCuocPtm theoDoiGoiCuocPtmFromJson(String str) => TheoDoiGoiCuocPtm.fromJson(json.decode(str));

String theoDoiGoiCuocPtmToJson(TheoDoiGoiCuocPtm data) => json.encode(data.toJson());

class TheoDoiGoiCuocPtm {
    String timekey;
    String eload;
    String sodt;
    String tengoi;
    double tiengoi;
    String thoigianDkgoi;
    String loaiId;
    String nhanvien;
    String nhanvienSmcs;
    int idDonvi;
    String tenDonvi;
    double tieudungTkc;
    int trangthaiDuoctinh;
    double tieudungTkc6Th;
    String nhanvienChucdanh;
    String nhanvienTruongnhom;
    String loaiTb;
    String ghichu;
    String chunhomSmcs;
    int trangthaiTbPtm;
    String ngayDkTttb;
    int tinhluongTheoQuyche;
    int trangthaiDahuongLuong;
    double doanhthuDuocGhinhan;
    int sothangChenhlech;
    int eloadDuq;
    int chukyGoi;
    double thulaoThangN;
    double thulaoThangN3;
    double doanhthuDuocGhinhanKpi;
    double doanhthuTangthem;
    double thulaoThangN1;
    double thulaoThangN2;
    String userDktb;
    String hrmDktb;
    String hrmBanGoi;
    TheoDoiGoiCuocPtm({
        required this.timekey,
        required this.eload,
        required this.sodt,
        required this.tengoi,
        required this.tiengoi,
        required this.thoigianDkgoi,
        required this.loaiId,
        required this.nhanvien,
        required this.nhanvienSmcs,
        required this.idDonvi,
        required this.tenDonvi,
        required this.tieudungTkc,
        required this.trangthaiDuoctinh,
        required this.tieudungTkc6Th,
        required this.nhanvienChucdanh,
        required this.nhanvienTruongnhom,
        required this.loaiTb,
        required this.ghichu,
        required this.chunhomSmcs,
        required this.trangthaiTbPtm,
        required this.ngayDkTttb,
        required this.tinhluongTheoQuyche,
        required this.trangthaiDahuongLuong,
        required this.doanhthuDuocGhinhan,
        required this.sothangChenhlech,
        required this.eloadDuq,
        required this.chukyGoi,
        required this.thulaoThangN,
        required this.thulaoThangN3,
        required this.doanhthuDuocGhinhanKpi,
        required this.doanhthuTangthem,
        required this.thulaoThangN1,
        required this.thulaoThangN2,
        required this.userDktb,
        required this.hrmDktb,
        required this.hrmBanGoi,
    });
    factory TheoDoiGoiCuocPtm.fromJson(Map<String, dynamic> json) => TheoDoiGoiCuocPtm(
        timekey: json["timekey"],
        eload: json["eload"],
        sodt: json["sodt"],
        tengoi: json["tengoi"],
        tiengoi: json["tiengoi"].toDouble(),
        thoigianDkgoi: json["thoigianDkgoi"],
        loaiId: json["loaiId"],
        nhanvien: json["nhanvien"],
        nhanvienSmcs: json["nhanvienSmcs"],
        idDonvi: json["idDonvi"],
        tenDonvi: json["tenDonvi"],
        tieudungTkc: json["tieudungTkc"]?.toDouble(),
        trangthaiDuoctinh: json["trangthaiDuoctinh"],
        tieudungTkc6Th: json["tieudungTkc6th"].toDouble(),
        nhanvienChucdanh: json["nhanvienChucdanh"],
        nhanvienTruongnhom: json["nhanvienTruongnhom"],
        loaiTb: json["loaiTb"],
        ghichu: json["ghichu"],
        chunhomSmcs: json["chunhomSmcs"]?? '',
        trangthaiTbPtm: json["trangthaiTbPtm"],
        ngayDkTttb: json["ngayDkTttb"],
        tinhluongTheoQuyche: json["tinhluongTheoQuyche"],
        trangthaiDahuongLuong: json["trangthaiDahuongLuong"],
        doanhthuDuocGhinhan: json["doanhthuDuocGhinhan"].toDouble(),
        sothangChenhlech: json["sothangChenhlech"],
        eloadDuq: json["eloadDuq"],
        chukyGoi: json["chukyGoi"],
        thulaoThangN: json["thulaoThangN"].toDouble(),
        thulaoThangN3: json["thulaoThangN3"].toDouble(),
        doanhthuDuocGhinhanKpi: json["doanhthuDuocGhinhanKpi"].toDouble(),
        doanhthuTangthem: json["doanhthuTangthem"].toDouble(),
        thulaoThangN1: json["thulaoThangN1"].toDouble(),
        thulaoThangN2: json["thulaoThangN2"].toDouble(),
        userDktb: json["userDktb"],
        hrmDktb: json["hrmDktb"],
        hrmBanGoi: json["hrmBanGoi"],
    );

    Map<String, dynamic> toJson() => {
        "timekey": timekey,
        "eload": eload,
        "sodt": sodt,
        "tengoi": tengoi,
        "tiengoi": tiengoi,
        "thoigianDkgoi": thoigianDkgoi,
        "loaiId": loaiId,
        "nhanvien": nhanvien,
        "nhanvienSmcs": nhanvienSmcs,
        "idDonvi": idDonvi,
        "tenDonvi": tenDonvi,
        "tieudungTkc": tieudungTkc,
        "trangthaiDuoctinh": trangthaiDuoctinh,
        "tieudungTkc6th": tieudungTkc6Th,
        "nhanvienChucdanh": nhanvienChucdanh,
        "nhanvienTruongnhom": nhanvienTruongnhom,
        "loaiTb": loaiTb,
        "ghichu": ghichu,
        "chunhomSmcs": chunhomSmcs,
        "trangthaiTbPtm": trangthaiTbPtm,
        "ngayDkTttb": ngayDkTttb,
        "tinhluongTheoQuyche": tinhluongTheoQuyche,
        "trangthaiDahuongLuong": trangthaiDahuongLuong,
        "doanhthuDuocGhinhan": doanhthuDuocGhinhan,
        "sothangChenhlech": sothangChenhlech,
        "eloadDuq": eloadDuq,
        "chukyGoi": chukyGoi,
        "thulaoThangN": thulaoThangN,
        "thulaoThangN3": thulaoThangN3,
        "doanhthuDuocGhinhanKpi": doanhthuDuocGhinhanKpi,
        "doanhthuTangthem": doanhthuTangthem,
        "thulaoThangN1": thulaoThangN1,
        "thulaoThangN2": thulaoThangN2,
        "userDktb": userDktb,
        "hrmDktb": hrmDktb,
        "hrmBanGoi": hrmBanGoi,
    };
}
