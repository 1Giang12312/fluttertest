// class TamDungThanhLyPtm {
//     int? khuvucC3Id;
//     String? tenDv;
//     int? ptmDungthuFiber;
//     int? ptmDungthatFiber;
//     int? ptmKinhdoanhFiber;
//     int? ptmKythuatFiber;
//     int? ptmFiberMk;
//     int? ptmDungthuMytv;
//     int? ptmDungthatMytv;
//     int? ptmKinhdoanhMytv;
//     int? ptmKythuatMytv;
//     int? ptmMytvMk;
//     dynamic ptmMytvFiberHh;
//     dynamic ptmMytvFiberPtm;
//     int? khoiphucFiber;
//     int? khoiphucMytv;
//     int? ptmMesh;
//     int? ptmCamera;
//     String? timeKey;
//     DateTime? ngayCapNhat;
//     int? fiberTamdung;
//     int? fiberThanhly;
//     int? mytvTamdung;
//     int? mytvThanhly;
//     int? meshTamdung;
//     int? meshThanhly;
//     int? codinhTamdung;
//     int? codinhThanhly;
//     String? timeKey2;
//     DateTime? ngayCapNhat2;

//     TamDungThanhLyPtm({
//         this.khuvucC3Id,
//         this.tenDv,
//         this.ptmDungthuFiber,
//         this.ptmDungthatFiber,
//         this.ptmKinhdoanhFiber,
//         this.ptmKythuatFiber,
//         this.ptmFiberMk,
//         this.ptmDungthuMytv,
//         this.ptmDungthatMytv,
//         this.ptmKinhdoanhMytv,
//         this.ptmKythuatMytv,
//         this.ptmMytvMk,
//         this.ptmMytvFiberHh,
//         this.ptmMytvFiberPtm,
//         this.khoiphucFiber,
//         this.khoiphucMytv,
//         this.ptmMesh,
//         this.ptmCamera,
//         this.timeKey,
//         this.ngayCapNhat,
//         this.fiberTamdung,
//         this.fiberThanhly,
//         this.mytvTamdung,
//         this.mytvThanhly,
//         this.meshTamdung,
//         this.meshThanhly,
//         this.codinhTamdung,
//         this.codinhThanhly,
//         this.timeKey2,
//         this.ngayCapNhat2,
//     });

//     factory TamDungThanhLyPtm.fromJson(Map<String, dynamic> json) => TamDungThanhLyPtm(
//         khuvucC3Id: json["khuvuc_c3_id"],
//         tenDv: json["ten_dv"],
//         ptmDungthuFiber: json["ptm_dungthu_fiber"],
//         ptmDungthatFiber: json["ptm_dungthat_fiber"],
//         ptmKinhdoanhFiber: json["ptm_kinhdoanh_fiber"],
//         ptmKythuatFiber: json["ptm_kythuat_fiber"],
//         ptmFiberMk: json["ptm_fiber_mk"],
//         ptmDungthuMytv: json["ptm_dungthu_mytv"],
//         ptmDungthatMytv: json["ptm_dungthat_mytv"],
//         ptmKinhdoanhMytv: json["ptm_kinhdoanh_mytv"],
//         ptmKythuatMytv: json["ptm_kythuat_mytv"],
//         ptmMytvMk: json["ptm_mytv_mk"],
//         ptmMytvFiberHh: json["ptm_mytv_fiber_hh"],
//         ptmMytvFiberPtm: json["ptm_mytv_fiber_ptm"],
//         khoiphucFiber: json["khoiphuc_fiber"],
//         khoiphucMytv: json["khoiphuc_mytv"],
//         ptmMesh: json["ptm_mesh"],
//         ptmCamera: json["ptm_camera"],
//         timeKey: json["timeKey"],
//         ngayCapNhat: json["ngay_cap_nhat"] == null ? null : DateTime.parse(json["ngay_cap_nhat"]),
//         fiberTamdung: json["fiber_tamdung"],
//         fiberThanhly: json["fiber_thanhly"],
//         mytvTamdung: json["mytv_tamdung"],
//         mytvThanhly: json["mytv_thanhly"],
//         meshTamdung: json["mesh_tamdung"],
//         meshThanhly: json["mesh_thanhly"],
//         codinhTamdung: json["codinh_tamdung"],
//         codinhThanhly: json["codinh_thanhly"],
//         timeKey2: json["timeKey2"],
//         ngayCapNhat2: json["ngay_cap_nhat2"] == null ? null : DateTime.parse(json["ngay_cap_nhat2"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "khuvuc_c3_id": khuvucC3Id,
//         "ten_dv": tenDv,
//         "ptm_dungthu_fiber": ptmDungthuFiber,
//         "ptm_dungthat_fiber": ptmDungthatFiber,
//         "ptm_kinhdoanh_fiber": ptmKinhdoanhFiber,
//         "ptm_kythuat_fiber": ptmKythuatFiber,
//         "ptm_fiber_mk": ptmFiberMk,
//         "ptm_dungthu_mytv": ptmDungthuMytv,
//         "ptm_dungthat_mytv": ptmDungthatMytv,
//         "ptm_kinhdoanh_mytv": ptmKinhdoanhMytv,
//         "ptm_kythuat_mytv": ptmKythuatMytv,
//         "ptm_mytv_mk": ptmMytvMk,
//         "ptm_mytv_fiber_hh": ptmMytvFiberHh,
//         "ptm_mytv_fiber_ptm": ptmMytvFiberPtm,
//         "khoiphuc_fiber": khoiphucFiber,
//         "khoiphuc_mytv": khoiphucMytv,
//         "ptm_mesh": ptmMesh,
//         "ptm_camera": ptmCamera,
//         "timeKey": timeKey,
//         "ngay_cap_nhat": ngayCapNhat?.toIso8601String(),
//         "fiber_tamdung": fiberTamdung,
//         "fiber_thanhly": fiberThanhly,
//         "mytv_tamdung": mytvTamdung,
//         "mytv_thanhly": mytvThanhly,
//         "mesh_tamdung": meshTamdung,
//         "mesh_thanhly": meshThanhly,
//         "codinh_tamdung": codinhTamdung,
//         "codinh_thanhly": codinhThanhly,
//         "timeKey2": timeKey2,
//         "ngay_cap_nhat2": ngayCapNhat2?.toIso8601String(),
//     };
// }
