class TongHop {
    int? khuvucC3Id;
    String? fiberTamngungThanhly;
    String? fiberNgayCapNhat;
    String? fiberKopsLl;
    String? fiberTyleTamngungThanhly;
    String? fiberTyleKhongPsll;
    String? fiberTyleGiahanDtc;
    String? fiberSoluongBaohong;
    String? fiberTyleBaohong;
    String? mytvTamngungThanhly;
    String? ngaycapnhatMytvc3;
    String? mytvKopsll;
    String? mytvTyleTamngungThanhly;
    String? mytvTyleKhongPsll;
    String? mytvTyleGiahanDtc;
    String? mytvSoluongBaohong;
    String? mytvTyleBaohong;
    String? tongHopTylePhieuHenBaoHong;
    String? fiberXepHangsoLuongTamNgungThanhLy;
    String? fiberXepHangtyLeTamNgungThanhLy;
    String? fiberXepHangsoLuongKhongPsll;
    String? fiberXepHangtyLeKhongPsll;
    String? fiberXepHangTyleGiaHanDtc;
    String? fiberXepHangSoLuongBaoHong;
    String? fiberXepHangTyLeBaoHong;
    String? myTvXepHangsoLuongTamNgungThanhLy;
    String? myTvXepHangtyLeTamNgungThanhLy;
    String? myTvXepHangsoLuongKhongPsll;
    String? myTvXepHangtyLeKhongPsll;
    String? myTvXepHangTyleGiaHanDtc;
    String? myTvXepHangSoLuongBaoHong;
    String? myTvXepHangTyLeBaoHong;
    String? xepHangtongHopTyLePhieuHenBaoHong;
    int? tongC3;

    TongHop({
        this.khuvucC3Id,
        this.fiberTamngungThanhly,
        this.fiberNgayCapNhat,
        this.fiberKopsLl,
        this.fiberTyleTamngungThanhly,
        this.fiberTyleKhongPsll,
        this.fiberTyleGiahanDtc,
        this.fiberSoluongBaohong,
        this.fiberTyleBaohong,
        this.mytvTamngungThanhly,
        this.ngaycapnhatMytvc3,
        this.mytvKopsll,
        this.mytvTyleTamngungThanhly,
        this.mytvTyleKhongPsll,
        this.mytvTyleGiahanDtc,
        this.mytvSoluongBaohong,
        this.mytvTyleBaohong,
        this.tongHopTylePhieuHenBaoHong,
        this.fiberXepHangsoLuongTamNgungThanhLy,
        this.fiberXepHangtyLeTamNgungThanhLy,
        this.fiberXepHangsoLuongKhongPsll,
        this.fiberXepHangtyLeKhongPsll,
        this.fiberXepHangTyleGiaHanDtc,
        this.fiberXepHangSoLuongBaoHong,
        this.fiberXepHangTyLeBaoHong,
        this.myTvXepHangsoLuongTamNgungThanhLy,
        this.myTvXepHangtyLeTamNgungThanhLy,
        this.myTvXepHangsoLuongKhongPsll,
        this.myTvXepHangtyLeKhongPsll,
        this.myTvXepHangTyleGiaHanDtc,
        this.myTvXepHangSoLuongBaoHong,
        this.myTvXepHangTyLeBaoHong,
        this.xepHangtongHopTyLePhieuHenBaoHong,
        this.tongC3,
    });

