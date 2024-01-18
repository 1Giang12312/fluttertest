// ignore_for_file: file_names, non_constant_identifier_names

class NVNhanBSC{
  late int? nhanviengiao;
  late int? nhanviennhan;
  late int? thang;
  late int? nam;
  late int? kpi;
  late int? nhanvienthamdinh;
  late int? donvitinh;
  late int? trongso;
  late double? kehoach;
  late double? thuchien;
  late double? thamdinh;
  late bool? trangthaithamdinh;
  late double? kq_thuchien;
  late double? diem_kpi;
  late double? hethong_thuchien;
  late int? loaimau;
  late int? nhom_kpi;
  late String? ghichu;
  late int? stt;
  late int? donvi;
  late DateTime? thoigian_thamdinh;
  late String? ghichu_thamdinh;
  NVNhanBSC({
    this.nhanviengiao,
    this.nhanviennhan,
    this.thang,
    this.nam,
    this.kpi,
    this.nhanvienthamdinh,
    this.donvitinh,
    this.trongso,
    this.kehoach,
    this.thuchien,
    this.thamdinh,
    this.trangthaithamdinh,
    this.kq_thuchien,
    this.diem_kpi,
    this.hethong_thuchien,
    this.loaimau,
    this.nhom_kpi,
    this.ghichu,
    this.stt,
    this.donvi,
    this.thoigian_thamdinh,
    this.ghichu_thamdinh,
  });
  factory NVNhanBSC.fromJson(Map<String,dynamic> json){
    return NVNhanBSC(
      nhanviengiao: json['nhanviengiao'],
      nhanviennhan: json['nhanviennhan'],
      thang: json['thang'],
      nam: json['nam'],
      kpi: json['kpi'],
      nhanvienthamdinh: json['nhanvienthamdinh'],
      donvitinh:json['donvitinh'],
      trongso:json['trongso'],
      kehoach: double.parse(json['kehoach'].toString()),
      thuchien: double.parse(json['thuchien'].toString()),
      thamdinh: double.parse(json['thamdinh'].toString()),
      trangthaithamdinh: json['trangthaithamdinh'],
      kq_thuchien: json['kqThuchien'] == null ? 0.0 :  double.parse(json['kqThuchien'].toString()),
      diem_kpi:  json['diemKpi'] == null ? 0.0 :  double.parse(json['diemKpi'].toString()),
      hethong_thuchien: json['hethongThuchien'] == null ? 0.0 :  double.parse(json['thamdinh'].toString()),
      loaimau: json['loaimau'],
      nhom_kpi: json['nhomKpi'],
      ghichu: json['ghichu']??'',
      stt: json['stt'],
      donvi: json['donvi'],
      thoigian_thamdinh:json['thoigianThamdinh'] ==null? DateTime(0): DateTime.parse(json['thoigianThamdinh']),
      ghichu_thamdinh: json['ghichuThamdinh'] ?? '',
    );
  }
}