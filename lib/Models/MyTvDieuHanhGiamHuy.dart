class MyTvDieuHanhGiamHuy {
    int? khuvucC3Id;
    int? dukienPsc;
    int? dukienThuctang;
    int? tongPtmdungthuDungthat;
    int? ptmMytvDungthuTrongthang;
    int? ptmMytvDungthatTrongthang;
    int? nvkinhdoanhMytv;
    int? nvkythuatMytv;
    int? ptmMytvMk;
    int? dathanhly;
    int? dukienNgungpsc;
    int? mytvNo;
    dynamic ngungPscPtm;
    dynamic ngungPscPsc;
    DateTime? ngayCapNhat;
    String? tenKvC3;
    String? tenDvPbh;
    MyTvDieuHanhGiamHuy({
        this.khuvucC3Id,
        this.dukienPsc,
        this.dukienThuctang,
        this.tongPtmdungthuDungthat,
        this.ptmMytvDungthuTrongthang,
        this.ptmMytvDungthatTrongthang,
        this.nvkinhdoanhMytv,
        this.nvkythuatMytv,
        this.ptmMytvMk,
        this.dathanhly,
        this.dukienNgungpsc,
        this.mytvNo,
        this.ngungPscPtm,
        this.ngungPscPsc,
        this.ngayCapNhat,
        this.tenKvC3,
        this.tenDvPbh,
    });

    factory MyTvDieuHanhGiamHuy.fromJson(Map<String, dynamic> json) => MyTvDieuHanhGiamHuy(
        khuvucC3Id: json["khuvuc_c3_id"],
        dukienPsc: json["dukien_psc"],
        dukienThuctang: json["dukien_thuctang"],
        tongPtmdungthuDungthat: json["tong_ptmdungthu_dungthat"],
        ptmMytvDungthuTrongthang: json["ptm_mytv_dungthu_trongthang"],
        ptmMytvDungthatTrongthang: json["ptm_mytv_dungthat_trongthang"],
        nvkinhdoanhMytv: json["nvkinhdoanh_mytv"],
        nvkythuatMytv: json["nvkythuat_mytv"],
        ptmMytvMk: json["ptm_mytv_mk"],
        dathanhly: json["dathanhly"],
        dukienNgungpsc: json["dukien_ngungpsc"],
        mytvNo: json["mytv_no"],
        ngungPscPtm: json["ngungPsc_PTM"],
        ngungPscPsc: json["ngungPsc_PSC"]?.toDouble(),
        ngayCapNhat: json["ngay_cap_nhat"] == null ? null : DateTime.parse(json["ngay_cap_nhat"]),
        tenKvC3: json["ten_kv_c3"],
        tenDvPbh: json["ten_dv_pbh"],
    );

    Map<String, dynamic> toJson() => {
        "khuvuc_c3_id": khuvucC3Id,
        "dukien_psc": dukienPsc,
        "dukien_thuctang": dukienThuctang,
        "tong_ptmdungthu_dungthat": tongPtmdungthuDungthat,
        "ptm_mytv_dungthu_trongthang": ptmMytvDungthuTrongthang,
        "ptm_mytv_dungthat_trongthang": ptmMytvDungthatTrongthang,
        "nvkinhdoanh_mytv": nvkinhdoanhMytv,
        "nvkythuat_mytv": nvkythuatMytv,
        "ptm_mytv_mk": ptmMytvMk,
        "dathanhly": dathanhly,
        "dukien_ngungpsc": dukienNgungpsc,
        "mytv_no": mytvNo,
        "ngungPsc_PTM": ngungPscPtm,
        "ngungPsc_PSC": ngungPscPsc,
        "ngay_cap_nhat": ngayCapNhat?.toIso8601String(),
        "ten_kv_c3": tenKvC3,
        "ten_dv_pbh": tenDvPbh,
    };
}
