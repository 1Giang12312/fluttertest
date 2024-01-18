class  TheoDoiDangNhap {
    String? donviTen;
    int? nhanvienId;
    String? nhanvienManv;
    String? nhanvienHoten;
    int? soLanLogin;
    String? ngayLoginCuoiCung;
    String? nhanvienManvThns;
    int? nhanvienDonvi;
    String? tenThietBi;
    String? tenHangThietBi;
    String? heDieuHanh;
    String? phienBanHeDieuHanh;

    TheoDoiDangNhap({
        this.donviTen,
        this.nhanvienId,
        this.nhanvienManv,
        this.nhanvienHoten,
        this.soLanLogin,
        this.ngayLoginCuoiCung,
        this.nhanvienManvThns,
        this.nhanvienDonvi,
        this.tenThietBi,
        this.tenHangThietBi,
        this.heDieuHanh,
        this.phienBanHeDieuHanh,
    });

    factory TheoDoiDangNhap.fromJson(Map<String, dynamic> json) => TheoDoiDangNhap(
        donviTen: json["donviTen"],
        nhanvienId: json["nhanvienId"],
        nhanvienManv: json["nhanvienManv"],
        nhanvienHoten: json["nhanvienHoten"],
        soLanLogin: json["soLanLogin"],
        ngayLoginCuoiCung: json["ngayLoginCuoiCung"],
        nhanvienManvThns: json["nhanvienManvThns"],
        nhanvienDonvi: json["nhanvienDonvi"],
        tenThietBi: json["tenThietBi"],
        tenHangThietBi: json["tenHangThietBi"],
        heDieuHanh: json["heDieuHanh"],
        phienBanHeDieuHanh: json["phienBanHeDieuHanh"],
    );

    Map<String, dynamic> toJson() => {
        "donviTen": donviTen,
        "nhanvienId": nhanvienId,
        "nhanvienManv": nhanvienManv,
        "nhanvienHoten": nhanvienHoten,
        "soLanLogin": soLanLogin,
        "ngayLoginCuoiCung": ngayLoginCuoiCung,
        "nhanvienManvThns": nhanvienManvThns,
        "nhanvienDonvi": nhanvienDonvi,
        "tenThietBi": tenThietBi,
        "tenHangThietBi": tenHangThietBi,
        "heDieuHanh": heDieuHanh,
        "phienBanHeDieuHanh": phienBanHeDieuHanh,
    };
}
