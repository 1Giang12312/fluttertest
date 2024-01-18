
class ThueBaoKHongPsllC2 {
    String? tenDvPbh;
    String? timekey;
    int? kopsLlFiber;
    int? kopsLlMyTv;

    ThueBaoKHongPsllC2({
        this.tenDvPbh,
        this.timekey,
        this.kopsLlFiber,
        this.kopsLlMyTv,
    });

    factory ThueBaoKHongPsllC2.fromJson(Map<String, dynamic> json) => ThueBaoKHongPsllC2(
        tenDvPbh: json["tenDV_PBH"],
        timekey: json["timekey"],
        kopsLlFiber: json["kops_LL_Fiber"],
        kopsLlMyTv: json["kops_LL_MyTV"],
    );

    Map<String, dynamic> toJson() => {
        "tenDV_PBH": tenDvPbh,
        "timekey": timekey,
        "kops_LL_Fiber": kopsLlFiber,
        "kops_LL_MyTV": kopsLlMyTv,
    };
}
