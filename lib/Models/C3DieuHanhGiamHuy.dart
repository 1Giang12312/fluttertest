class C3DieuHanhGiamHuy {
    String? tenKvC3;
    int? khuvucC3Id;
    String? timeKey;
    String? tenDvPbh;

    C3DieuHanhGiamHuy({
        this.tenKvC3,
        this.khuvucC3Id,
        this.timeKey,
        this.tenDvPbh,
    });

    factory C3DieuHanhGiamHuy.fromJson(Map<String, dynamic> json) => C3DieuHanhGiamHuy(
        tenKvC3: json["ten_kv_c3"],
        khuvucC3Id: json["khuvuc_c3_id"],
        timeKey: json["timeKey"],
        tenDvPbh: json["ten_dv_pbh"],
    );

    Map<String, dynamic> toJson() => {
        "ten_kv_c3": tenKvC3,
        "khuvuc_c3_id": khuvucC3Id,
        "timeKey": timeKey,
        "ten_dv_pbh": tenDvPbh,
    };
}
