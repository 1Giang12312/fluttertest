class ThueBaoKhongPSLLC3 {
    String? tenDvPbh;
    String? tenKvC3;
    int? kopsLlFiber;
    String? timeKey;
    int? kopsLlMyTv;

    ThueBaoKhongPSLLC3({
        this.tenDvPbh,
        this.tenKvC3,
        this.kopsLlFiber,
        this.timeKey,
        this.kopsLlMyTv,
    });

    factory ThueBaoKhongPSLLC3.fromJson(Map<String, dynamic> json) => ThueBaoKhongPSLLC3(
        tenDvPbh: json["tenDV_PBH"],
        tenKvC3: json["tenKV_C3"],
        kopsLlFiber: json["kops_LL_Fiber"],
        timeKey: json["timeKey"],
        kopsLlMyTv: json["kops_LL_MyTv"],
    );

    Map<String, dynamic> toJson() => {
        "tenDV_PBH": tenDvPbh,
        "tenKV_C3": tenKvC3,
        "kops_LL_Fiber": kopsLlFiber,
        "timeKey": timeKey,
        "kops_LL_MyTv": kopsLlMyTv,
    };
}
