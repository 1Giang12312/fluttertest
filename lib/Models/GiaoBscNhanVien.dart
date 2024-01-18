// ignore_for_file: file_names

class GiaoBscNhanVien{
  late int? nhanviengiao;
  late int? nhanviennhan;
  late int? thang;
  late int? nam;
  late bool? trangthaigiao;
  late bool? trangthainhan;
  late bool? trangthaicham;
  late bool? trangthaidongyKqtd;
  late bool? trangthaiketthuc;
  late String? ngaytao;
  late int? loaimau;
  GiaoBscNhanVien({
    required this.nhanviengiao,
    required this.nhanviennhan,
    required this.thang,
    required this.nam,
    required this.trangthaigiao,
    required this.trangthainhan,
    required this.trangthaicham,
    required this.trangthaidongyKqtd,
    required this.trangthaiketthuc,
    required this.ngaytao,
    required this.loaimau,
  });
    factory GiaoBscNhanVien.fromJson(Map<String,dynamic> json){
    return GiaoBscNhanVien(
      nhanviengiao:json['nhanviengiao'],
      nhanviennhan: json['nhanviennhan'],
      thang: json['thang'],
      nam: json['nam'],
      trangthaigiao: json['trangthaigiao'],
      trangthainhan: json['trangthainhan'],
      trangthaicham: json['trangthaicham'],
      trangthaidongyKqtd: json['trangthaidongyKqtd'],
      trangthaiketthuc: json['trangthaiketthuc'],
      ngaytao: json['ngaytao'],
      loaimau: json['loaimau'],
    );
  }
}