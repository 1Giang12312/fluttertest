import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vnptapp/Models/LuongBanTheNapThe.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/ThongKeBaoCao/ThuLaoBanTheNapThe/Route.dart';
import 'package:vnptapp/screen/Drawer/ThongKeBaoCao/ThuLaoBanTheNapThe/Variable.dart';

Future<List<LuongBanTheNapThe>> getListLuongBanNapThe(
    int pageNumber,
    int pageSize,
    String? nam,
    String? thang,
    String? maNV,
    var donViID,
    int? chucDanh,
    int? nhanVienDonViId,
    String? keyword,
    String subUrlApi) async {
  var responseStatus = '';
  http.Response response;
  String url = subUrlApi + ThuLaoBanTheNapThe_Route.getList;
  try {
    url =
        '$url?PageNumber=$pageNumber&PageSize=$pageSize&nam=$nam&thang=$thang&manv=$maNV&donViID=$donViID&chucDanh=$chucDanh&nhanVienDonViID=$nhanVienDonViId&keyword=$keyword';
    response = await http.get(Uri.parse(url), headers: requestHeader);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      ThuLaoBanTheNapThe_Variable.totalPages =
          json.decode(response.body)['totalPages'];
     ThuLaoBanTheNapThe_Variable.totalRecord =
          json.decode(response.body)['totalRecords'];
      return jsonResponse
          .map((data) => LuongBanTheNapThe.fromJson(data))
          .toList();
    } else if (response.reasonPhrase == "Unauthorized") {
      responseStatus = "Unauthorized";
      throw Exception('Unauthorized');
    } else {
      throw Exception('Không thể load lượng bán và nạp thẻ');
    }
  } catch (e) {
    if (responseStatus == 'Unauthorized') {
      throw Exception('Unauthorized');
    }
    // print(e);
    throw Exception('Không thể load lượng bán và nạp thẻ');
  }
}
