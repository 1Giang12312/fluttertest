// ignore_for_file: file_names

import 'dart:convert';

DigiShop digiShopFromJson(String str) => DigiShop.fromJson(json.decode(str));

String digiShopToJson(DigiShop data) => json.encode(data.toJson());

class DigiShop {
    int? stt;
    int? maDonHang;
    String? loaiDon;
    String? loaiKenh;
    String? maDhsxkd;
    String? nhomSanPham;
    dynamic sanPham;
    String? sdtmua;
    String? loaiSim;
    String? maCtvdaiLy;
    String? tenCtvdaiLy;
    String? vaiTro;
    dynamic tenDoanhNghiep;
    dynamic mst;
    String? ttkd;
    String? pbh;
    dynamic toChucChuoi;
    String? tenKh;
    int? sdtkh;
    String? diaChiKh;
    int? giaTienVnd;
    double? ngayaoDh;
    double? ngayDhthanhCong;
    String? trangThai;
    String? hoaHongTamTinhVnd;
    String? hoaHongThucTraVnd;
    dynamic nguyenNhanKhongTinhHoaHong;
    dynamic lyDoThatBai;
    String? maNvkdhoTro;
    String? hoTenNvkdhoTro;
    int? sdtnvkdhoTro;
    String? ttkdcuaNvkdhoTro;
    String? userDangKyTttb;
    String? ctvxhhthuocNvctvgioiThieu;
    String? hrm;
    String? pbhnhanVienGioiThieu;
    String? ketQua;
    DigiShop({
        this.stt,
        this.maDonHang,
        this.loaiDon,
        this.loaiKenh,
        this.maDhsxkd,
        this.nhomSanPham,
        this.sanPham,
        this.sdtmua,
        this.loaiSim,
        this.maCtvdaiLy,
        this.tenCtvdaiLy,
        this.vaiTro,
        this.tenDoanhNghiep,
        this.mst,
        this.ttkd,
        this.pbh,
        this.toChucChuoi,
        this.tenKh,
        this.sdtkh,
        this.diaChiKh,
        this.giaTienVnd,
        this.ngayaoDh,
        this.ngayDhthanhCong,
        this.trangThai,
        this.hoaHongTamTinhVnd,
        this.hoaHongThucTraVnd,
        this.nguyenNhanKhongTinhHoaHong,
        this.lyDoThatBai,
        this.maNvkdhoTro,
        this.hoTenNvkdhoTro,
        this.sdtnvkdhoTro,
        this.ttkdcuaNvkdhoTro,
        this.userDangKyTttb,
        this.ctvxhhthuocNvctvgioiThieu,
        this.hrm,
        this.pbhnhanVienGioiThieu,
        this.ketQua,
    });

    factory DigiShop.fromJson(Map<String, dynamic> json) => DigiShop(
        stt: json["stt"],
        maDonHang: json["maDonHang"],
        loaiDon: json["loaiDon"],
        loaiKenh: json["loaiKenh"],
        maDhsxkd: json["maDhsxkd"],
        nhomSanPham: json["nhomSanPham"],
        sanPham: json["sanPham"],
        sdtmua: json["sdtmua"],
        loaiSim: json["loaiSim"],
        maCtvdaiLy: json["maCtvdaiLy"],
        tenCtvdaiLy: json["tenCtvdaiLy"],
        vaiTro: json["vaiTro"],
        tenDoanhNghiep: json["tenDoanhNghiep"],
        mst: json["mst"],
        ttkd: json["ttkd"],
        pbh: json["pbh"],
        toChucChuoi: json["toChucChuoi"],
        tenKh: json["tenKh"],
        sdtkh: json["sdtkh"],
        diaChiKh: json["diaChiKh"],
        giaTienVnd: json["giaTienVnd"],
        ngayaoDh: json["ngayaoDh"]?.toDouble(),
        ngayDhthanhCong: json["ngayDhthanhCong"]?.toDouble(),
        trangThai: json["trangThai"],
        hoaHongTamTinhVnd: json["hoaHongTamTinhVnd"],
        hoaHongThucTraVnd: json["hoaHongThucTraVnd"],
        nguyenNhanKhongTinhHoaHong: json["nguyenNhanKhongTinhHoaHong"],
        lyDoThatBai: json["lyDoThatBai"],
        maNvkdhoTro: json["maNvkdhoTro"],
        hoTenNvkdhoTro: json["hoTenNvkdhoTro"],
        sdtnvkdhoTro: json["sdtnvkdhoTro"],
        ttkdcuaNvkdhoTro: json["ttkdcuaNvkdhoTro"],
        userDangKyTttb: json["userDangKyTttb"],
        ctvxhhthuocNvctvgioiThieu: json["ctvxhhthuocNvctvgioiThieu"],
        hrm: json["hrm"],
        pbhnhanVienGioiThieu: json["pbhnhanVienGioiThieu"],
        ketQua: json["ketQua"],
    );

    Map<String, dynamic> toJson() => {
        "stt": stt,
        "maDonHang": maDonHang,
        "loaiDon": loaiDon,
        "loaiKenh": loaiKenh,
        "maDhsxkd": maDhsxkd,
        "nhomSanPham": nhomSanPham,
        "sanPham": sanPham,
        "sdtmua": sdtmua,
        "loaiSim": loaiSim,
        "maCtvdaiLy": maCtvdaiLy,
        "tenCtvdaiLy": tenCtvdaiLy,
        "vaiTro": vaiTro,
        "tenDoanhNghiep": tenDoanhNghiep,
        "mst": mst,
        "ttkd": ttkd,
        "pbh": pbh,
        "toChucChuoi": toChucChuoi,
        "tenKh": tenKh,
        "sdtkh": sdtkh,
        "diaChiKh": diaChiKh,
        "giaTienVnd": giaTienVnd,
        "ngayaoDh": ngayaoDh,
        "ngayDhthanhCong": ngayDhthanhCong,
        "trangThai": trangThai,
        "hoaHongTamTinhVnd": hoaHongTamTinhVnd,
        "hoaHongThucTraVnd": hoaHongThucTraVnd,
        "nguyenNhanKhongTinhHoaHong": nguyenNhanKhongTinhHoaHong,
        "lyDoThatBai": lyDoThatBai,
        "maNvkdhoTro": maNvkdhoTro,
        "hoTenNvkdhoTro": hoTenNvkdhoTro,
        "sdtnvkdhoTro": sdtnvkdhoTro,
        "ttkdcuaNvkdhoTro": ttkdcuaNvkdhoTro,
        "userDangKyTttb": userDangKyTttb,
        "ctvxhhthuocNvctvgioiThieu": ctvxhhthuocNvctvgioiThieu,
        "hrm": hrm,
        "pbhnhanVienGioiThieu": pbhnhanVienGioiThieu,
        "ketQua": ketQua,
    };
}
