// ignore_for_file: non_constant_identifier_names, file_names

class KPI{
  late int? kpi_id;
  late String? kpi_ten;
  late String? kpi_mota;
  late DateTime? kpi_ngaytao;
  late int? kpi_nguoitao;
  late int? kpi_thuoc_kpo;
  late String? kpi_ma;
  late int? nhom_kpi;
  late bool? hienthi;
  late String? ap_dung;

  KPI({
    required this.kpi_id,
    required this.kpi_ten,
    required this.kpi_mota,
    required this.kpi_ngaytao,
    required this.kpi_nguoitao,
    required this.kpi_thuoc_kpo,
    required this.kpi_ma,
    required this.nhom_kpi,
    required this.hienthi,
    required this.ap_dung,
  });
    factory KPI.fromJson(Map<String,dynamic> json){
    return KPI(
      kpi_id:json['kpiId'],
      kpi_ten: json['kpiTen'],
      kpi_mota: json['kpiMota'] ?? '',
      kpi_ngaytao:json['kpiNgayTao']==null ? DateTime(0): DateTime.parse(json['kpiNgaytao']),
      kpi_nguoitao: json['kpiNguoitao'],
      kpi_thuoc_kpo: json['kpiThuocKpo'],
      kpi_ma: json['kpiMa'],
      nhom_kpi: json['nhomKpi'],
      hienthi: json['hienthi'],
      ap_dung: json['appDung']==null?'': json['apDung']
    );
  }
}