// ignore_for_file: non_constant_identifier_names, file_names
class DonVi{
  late int? donvi_id;
  late String? donvi_ten;
  late String? donvi_mota;
  late String? donvi_ma;
  late int? donvi_loai;
  late int? donvi_map_id;
  late int? thutu_hienthi;
  late int? donvi_pttb;
  late String? donvi_ten_2;

  DonVi({
    required this.donvi_id,
    required this.donvi_ten,
    required this.donvi_mota,
    required this.donvi_ma,
    required this.donvi_loai,
    required this.donvi_map_id,
    required this.thutu_hienthi,
    required this.donvi_pttb,
    required this.donvi_ten_2,
  });
    factory DonVi.fromJson(Map<String,dynamic> json){
    return DonVi(
      donvi_id:json['donviId'],
      donvi_ten: json['donviTen'],
      donvi_mota: json['donviMota'],
      donvi_ma: json['donviMa'],
      donvi_loai: json['donviLoai'],
      donvi_map_id: json['donviMapId'],
      thutu_hienthi: json['thutuHienthi'],
      donvi_pttb: json['donviPttb'],
      donvi_ten_2: json['donviTen2']
    );
  }
}
List<DonVi> dropDownButtonDonVi =[];