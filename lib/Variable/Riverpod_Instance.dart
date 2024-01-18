import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';

class riverpod_instance {
  //theo tên
  static var selectedTenDonVi11Pbh = StateProvider<dynamic>((ref) => null);
  static var selectedTenDonVi11PbhVaPbcn =
      StateProvider<dynamic>((ref) => null);
  static var selectedTenDonViTatCa = StateProvider<dynamic>((ref) => null);
  //theo id
  static var selectedIdDonVi11Pbh = StateProvider<dynamic>((ref) => null);
  static var selectedIdDonVi11PbhVaPbcn = StateProvider<dynamic>((ref) => null);
  static var selectedIdDonViTatCa = StateProvider<dynamic>((ref) => null);
  //theo tên mô tả
  static var selectedTenMoTa11Pbh = StateProvider<dynamic>((ref) => null);

  //month year picker variable

  static var selectedDateMonthYearPicker =
      StateProvider<dynamic>((ref) => null);
  static var selectedMonthMonthYearPicker = StateProvider<String>(
      (ref) => convertMonth(DateTime.now().month).toString());
  static var selectedYearMonthYearPicker =
      StateProvider<String>((ref) => DateTime.now().year.toString());
}
