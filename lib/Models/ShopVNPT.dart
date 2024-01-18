// ignore_for_file: file_names

import 'dart:convert';

ShopVnpt shopVnptFromJson(String str) => ShopVnpt.fromJson(json.decode(str));

String shopVnptToJson(ShopVnpt data) => json.encode(data.toJson());

class ShopVnpt {
    String? thangThucHien;
    String? maDonHang;
    String? maDhsxkd;
    String? soThueBaoDatMua;
    String? loaiThueBao;
    String? ngayTaoDon;
    String? ngayHoanThanh;
    int? doanhThuSim;
    int? cuocCamKet;
    dynamic tenGoi;
    dynamic maGoi;
    dynamic giaGoiThang;
    dynamic chuKy;
    dynamic donViChuKy;
    int? doanhThuGoi;
    int? doanhThuVoice;
    int? doanhThuData;
    int? doanhThuSmcs;
    int? doanhThuVas;
    int? doanhThuKhac;
    String? loaiSim;
    String? maGioiThieuDh;
    String? tenNguoiGioiThieuDh;
    dynamic maDonViQuanLyNguoiGt;
    dynamic tenDonViQuanLyNguoiGt;
    String? maPhongQuanLyNguoiGt;
    String? tenPhongQuanLyNguoiGt;
    String? maTinhQuanLyNguoiGt;
    dynamic maTinhHoanThien;
    dynamic maHrmnguoiHoanTatHd;
    dynamic tenNguoiHoanTatHd;
    dynamic maDonViNguoiHoanTatHd;
    dynamic tenDonViQuanLyNguoiHoanTatHd;
    dynamic maPhongQuanLyNguoiHoanTatHd;
    dynamic tenPhongQuanLyNguoiHoanTatHd;
    String? sdtlienHe;
    dynamic ngayKichHoatHoaMang;
    String? hinhThucThanhToan;
    String? trangThaiDon;
    dynamic lyDoThatBai;
    String? loaiDon;

    ShopVnpt({
        this.thangThucHien,
        this.maDonHang,
        this.maDhsxkd,
        this.soThueBaoDatMua,
        this.loaiThueBao,
        this.ngayTaoDon,
        this.ngayHoanThanh,
        this.doanhThuSim,
        this.cuocCamKet,
        this.tenGoi,
        this.maGoi,
        this.giaGoiThang,
        this.chuKy,
        this.donViChuKy,
        this.doanhThuGoi,
        this.doanhThuVoice,
        this.doanhThuData,
        this.doanhThuSmcs,
        this.doanhThuVas,
        this.doanhThuKhac,
        this.loaiSim,
        this.maGioiThieuDh,
        this.tenNguoiGioiThieuDh,
        this.maDonViQuanLyNguoiGt,
        this.tenDonViQuanLyNguoiGt,
        this.maPhongQuanLyNguoiGt,
        this.tenPhongQuanLyNguoiGt,
        this.maTinhQuanLyNguoiGt,
        this.maTinhHoanThien,
        this.maHrmnguoiHoanTatHd,
        this.tenNguoiHoanTatHd,
        this.maDonViNguoiHoanTatHd,
        this.tenDonViQuanLyNguoiHoanTatHd,
        this.maPhongQuanLyNguoiHoanTatHd,
        this.tenPhongQuanLyNguoiHoanTatHd,
        this.sdtlienHe,
        this.ngayKichHoatHoaMang,
        this.hinhThucThanhToan,
        this.trangThaiDon,
        this.lyDoThatBai,
        this.loaiDon,
    });

