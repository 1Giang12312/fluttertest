// ignore_for_file: file_names

class LuongBanTheNapThe {
    String? timekey;
    String? nhanvienBanthe;
    String? maNhanvien;
    String? diabanBanthe;
    String? nhanVienSmcs;
    int? nhanVienDonVi;
    int? banThe;
    int? napThe;
    int? tong;
    String? donViTen;

    LuongBanTheNapThe({
        this.timekey,
        this.nhanvienBanthe,
        this.maNhanvien,
        this.diabanBanthe,
        this.nhanVienSmcs,
        this.nhanVienDonVi,
        this.banThe,
        this.napThe,
        this.tong,
        this.donViTen,
    });

    factory LuongBanTheNapThe.fromJson(Map<String, dynamic> json) => LuongBanTheNapThe(
        timekey: json["timekey"],
        nhanvienBanthe: json["nhanvienBanthe"],
        maNhanvien: json["maNhanvien"],
        diabanBanthe: json["diabanBanthe"],
        nhanVienSmcs: json["nhanVienSmcs"],
        nhanVienDonVi: json["nhanVienDonVi"],
        banThe: json["banThe"],
        napThe: json["napThe"],
        tong: json["tong"],
        donViTen: json["donViTen"],
    );

    Map<String, dynamic> toJson() => {
        "timekey": timekey,
        "nhanvienBanthe": nhanvienBanthe,
        "maNhanvien": maNhanvien,
        "diabanBanthe": diabanBanthe,
        "nhanVienSmcs": nhanVienSmcs,
        "nhanVienDonVi": nhanVienDonVi,
        "banThe": banThe,
        "napThe": napThe,
        "tong": tong,
        "donViTen": donViTen,
    };
}
