// ignore_for_file: non_constant_identifier_names, file_names

class DonviTinh{
  late int? dvt_id;
  late String? dvt_ten;
  late String? dvt_ghichu;
  DonviTinh({
    required this.dvt_id,
    required this.dvt_ten,
    required this.dvt_ghichu,
  });
    factory DonviTinh.fromJson(Map<String,dynamic> json){
    return DonviTinh(
      dvt_id:json['dvtId'],
      dvt_ten: json['dvtTen'],
      dvt_ghichu: json['dvtGhichu'],
    );
  }
}