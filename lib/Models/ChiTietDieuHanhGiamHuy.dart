class ChiTietDieuHanhGiamHuy {
  int? khuvucC3Id;
  int? dukienPsc;
  int? dukienThuctang;
  int? tongPtmdungthuDungthat;
  int? ptmFiberDungthuTrongthang;
  int? ptmFiberDungthatTrongthang;
  int? nvkinhdoanhFiber;
  int? nvkythuatFiber;
  int? ptmFiberMk;
  int? dathanhly;
  int? dukienNgungpsc;
  int? fiberNo;
  int? ptmMeshDungthu;
  int? ptmMeshDungthat;
  int? ptmCamDungthu;
  int? ptmCamDungthat;
  dynamic tongPtmMesh;
  dynamic tongPtmCam;
  dynamic ngungPscPtm;
  dynamic ngungPscPsc;
  DateTime? ngayCapNhat;
  int? meshTamdung;
  int? meshThanhly;
  int? khoiphucThanhlyFiber;
  int? fiberTamngung;
  int? dukienPscmytv;
  int? dukienTtmytv;
  int? ptmmytv;
  int? dungthumytv;
  int? dungthatmytv;
  int? nvkdmytv;
  int? nvktmytv;
  int? mkmytv;
  int? huymytv;
  int? dukienngungpscmytv;
  int? khoanocuocmytv;
  dynamic ngungPscPtmMytv;
  dynamic ngungPscPscMytv;
  DateTime? ngaycapnhatMytv;
  int? khoiphucmytv;
  int? tamngungMytv;

  ChiTietDieuHanhGiamHuy(
      {this.khuvucC3Id,
      this.dukienPsc,
      this.dukienThuctang,
      this.tongPtmdungthuDungthat,
      this.ptmFiberDungthuTrongthang,
      this.ptmFiberDungthatTrongthang,
      this.nvkinhdoanhFiber,
      this.nvkythuatFiber,
      this.ptmFiberMk,
      this.dathanhly,
      this.dukienNgungpsc,
      this.fiberNo,
      this.ptmMeshDungthu,
      this.ptmMeshDungthat,
      this.ptmCamDungthu,
      this.ptmCamDungthat,
      this.tongPtmMesh,
      this.tongPtmCam,
      this.ngungPscPtm,
      this.ngungPscPsc,
      this.ngayCapNhat,
      this.khoiphucThanhlyFiber,
      this.fiberTamngung,
      this.dukienPscmytv,
      this.dukienTtmytv,
      this.ptmmytv,
      this.dungthumytv,
      this.dungthatmytv,
      this.nvkdmytv,
      this.nvktmytv,
      this.mkmytv,
      this.huymytv,
      this.dukienngungpscmytv,
      this.khoanocuocmytv,
      this.ngungPscPtmMytv,
      this.ngungPscPscMytv,
      this.ngaycapnhatMytv,
      this.khoiphucmytv,
      this.tamngungMytv,
      this.meshTamdung,
      this.meshThanhly});

  factory ChiTietDieuHanhGiamHuy.fromJson(Map<String, dynamic> json) =>
      ChiTietDieuHanhGiamHuy(
        khuvucC3Id: json["khuvuc_c3_id"],
        dukienPsc: json["dukien_psc"],
        dukienThuctang: json["dukien_thuctang"],
        tongPtmdungthuDungthat: json["tong_ptmdungthu_dungthat"],
        ptmFiberDungthuTrongthang: json["ptm_fiber_dungthu_trongthang"],
        ptmFiberDungthatTrongthang: json["ptm_fiber_dungthat_trongthang"],
        nvkinhdoanhFiber: json["nvkinhdoanh_fiber"],
        nvkythuatFiber: json["nvkythuat_fiber"],
        ptmFiberMk: json["ptm_fiber_mk"],
        dathanhly: json["dathanhly"],
        dukienNgungpsc: json["dukien_ngungpsc"],
        fiberNo: json["fiber_no"],
        ptmMeshDungthu: json["ptm_mesh_dungthu"],
        ptmMeshDungthat: json["ptm_mesh_dungthat"],
        ptmCamDungthu: json["ptm_cam_dungthu"],
        ptmCamDungthat: json["ptm_cam_dungthat"],
        tongPtmMesh: json["tongPtmMesh"],
        tongPtmCam: json["tongPtmCam"],
        ngungPscPtm: json["ngungPsc_PTM"]?.toDouble(),
        ngungPscPsc: json["ngungPsc_Psc"]?.toDouble(),
        ngayCapNhat: json["ngay_cap_nhat"] == null
            ? null
            : DateTime.parse(json["ngay_cap_nhat"]),
        meshTamdung: json['mesh_tamdung'],
        meshThanhly: json['mesh_thanhly'],
        khoiphucThanhlyFiber: json["khoiphuc_thanhly_fiber"],
        fiberTamngung: json["fiber_tamngung"],
        dukienPscmytv: json["dukien_pscmytv"],
        dukienTtmytv: json["dukien_ttmytv"],
        ptmmytv: json["ptmmytv"],
        dungthumytv: json["dungthumytv"],
        dungthatmytv: json["dungthatmytv"],
        nvkdmytv: json["nvkdmytv"],
        nvktmytv: json["nvktmytv"],
        mkmytv: json["mkmytv"],
        huymytv: json["huymytv"],
        dukienngungpscmytv: json["dukienngungpscmytv"],
        khoanocuocmytv: json["khoanocuocmytv"],
        ngungPscPtmMytv: json["ngungPsc_PtmMytv"],
        ngungPscPscMytv: json["ngungPsc_PscMytv"]?.toDouble(),
        ngaycapnhatMytv: json["ngaycapnhatMytv"] == null
            ? null
            : DateTime.parse(json["ngaycapnhatMytv"]),
        khoiphucmytv: json["khoiphucmytv"],
        tamngungMytv: json["tamngungMytv"],
      );

  Map<String, dynamic> toJson() => {
        "khuvuc_c3_id": khuvucC3Id,
        "dukien_psc": dukienPsc,
        "dukien_thuctang": dukienThuctang,
        "tong_ptmdungthu_dungthat": tongPtmdungthuDungthat,
        "ptm_fiber_dungthu_trongthang": ptmFiberDungthuTrongthang,
        "ptm_fiber_dungthat_trongthang": ptmFiberDungthatTrongthang,
        "nvkinhdoanh_fiber": nvkinhdoanhFiber,
        "nvkythuat_fiber": nvkythuatFiber,
        "ptm_fiber_mk": ptmFiberMk,
        "dathanhly": dathanhly,
        "dukien_ngungpsc": dukienNgungpsc,
        "fiber_no": fiberNo,
        "ptm_mesh_dungthu": ptmMeshDungthu,
        "ptm_mesh_dungthat": ptmMeshDungthat,
        "ptm_cam_dungthu": ptmCamDungthu,
        "ptm_cam_dungthat": ptmCamDungthat,
        "tongPtmMesh": tongPtmMesh,
        "tongPtmCam": tongPtmCam,
        "ngungPsc_PTM": ngungPscPtm,
        "ngungPsc_Psc": ngungPscPsc,
        "ngay_cap_nhat": ngayCapNhat?.toIso8601String(),
        "khoiphuc_thanhly_fiber": khoiphucThanhlyFiber,
        "fiber_tamngung": fiberTamngung,
        "dukien_pscmytv": dukienPscmytv,
        "dukien_ttmytv": dukienTtmytv,
        "ptmmytv": ptmmytv,
        "dungthumytv": dungthumytv,
        "dungthatmytv": dungthatmytv,
        "nvkdmytv": nvkdmytv,
        "nvktmytv": nvktmytv,
        "mkmytv": mkmytv,
        "huymytv": huymytv,
        "dukienngungpscmytv": dukienngungpscmytv,
        "khoanocuocmytv": khoanocuocmytv,
        "ngungPsc_PtmMytv": ngungPscPtmMytv,
        "ngungPsc_PscMytv": ngungPscPscMytv,
        "ngaycapnhatMytv": ngaycapnhatMytv?.toIso8601String(),
        "khoiphucmytv": khoiphucmytv,
        "tamngungMytv": tamngungMytv,
      };
}
