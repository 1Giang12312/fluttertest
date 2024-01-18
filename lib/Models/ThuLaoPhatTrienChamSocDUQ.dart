// ignore_for_file: file_names

class ThuLaoPhatTrienChamSocDuq {
  String? timekey;
  String? donvi;
  int? donviId;
  String? nhanvienHoten;
  String? nhanvienChucdanh;
  String? nhanvienSmcs;
  int? soluongDuq;
  int? soluongDuqPtmDkg;
  double? tileDuqPtmDkg;
  double? thulaoDuqPtmDkg;
  int? dktttb0509;
  int? dktttb1019;
  int? dktttb2039;
  int? dktttb40;
  double? thulaoDktttb;
  int? ptmCoGoi;
  double? thulaoPtmCoGoi;
  int? bangoiSlDuq;
  int? bangoiSlThuebao;
  double? bangoiDoanhThu;
  double? bangoiThulao;
  double? tongThuLao;

  ThuLaoPhatTrienChamSocDuq({
    this.timekey,
    this.donvi,
    this.donviId,
    this.nhanvienHoten,
    this.nhanvienChucdanh,
    this.nhanvienSmcs,
    this.soluongDuq,
    this.soluongDuqPtmDkg,
    this.tileDuqPtmDkg,
    this.thulaoDuqPtmDkg,
    this.dktttb0509,
    this.dktttb1019,
    this.dktttb2039,
    this.dktttb40,
    this.thulaoDktttb,
    this.ptmCoGoi,
    this.thulaoPtmCoGoi,
    this.bangoiSlDuq,
    this.bangoiSlThuebao,
    this.bangoiDoanhThu,
    this.bangoiThulao,
    this.tongThuLao,
  });

  factory ThuLaoPhatTrienChamSocDuq.fromJson(Map<String, dynamic> json) =>
      ThuLaoPhatTrienChamSocDuq(
          timekey: json["timekey"],
          donvi: json["donvi"],
          donviId: json["donviId"],
          nhanvienHoten: json["nhanvienHoten"],
          nhanvienChucdanh: json["nhanvienChucdanh"],
          nhanvienSmcs: json["nhanvienSmcs"],
          soluongDuq: json["soluongDuq"],
          soluongDuqPtmDkg: json["soluongDuqPtmDkg"],
          tileDuqPtmDkg: json["tileDuqPtmDkg"] == null
              ? 0.0
              : json["tileDuqPtmDkg"].toDouble(),
          thulaoDuqPtmDkg: json["thulaoDuqPtmDkg"] == null
              ? 0.0
              : json["thulaoDuqPtmDkg"].toDouble(),
          dktttb0509: json["dktttb0509"],
          dktttb1019: json["dktttb1019"],
          dktttb2039: json["dktttb2039"],
          dktttb40: json["dktttb40"],
          thulaoDktttb: json["thulaoDktttb"] == null
              ? 0.0
              : json["thulaoDktttb"].toDouble(),
          ptmCoGoi: json["ptmCoGoi"],
          thulaoPtmCoGoi: json["thulaoPtmCoGoi"] == null
              ? 0.0
              : json["thulaoPtmCoGoi"].toDouble(),
          bangoiSlDuq: json["bangoiSlDuq"],
          bangoiSlThuebao: json["bangoiSlThuebao"],
          bangoiDoanhThu: json["bangoiDoanhThu"] == null
              ? 0.0
              : json["bangoiDoanhThu"].toDouble(),
          bangoiThulao: json["bangoiThulao"] == null
              ? 0.0
              : json["bangoiThulao"].toDouble(),
          tongThuLao:
              json["tongThuLao"] == null ? 0.0 : json["tongThuLao"].toDouble());

  Map<String, dynamic> toJson() => {
        "timekey": timekey,
        "donvi": donvi,
        "donviId": donviId,
        "nhanvienHoten": nhanvienHoten,
        "nhanvienChucdanh": nhanvienChucdanh,
        "nhanvienSmcs": nhanvienSmcs,
        "soluongDuq": soluongDuq,
        "soluongDuqPtmDkg": soluongDuqPtmDkg,
        "tileDuqPtmDkg": tileDuqPtmDkg,
        "thulaoDuqPtmDkg": thulaoDuqPtmDkg,
        "dktttb0509": dktttb0509,
        "dktttb1019": dktttb1019,
        "dktttb2039": dktttb2039,
        "dktttb40": dktttb40,
        "thulaoDktttb": thulaoDktttb,
        "ptmCoGoi": ptmCoGoi,
        "thulaoPtmCoGoi": thulaoPtmCoGoi,
        "bangoiSlDuq": bangoiSlDuq,
        "bangoiSlThuebao": bangoiSlThuebao,
        "bangoiDoanhThu": bangoiDoanhThu,
        "bangoiThulao": bangoiThulao,
        "tongThuLao": tongThuLao,
      };
}
