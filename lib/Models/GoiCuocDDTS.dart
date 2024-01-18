// ignore_for_file: file_names

class GoiCuocDDTS {
    int id;
    String? tenGoiCuoc;
    String? chuKy1T;
    String? chuKy3T;
    String? chuKy6T;
    String? chuKy9T;
    String? chuKy12T;
    String? thoaiNoiMang;
    String? thoaiNgoaiMang;
    String? sms;
    String? dataNgay;
    String? dataThang;
    String? uuDaiKhac;
    String? hetDungLuong;
    String? nhuCau;
    int? trangThai;

    GoiCuocDDTS({
      required this.id,
        this.tenGoiCuoc,
        this.chuKy1T,
        this.chuKy3T,
        this.chuKy6T,
        this.chuKy9T,
        this.chuKy12T,
        this.thoaiNoiMang,
        this.thoaiNgoaiMang,
        this.sms,
        this.dataNgay,
        this.dataThang,
        this.uuDaiKhac,
        this.hetDungLuong,
        this.nhuCau,
        this.trangThai,
    });

    factory GoiCuocDDTS.fromJson(Map<String, dynamic> json) => GoiCuocDDTS(
        id: json["id"],
        tenGoiCuoc: json["tenGoiCuoc"],
        chuKy1T: json["chuKy1t"],
        chuKy3T: json["chuKy3t"],
        chuKy6T: json["chuKy6t"],
        chuKy9T: json["chuKy9t"],
        chuKy12T: json["chuKy12t"],
        thoaiNoiMang: json["thoaiNoiMang"],
        thoaiNgoaiMang: json["thoaiNgoaiMang"],
        sms: json["sms"],
        dataNgay: json["dataNgay"],
        dataThang: json["dataThang"],
        uuDaiKhac: json["uuDaiKhac"],
        hetDungLuong: json["hetDungLuong"],
        nhuCau: json["nhuCau"],
        trangThai: json["trangThai"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tenGoiCuoc": tenGoiCuoc ?? '',
        "chuKy1t": chuKy1T ?? '',
        "chuKy3t": chuKy3T ?? '',
        "chuKy6t": chuKy6T ?? '',
        "chuKy9t": chuKy9T ?? '',
        "chuKy12t": chuKy12T ?? '',
        "thoaiNoiMang": thoaiNoiMang ?? '',
        "thoaiNgoaiMang": thoaiNgoaiMang ?? '',
        "sms": sms ?? '',
        "dataNgay": dataNgay ?? '',
        "dataThang": dataThang ?? '',
        "uuDaiKhac": uuDaiKhac ?? '',
        "hetDungLuong": hetDungLuong ?? '',
        "nhuCau": nhuCau ?? '',
        "trangThai": trangThai ?? '',
    };
}
