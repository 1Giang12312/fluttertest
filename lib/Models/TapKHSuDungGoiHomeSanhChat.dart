// ignore_for_file: file_names

class TapKhSuDungGoiHomeSanhChat {
    int? id;
    String? maTb;
    String? goiCuoc;
    String? tenKh;
    String? sdtLienHe;
    String? diaChiThanhToan;
    String? tuyenThu;
    String? khuVucThu;
    String? nhanvienThucuoc;
    String? nhanvienSmcs;
    int? donviId;
    String? donviTen;

    TapKhSuDungGoiHomeSanhChat({
        this.id,
        this.maTb,
        this.goiCuoc,
        this.tenKh,
        this.sdtLienHe,
        this.diaChiThanhToan,
        this.tuyenThu,
        this.khuVucThu,
        this.nhanvienThucuoc,
        this.nhanvienSmcs,
        this.donviId,
        this.donviTen,
    });

    factory TapKhSuDungGoiHomeSanhChat.fromJson(Map<String, dynamic> json) => TapKhSuDungGoiHomeSanhChat(
        id: json["id"],
        maTb: json["ma_tb"],
        goiCuoc: json["goi_cuoc"],
        tenKh: json["ten_kh"],
        sdtLienHe: json["sdt_lien_he"],
        diaChiThanhToan: json["dia_chi_thanh_toan"],
        tuyenThu: json["tuyen_thu"],
        khuVucThu: json["khu_vuc_thu"],
        nhanvienThucuoc: json["nhanvien_thucuoc"],
        nhanvienSmcs: json["nhanvien_smcs"],
        donviId: json["donvi_id"],
        donviTen: json["donvi_ten"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ma_tb": maTb,
        "goi_cuoc": goiCuoc,
        "ten_kh": tenKh,
        "sdt_lien_he": sdtLienHe,
        "dia_chi_thanh_toan": diaChiThanhToan,
        "tuyen_thu": tuyenThu,
        "khu_vuc_thu": khuVucThu,
        "nhanvien_thucuoc": nhanvienThucuoc,
        "nhanvien_smcs": nhanvienSmcs,
        "donvi_id": donviId,
        "donvi_ten": donviTen,
    };
}
