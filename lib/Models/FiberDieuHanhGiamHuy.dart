class FiberDieuHanhGiamHuy {
  int? khuvucC3Id;
  int? dukienPsc;
  int? dukienThuctang;
  int? ptmFiberDungthatTrongthang;
  int? ptmFiberDungthuTrongthang;
  int? tongPtmdungthuDungthat;
  int? nvkinhdoanhFiber;
  int? nvkythuatFiber;
  int? ptmFiberMk;
  int? dathanhly;
  int? dukienNgungpsc;
  int? fiberNo;
  dynamic ngungPscPtm;
  dynamic ngungPscPsc;
  dynamic tongPtmMesh;
  DateTime? ngayCapNhat;
  String? tenKvC3;
  String? tenDvPbh;

  FiberDieuHanhGiamHuy({
    this.khuvucC3Id,
    this.dukienPsc,
    this.dukienThuctang,
    this.ptmFiberDungthatTrongthang,
    this.ptmFiberDungthuTrongthang,
    this.tongPtmdungthuDungthat,
    this.nvkinhdoanhFiber,
    this.nvkythuatFiber,
    this.ptmFiberMk,
    this.dathanhly,
    this.dukienNgungpsc,
    this.fiberNo,
    this.ngungPscPtm,
    this.ngungPscPsc,
    this.tongPtmMesh,
    this.ngayCapNhat,
    this.tenKvC3,
    this.tenDvPbh,
  });

  factory FiberDieuHanhGiamHuy.fromJson(Map<String, dynamic> json) =>
      FiberDieuHanhGiamHuy(
        khuvucC3Id: json["khuvuc_c3_id"],
        dukienPsc: json["dukien_psc"],
        dukienThuctang: json["dukien_thuctang"],
        ptmFiberDungthatTrongthang: json["ptm_fiber_dungthat_trongthang"],
        ptmFiberDungthuTrongthang: json["ptm_fiber_dungthu_trongthang"],
        tongPtmdungthuDungthat: json["tong_ptmdungthu_dungthat"],
        nvkinhdoanhFiber: json["nvkinhdoanh_fiber"],
        nvkythuatFiber: json["nvkythuat_fiber"],
        ptmFiberMk: json["ptm_fiber_mk"],
        dathanhly: json["dathanhly"],
        dukienNgungpsc: json["dukien_ngungpsc"],
        fiberNo: json["fiber_no"],
        ngungPscPtm: json["ngungPsc_PTM"],
        ngungPscPsc: json["ngungPsc_PSC"]?.toDouble(),
        tongPtmMesh: json["tongPTMMesh"],
        ngayCapNhat: json["ngay_cap_nhat"] == null
            ? null
            : DateTime.parse(json["ngay_cap_nhat"]),
        tenKvC3: json["ten_kv_c3"],
        tenDvPbh: json["ten_dv_pbh"],
      );

  Map<String, dynamic> toJson() => {
        "khuvuc_c3_id": khuvucC3Id,
        "dukien_psc": dukienPsc,
        "dukien_thuctang": dukienThuctang,
        "ptm_fiber_dungthat_trongthang": ptmFiberDungthatTrongthang,
        "ptm_fiber_dungthu_trongthang": ptmFiberDungthuTrongthang,
        "tong_ptmdungthu_dungthat": tongPtmdungthuDungthat,
        "nvkinhdoanh_fiber": nvkinhdoanhFiber,
        "nvkythuat_fiber": nvkythuatFiber,
        "ptm_fiber_mk": ptmFiberMk,
        "dathanhly": dathanhly,
        "dukien_ngungpsc": dukienNgungpsc,
        "fiber_no": fiberNo,
        "ngungPsc_PTM": ngungPscPtm,
        "tongPTMMesh": tongPtmMesh,
        "ngungPsc_PSC": ngungPscPsc,
        "ngay_cap_nhat": ngayCapNhat?.toIso8601String(),
        "ten_kv_c3": tenKvC3,
        "ten_dv_pbh": tenDvPbh,
      };
}
