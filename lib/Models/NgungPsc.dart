// class NgungPsc {
//     int? khuvucC3Id;
//     int? ptmFiber;
//     int? pscFiber;
//     int? ttFiber;
//     int? thanhlyFiber;
//     int? ngungPscFiber;
//     int? ptmMytvBox;
//     int? pscMytvBox;
//     int? ttMytvBox;
//     int? thanhlyMytvbox;
//     int? ngungPscMytvBox;
//     int? ptmMytvApp;
//     int? pscMytvApp;
//     int? ttMytvApp;
//     int? thanhlyMytvapp;
//     int? ngungPscMytvApp;
//     int? ptmMytvTong;
//     int? pscMytvTong;
//     int? ttMytvTong;
//     int? thanhlyMytv;
//     int? ngungPscMytvTong;
//     String? timeKey;
//     DateTime? ngayCapNhat;

//     NgungPsc({
//         this.khuvucC3Id,
//         this.ptmFiber,
//         this.pscFiber,
//         this.ttFiber,
//         this.thanhlyFiber,
//         this.ngungPscFiber,
//         this.ptmMytvBox,
//         this.pscMytvBox,
//         this.ttMytvBox,
//         this.thanhlyMytvbox,
//         this.ngungPscMytvBox,
//         this.ptmMytvApp,
//         this.pscMytvApp,
//         this.ttMytvApp,
//         this.thanhlyMytvapp,
//         this.ngungPscMytvApp,
//         this.ptmMytvTong,
//         this.pscMytvTong,
//         this.ttMytvTong,
//         this.thanhlyMytv,
//         this.ngungPscMytvTong,
//         this.timeKey,
//         this.ngayCapNhat,
//     });

//     factory NgungPsc.fromJson(Map<String, dynamic> json) => NgungPsc(
//         khuvucC3Id: json["khuvuc_c3_id"],
//         ptmFiber: json["ptm_fiber"],
//         pscFiber: json["psc_fiber"],
//         ttFiber: json["tt_fiber"],
//         thanhlyFiber: json["thanhly_fiber"],
//         ngungPscFiber: json["ngung_psc_fiber"],
//         ptmMytvBox: json["ptm_mytv_box"],
//         pscMytvBox: json["psc_mytv_box"],
//         ttMytvBox: json["tt_mytv_box"],
//         thanhlyMytvbox: json["thanhly_mytvbox"],
//         ngungPscMytvBox: json["ngung_psc_mytv_box"],
//         ptmMytvApp: json["ptm_mytv_app"],
//         pscMytvApp: json["psc_mytv_app"],
//         ttMytvApp: json["tt_mytv_app"],
//         thanhlyMytvapp: json["thanhly_mytvapp"],
//         ngungPscMytvApp: json["ngung_psc_mytv_app"],
//         ptmMytvTong: json["ptm_mytv_tong"],
//         pscMytvTong: json["psc_mytv_tong"],
//         ttMytvTong: json["tt_mytv_tong"],
//         thanhlyMytv: json["thanhly_mytv"],
//         ngungPscMytvTong: json["ngung_psc_mytv_tong"],
//         timeKey: json["timeKey"],
//         ngayCapNhat: json["ngay_cap_nhat"] == null ? null : DateTime.parse(json["ngay_cap_nhat"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "khuvuc_c3_id": khuvucC3Id,
//         "ptm_fiber": ptmFiber,
//         "psc_fiber": pscFiber,
//         "tt_fiber": ttFiber,
//         "thanhly_fiber": thanhlyFiber,
//         "ngung_psc_fiber": ngungPscFiber,
//         "ptm_mytv_box": ptmMytvBox,
//         "psc_mytv_box": pscMytvBox,
//         "tt_mytv_box": ttMytvBox,
//         "thanhly_mytvbox": thanhlyMytvbox,
//         "ngung_psc_mytv_box": ngungPscMytvBox,
//         "ptm_mytv_app": ptmMytvApp,
//         "psc_mytv_app": pscMytvApp,
//         "tt_mytv_app": ttMytvApp,
//         "thanhly_mytvapp": thanhlyMytvapp,
//         "ngung_psc_mytv_app": ngungPscMytvApp,
//         "ptm_mytv_tong": ptmMytvTong,
//         "psc_mytv_tong": pscMytvTong,
//         "tt_mytv_tong": ttMytvTong,
//         "thanhly_mytv": thanhlyMytv,
//         "ngung_psc_mytv_tong": ngungPscMytvTong,
//         "timeKey": timeKey,
//         "ngay_cap_nhat": ngayCapNhat?.toIso8601String(),
//     };
// }