    factory ShopVnpt.fromJson(Map<String, dynamic> json) => ShopVnpt(
        thangThucHien: json["thangThucHien"],
        maDonHang: json["maDonHang"],
        maDhsxkd: json["maDhsxkd"],
        soThueBaoDatMua: json["soThueBaoDatMua"],
        loaiThueBao: json["loaiThueBao"],
        ngayTaoDon: json["ngayTaoDon"],
        ngayHoanThanh: json["ngayHoanThanh"],
        doanhThuSim: json["doanhThuSim"],
        cuocCamKet: json["cuocCamKet"],
        tenGoi: json["tenGoi"],
        maGoi: json["maGoi"],
        giaGoiThang: json["giaGoiThang"],
        chuKy: json["chuKy"],
        donViChuKy: json["donViChuKy"],
        doanhThuGoi: json["doanhThuGoi"],
        doanhThuVoice: json["doanhThuVoice"],
        doanhThuData: json["doanhThuData"],
        doanhThuSmcs: json["doanhThuSmcs"],
        doanhThuVas: json["doanhThuVas"],
        doanhThuKhac: json["doanhThuKhac"],
        loaiSim: json["loaiSim"],
        maGioiThieuDh: json["maGioiThieuDh"],
        tenNguoiGioiThieuDh: json["tenNguoiGioiThieuDh"],
        maDonViQuanLyNguoiGt: json["maDonViQuanLyNguoiGt"],
        tenDonViQuanLyNguoiGt: json["tenDonViQuanLyNguoiGt"],
        maPhongQuanLyNguoiGt: json["maPhongQuanLyNguoiGt"],
        tenPhongQuanLyNguoiGt: json["tenPhongQuanLyNguoiGt"],
        maTinhQuanLyNguoiGt: json["maTinhQuanLyNguoiGt"],
        maTinhHoanThien: json["maTinhHoanThien"],
        maHrmnguoiHoanTatHd: json["maHrmnguoiHoanTatHd"],
        tenNguoiHoanTatHd: json["tenNguoiHoanTatHd"],
        maDonViNguoiHoanTatHd: json["maDonViNguoiHoanTatHd"],
        tenDonViQuanLyNguoiHoanTatHd: json["tenDonViQuanLyNguoiHoanTatHd"],
        maPhongQuanLyNguoiHoanTatHd: json["maPhongQuanLyNguoiHoanTatHd"],
        tenPhongQuanLyNguoiHoanTatHd: json["tenPhongQuanLyNguoiHoanTatHd"],
        sdtlienHe: json["sdtlienHe"],
        ngayKichHoatHoaMang: json["ngayKichHoatHoaMang"],
        hinhThucThanhToan: json["hinhThucThanhToan"],
        trangThaiDon: json["trangThaiDon"],
        lyDoThatBai: json["lyDoThatBai"],
        loaiDon: json["loaiDon"],
    );

    Map<String, dynamic> toJson() => {
        "thangThucHien": thangThucHien,
        "maDonHang": maDonHang,
        "maDhsxkd": maDhsxkd,
        "soThueBaoDatMua": soThueBaoDatMua,
        "loaiThueBao": loaiThueBao,
        "ngayTaoDon": ngayTaoDon,
        "ngayHoanThanh": ngayHoanThanh,
        "doanhThuSim": doanhThuSim,
        "cuocCamKet": cuocCamKet,
        "tenGoi": tenGoi,
        "maGoi": maGoi,
        "giaGoiThang": giaGoiThang,
        "chuKy": chuKy,
        "donViChuKy": donViChuKy,
        "doanhThuGoi": doanhThuGoi,
        "doanhThuVoice": doanhThuVoice,
        "doanhThuData": doanhThuData,
        "doanhThuSmcs": doanhThuSmcs,
        "doanhThuVas": doanhThuVas,
        "doanhThuKhac": doanhThuKhac,
        "loaiSim": loaiSim,
        "maGioiThieuDh": maGioiThieuDh,
        "tenNguoiGioiThieuDh": tenNguoiGioiThieuDh,
        "maDonViQuanLyNguoiGt": maDonViQuanLyNguoiGt,
        "tenDonViQuanLyNguoiGt": tenDonViQuanLyNguoiGt,
        "maPhongQuanLyNguoiGt": maPhongQuanLyNguoiGt,
        "tenPhongQuanLyNguoiGt": tenPhongQuanLyNguoiGt,
        "maTinhQuanLyNguoiGt": maTinhQuanLyNguoiGt,
        "maTinhHoanThien": maTinhHoanThien,
        "maHrmnguoiHoanTatHd": maHrmnguoiHoanTatHd,
        "tenNguoiHoanTatHd": tenNguoiHoanTatHd,
        "maDonViNguoiHoanTatHd": maDonViNguoiHoanTatHd,
        "tenDonViQuanLyNguoiHoanTatHd": tenDonViQuanLyNguoiHoanTatHd,
        "maPhongQuanLyNguoiHoanTatHd": maPhongQuanLyNguoiHoanTatHd,
        "tenPhongQuanLyNguoiHoanTatHd": tenPhongQuanLyNguoiHoanTatHd,
        "sdtlienHe": sdtlienHe,
        "ngayKichHoatHoaMang": ngayKichHoatHoaMang,
        "hinhThucThanhToan": hinhThucThanhToan,
        "trangThaiDon": trangThaiDon,
        "lyDoThatBai": lyDoThatBai,
        "loaiDon": loaiDon,
    };
}
