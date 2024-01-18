class MyTvFiberDieuHanhGiamHuyC2 {
    String? tenDvPbh;
    int? donviPbh;
    int? ptm;
    int? ngungpsc;
    int? thuctang;
    int? psc;
    int? huy;
    dynamic ngungPscPsc;
    dynamic ngungPscPtm;
    dynamic PtmMeshCam;
    MyTvFiberDieuHanhGiamHuyC2({
        this.tenDvPbh,
        this.donviPbh,
        this.ptm,
        this.ngungpsc,
        this.thuctang,
        this.psc,
        this.huy,
        this.ngungPscPsc,
        this.ngungPscPtm,
        this.PtmMeshCam
    });
    factory MyTvFiberDieuHanhGiamHuyC2.fromJson(Map<String, dynamic> json) => MyTvFiberDieuHanhGiamHuyC2(
        tenDvPbh: json["ten_dv_pbh"],
        donviPbh: json["donvi_pbh"],
        ptm: json["ptm"],
        ngungpsc: json["ngungpsc"],
        thuctang: json["thuctang"],
        psc: json["psc"],
        huy: json["huy"],
        ngungPscPsc: json["ngungPsc_Psc"],
        ngungPscPtm: json["ngungPsc_Ptm"],
        PtmMeshCam: json["ptmMeshCam"]
    );

    Map<String, dynamic> toJson() => {
        "ten_dv_pbh": tenDvPbh,
        "donvi_pbh": donviPbh,
        "ptm": ptm,
        "ngungpsc": ngungpsc,
        "thuctang": thuctang,
        "psc": psc,
        "huy": huy,
        "ptmMeshCam":PtmMeshCam,
        "ngungPsc_Psc": ngungPscPsc,
        "ngungPsc_Ptm": ngungPscPtm,
    };
}