    factory TongHop.fromJson(Map<String, dynamic> json) => TongHop(
        khuvucC3Id: json["khuvuc_c3_id"],
        fiberTamngungThanhly: json["fiber_tamngung_thanhly"],
        fiberNgayCapNhat: json["fiber_ngay_cap_nhat"],
        fiberKopsLl: json["fiber_kops_ll"],
        fiberTyleTamngungThanhly: json["fiber_tyle_tamngung_thanhly"],
        fiberTyleKhongPsll: json["fiber_tyle_khongPsll"],
        fiberTyleGiahanDtc: json["fiber_tyle_giahan_dtc"],
        fiberSoluongBaohong: json["fiber_soluong_baohong"],
        fiberTyleBaohong: json["fiber_tyle_baohong"],
        mytvTamngungThanhly: json["mytv_tamngung_thanhly"],
        ngaycapnhatMytvc3: json["ngaycapnhatMytvc3"],
        mytvKopsll: json["mytvKopsll"],
        mytvTyleTamngungThanhly: json["mytv_tyle_tamngung_thanhly"],
        mytvTyleKhongPsll: json["mytv_tyle_khongPsll"],
        mytvTyleGiahanDtc: json["mytv_tyle_giahan_dtc"],
        mytvSoluongBaohong: json["mytv_soluong_baohong"],
        mytvTyleBaohong: json["mytv_tyle_baohong"],
        tongHopTylePhieuHenBaoHong: json["tongHopTylePhieuHen_BaoHong"],
        fiberXepHangsoLuongTamNgungThanhLy: json["fiberXepHangsoLuongTamNgungThanhLy"],
        fiberXepHangtyLeTamNgungThanhLy: json["fiberXepHangtyLeTamNgungThanhLy"],
        fiberXepHangsoLuongKhongPsll: json["fiberXepHangsoLuongKhongPsll"],
        fiberXepHangtyLeKhongPsll: json["fiberXepHangtyLeKhongPsll"],
        fiberXepHangTyleGiaHanDtc: json["fiberXepHangTyleGiaHanDTC"],
        fiberXepHangSoLuongBaoHong: json["fiberXepHangSoLuongBaoHong"],
        fiberXepHangTyLeBaoHong: json["fiberXepHangTyLeBaoHong"],
        myTvXepHangsoLuongTamNgungThanhLy: json["myTVXepHangsoLuongTamNgungThanhLy"],
        myTvXepHangtyLeTamNgungThanhLy: json["myTVXepHangtyLeTamNgungThanhLy"],
        myTvXepHangsoLuongKhongPsll: json["myTVXepHangsoLuongKhongPsll"],
        myTvXepHangtyLeKhongPsll: json["myTVXepHangtyLeKhongPsll"],
        myTvXepHangTyleGiaHanDtc: json["myTVXepHangTyleGiaHanDTC"],
        myTvXepHangSoLuongBaoHong: json["myTVXepHangSoLuongBaoHong"],
        myTvXepHangTyLeBaoHong: json["myTVXepHangTyLeBaoHong"],
        xepHangtongHopTyLePhieuHenBaoHong: json["xepHangtongHopTyLePhieuHen_BaoHong"],
        tongC3: json["tongC3"],
    );

    Map<String, dynamic> toJson() => {
        "khuvuc_c3_id": khuvucC3Id,
        "fiber_tamngung_thanhly": fiberTamngungThanhly,
        "fiber_ngay_cap_nhat": fiberNgayCapNhat,
        "fiber_kops_ll": fiberKopsLl,
        "fiber_tyle_tamngung_thanhly": fiberTyleTamngungThanhly,
        "fiber_tyle_khongPsll": fiberTyleKhongPsll,
        "fiber_tyle_giahan_dtc": fiberTyleGiahanDtc,
        "fiber_soluong_baohong": fiberSoluongBaohong,
        "fiber_tyle_baohong": fiberTyleBaohong,
        "mytv_tamngung_thanhly": mytvTamngungThanhly,
        "ngaycapnhatMytvc3": ngaycapnhatMytvc3,
        "mytvKopsll": mytvKopsll,
        "mytv_tyle_tamngung_thanhly": mytvTyleTamngungThanhly,
        "mytv_tyle_khongPsll": mytvTyleKhongPsll,
        "mytv_tyle_giahan_dtc": mytvTyleGiahanDtc,
        "mytv_soluong_baohong": mytvSoluongBaohong,
        "mytv_tyle_baohong": mytvTyleBaohong,
        "tongHopTylePhieuHen_BaoHong": tongHopTylePhieuHenBaoHong,
        "fiberXepHangsoLuongTamNgungThanhLy": fiberXepHangsoLuongTamNgungThanhLy,
        "fiberXepHangtyLeTamNgungThanhLy": fiberXepHangtyLeTamNgungThanhLy,
        "fiberXepHangsoLuongKhongPsll": fiberXepHangsoLuongKhongPsll,
        "fiberXepHangtyLeKhongPsll": fiberXepHangtyLeKhongPsll,
        "fiberXepHangTyleGiaHanDTC": fiberXepHangTyleGiaHanDtc,
        "fiberXepHangSoLuongBaoHong": fiberXepHangSoLuongBaoHong,
        "fiberXepHangTyLeBaoHong": fiberXepHangTyLeBaoHong,
        "myTVXepHangsoLuongTamNgungThanhLy": myTvXepHangsoLuongTamNgungThanhLy,
        "myTVXepHangtyLeTamNgungThanhLy": myTvXepHangtyLeTamNgungThanhLy,
        "myTVXepHangsoLuongKhongPsll": myTvXepHangsoLuongKhongPsll,
        "myTVXepHangtyLeKhongPsll": myTvXepHangtyLeKhongPsll,
        "myTVXepHangTyleGiaHanDTC": myTvXepHangTyleGiaHanDtc,
        "myTVXepHangSoLuongBaoHong": myTvXepHangSoLuongBaoHong,
        "myTVXepHangTyLeBaoHong": myTvXepHangTyLeBaoHong,
        "xepHangtongHopTyLePhieuHen_BaoHong": xepHangtongHopTyLePhieuHenBaoHong,
        "tongC3": tongC3,
    };
}
