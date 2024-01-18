// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:core';

class NhomKpis {
  late int? id;
  late String? ten_nhom;
  late int? loaimaubsc_id;
  late int? tytrong;
  late int? hienthi;
  late int? thutuhienthi;
  NhomKpis({
    this.id,
    this.ten_nhom,
    this.loaimaubsc_id,
    this.tytrong,
    this.hienthi,
    this.thutuhienthi,
  });
  factory NhomKpis.fromJson(Map<String, dynamic> json) {
    return NhomKpis(
      id: json['id'],
      ten_nhom: json['tenNhom'],
      loaimaubsc_id: json['loaimaubscId'],
      tytrong: json['tytrong'],
      hienthi: json['hienthi'],
      thutuhienthi: json['thutuhienthi'],
    );
  }
}
