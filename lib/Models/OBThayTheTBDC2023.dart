class ObThayTheTbdc2023 {
    int? id;
    String? donviTen;
    int? donviId;
    String? c3;
    String? loaiOnt;
    String? maTb;
    String? sdt;
    String? maTt;
    String? tenTt;
    String? diaChiLd;
    String? doiTuong;
    String? ngaySd;
    String? mucUuTien;
    String? tuoiTb;
    String? tenGoi;
    double? giaGoi;
    String? tocDo;
    String? mytv;
    String? mesh;
    String? dtc;
    String? soThang;
    String? nvkd;
    String? smcs;
    String? userCapNhat;
    dynamic thoigianCapNhat;
    String? noidungCapnhat;
    String? ghiChu;
    String? userCapNhatGd;
    dynamic thoiGianCapNhatGd;
    String? noiDungCapNhatGd;
    String? ghiChuGd;

    ObThayTheTbdc2023({
        this.id,
        this.donviTen,
        this.donviId,
        this.c3,
        this.loaiOnt,
        this.maTb,
        this.sdt,
        this.maTt,
        this.tenTt,
        this.diaChiLd,
        this.doiTuong,
        this.ngaySd,
        this.mucUuTien,
        this.tuoiTb,
        this.tenGoi,
        this.giaGoi,
        this.tocDo,
        this.mytv,
        this.mesh,
        this.dtc,
        this.soThang,
        this.nvkd,
        this.smcs,
        this.userCapNhat,
        this.thoigianCapNhat,
        this.noidungCapnhat,
        this.ghiChu,
        this.userCapNhatGd,
        this.thoiGianCapNhatGd,
        this.noiDungCapNhatGd,
        this.ghiChuGd,
    });

    factory ObThayTheTbdc2023.fromJson(Map<String, dynamic> json) => ObThayTheTbdc2023(
        id: json["id"],
        donviTen: json["donviTen"],
        donviId: json["donviId"],
        c3: json["c3"],
        loaiOnt: json["loaiOnt"],
        maTb: json["maTb"],
        sdt: json["sdt"],
        maTt: json["maTt"],
        tenTt: json["tenTt"],
        diaChiLd: json["diaChiLd"],
        doiTuong: json["doiTuong"],
        ngaySd: json["ngaySd"],
        mucUuTien: json["mucUuTien"],
        tuoiTb: json["tuoiTb"],
        tenGoi: json["tenGoi"],
        giaGoi: json["giaGoi"]?.toDouble(),
        tocDo: json["tocDo"],
        mytv: json["mytv"],
        mesh: json["mesh"],
        dtc: json["dtc"],
        soThang: json["soThang"],
        nvkd: json["nvkd"],
        smcs: json["smcs"],
        userCapNhat: json["userCapNhat"],
        thoigianCapNhat: json["thoigianCapNhat"],
        noidungCapnhat: json["noidungCapnhat"],
        ghiChu: json["ghiChu"],
        userCapNhatGd: json["userCapNhatGd"],
        thoiGianCapNhatGd: json["thoiGianCapNhatGd"],
        noiDungCapNhatGd: json["noiDungCapNhatGd"],
        ghiChuGd: json["ghiChuGd"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "donviTen": donviTen,
        "donviId": donviId,
        "c3": c3,
        "loaiOnt": loaiOnt,
        "maTb": maTb,
        "sdt": sdt,
        "maTt": maTt,
        "tenTt": tenTt,
        "diaChiLd": diaChiLd,
        "doiTuong": doiTuong,
        "ngaySd": ngaySd,
        "mucUuTien": mucUuTien,
        "tuoiTb": tuoiTb,
        "tenGoi": tenGoi,
        "giaGoi": giaGoi,
        "tocDo": tocDo,
        "mytv": mytv,
        "mesh": mesh,
        "dtc": dtc,
        "soThang": soThang,
        "nvkd": nvkd,
        "smcs": smcs,
        "userCapNhat": userCapNhat,
        "thoigianCapNhat": thoigianCapNhat,
        "noidungCapnhat": noidungCapnhat,
        "ghiChu": ghiChu,
        "userCapNhatGd": userCapNhatGd,
        "thoiGianCapNhatGd": thoiGianCapNhatGd,
        "noiDungCapNhatGd": noiDungCapNhatGd,
        "ghiChuGd": ghiChuGd,
    };
}
