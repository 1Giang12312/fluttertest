// ignore_for_file: file_names

class TmpDanhsachGoicuocSmc {
    int id;
    String? loaiDichVu;
    String? tenGoiCuoc;
    String? packageId;
    String? moTaGoiCuoc;
    double? giaCuoc;
    int? chuKy;
    String? trangThai;
    String? maSms;
    String? moTa;
    String? loaiGoi;
    int? nhomHoaHong;
    String? tiLeChiTraPtm;
    String? tiLeChiTraHh;

    TmpDanhsachGoicuocSmc({
       required this.id,
        this.loaiDichVu,
        this.tenGoiCuoc,
        this.packageId,
        this.moTaGoiCuoc,
        this.giaCuoc,
        this.chuKy,
        this.trangThai,
        this.maSms,
        this.moTa,
        this.loaiGoi,
        this.nhomHoaHong,
        this.tiLeChiTraPtm,
        this.tiLeChiTraHh,
    });

    factory TmpDanhsachGoicuocSmc.fromJson(Map<String, dynamic> json) => TmpDanhsachGoicuocSmc(
        id: json["id"],
        loaiDichVu: json["loaiDichVu"],
        tenGoiCuoc: json["tenGoiCuoc"],
        packageId: json["packageId"],
        moTaGoiCuoc: json["moTaGoiCuoc"],
        giaCuoc: json["giaCuoc"]== null ? 0.0: json["giaCuoc"].toDouble(),
        chuKy: json["chuKy"],
        trangThai: json["trangThai"],
        maSms: json["maSms"],
        moTa: json["moTa"],
        loaiGoi: json["loaiGoi"],
        nhomHoaHong: json["nhomHoaHong"],
        tiLeChiTraPtm: json["tiLeChiTraPtm"],
        tiLeChiTraHh: json["tiLeChiTraHh"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "loaiDichVu": loaiDichVu,
        "tenGoiCuoc": tenGoiCuoc,
        "packageId": packageId,
        "moTaGoiCuoc": moTaGoiCuoc,
        "giaCuoc": giaCuoc,
        "chuKy": chuKy,
        "trangThai": trangThai,
        "maSms": maSms,
        "moTa": moTa,
        "loaiGoi": loaiGoi,
        "nhomHoaHong": nhomHoaHong,
        "tiLeChiTraPtm": tiLeChiTraPtm,
        "tiLeChiTraHh": tiLeChiTraHh,
    };
}
