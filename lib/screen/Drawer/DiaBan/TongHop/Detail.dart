import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/Coverter.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/TongHop/Logic.dart';

class TongHop_Detail extends StatefulWidget {
  TongHop_Detail(
      {super.key,
      required this.timeKey,
      required this.tenKhuVucC3,
      required this.kvC3id});
  String timeKey;
  String tenKhuVucC3;
  int kvC3id;
  @override
  State<TongHop_Detail> createState() => _TongHop_DetailState();
}

class _TongHop_DetailState extends State<TongHop_Detail> {
  Future<void> refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(
        title: "Chi tiết địa bàn ${widget.tenKhuVucC3}",
      ),
      body: RefreshIndicator(
          onRefresh: refresh,
          child: FutureBuilder(
              future: checkLocalConnectionApi(),
              builder: ((context, snapshot) {
                if (snapshot.data != null &&
                    snapshot.connectionState != ConnectionState.waiting) {
                  return FutureBuilder(
                      future: getDetailTonngHop(
                          snapshot.data, widget.timeKey, widget.kvC3id),
                      builder: (context, snapshot1) {
                        return Custom_FutureBuilder(
                            snapshot: snapshot1,
                            contextParam: context,
                            widgetParam: snapshot1.hasData
                                ? SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Column(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'Báo cáo tháng ',
                                              style: const TextStyle(
                                                  fontSize: 16,color: Colors.black),
                                              // Phong cách văn bản mặc định
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: timeKeyToMonthYear(
                                                      widget.timeKey
                                                          .toString()),
                                                  style: const TextStyle(
                                                    color: Colors
                                                        .red, // Màu sắc bạn muốn áp dụng
                                                    fontWeight: FontWeight
                                                        .bold, // Các thuộc tính văn bản khác
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          DividerCusTom(
                                            title: "Tổng MyTV và BRCĐ ",
                                          ),
                                          // Custom_Data_Rows_Color_TongHop(
                                          //     indexCount: false,
                                          //     title: '- Số lượng báo hỏng: ',
                                          //     data:
                                          //         "${snapshot1.data!.tongHopSoLuongBaoHong} (Xếp hạng ${snapshot1.data!.xepHangTongHopSoLuongBaoHong})"),
                                          // Custom_Data_Rows_Color_TongHop(
                                          //     indexCount: true,
                                          //     title: '- Tỉ lệ báo hỏng: ',
                                          //     data:
                                          //         "${snapshot1.data!.tongHopTyLeBaoHong} (Xếp hạng ${snapshot1.data!.xepHangtongHoptyLeBaoHong})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: false,
                                              title:
                                                  '- Tỉ lệ phiếu hẹn/ báo hỏng: ',
                                              data:
                                                  "${snapshot1.data!.tongHopTylePhieuHenBaoHong} (Xếp hạng ${snapshot1.data!.xepHangtongHopTyLePhieuHenBaoHong})"),
                                          DividerCusTom(
                                            title: "BRCĐ",
                                          ),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: false,
                                              title:
                                                  '- Số lượng tạm ngưng, thanh lý: ',
                                              data:
                                                  "${snapshot1.data!.fiberTamngungThanhly} (Xếp hạng ${snapshot1.data!.fiberXepHangsoLuongTamNgungThanhLy})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: true,
                                              title:
                                                  '- Tỷ lệ tạm ngưng, thanh lý: ',
                                              data:
                                                  "${snapshot1.data!.fiberTyleTamngungThanhly} (Xếp hạng ${snapshot1.data!.fiberXepHangtyLeTamNgungThanhLy})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: false,
                                              title: '- Số lượng không PSLL: ',
                                              data:
                                                  "${snapshot1.data!.fiberKopsLl} (Xếp hạng ${snapshot1.data!.fiberXepHangsoLuongKhongPsll})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: true,
                                              title: '- Tỉ lệ không PSLL: ',
                                              data:
                                                  "${snapshot1.data!.fiberTyleKhongPsll} (Xếp hạng ${snapshot1.data!.fiberXepHangtyLeKhongPsll})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: false,
                                              title: '- Tỉ lệ gia hạn ĐTC: ',
                                              data:
                                                  "${snapshot1.data!.fiberTyleGiahanDtc} (Xếp hạng ${snapshot1.data!.fiberXepHangTyleGiaHanDtc})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: true,
                                              title: '- Số lượng báo hỏng: ',
                                              data:
                                                  "${snapshot1.data!.fiberSoluongBaohong} (Xếp hạng ${snapshot1.data!.fiberXepHangSoLuongBaoHong})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: false,
                                              title: '- Tỷ lệ báo hỏng: ',
                                              data:
                                                  "${snapshot1.data!.fiberTyleBaohong} (Xếp hạng ${snapshot1.data!.fiberXepHangTyLeBaoHong})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: true,
                                              title: '- Ngày lấy dữ liệu: ',
                                              data:
                                                  "${snapshot1.data!.fiberNgayCapNhat} "),
                                          DividerCusTom(
                                            title: "MyTV",
                                          ),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: false,
                                              title:
                                                  '- Số lượng tạm ngưng, thanh lý: ',
                                              data:
                                                  "${snapshot1.data!.mytvTamngungThanhly} (Xếp hạng ${snapshot1.data!.myTvXepHangsoLuongTamNgungThanhLy})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: true,
                                              title:
                                                  '- Tỷ lệ tạm ngưng, thanh lý: ',
                                              data:
                                                  "${snapshot1.data!.mytvTyleTamngungThanhly} (Xếp hạng ${snapshot1.data!.myTvXepHangtyLeTamNgungThanhLy})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: false,
                                              title: '- Số lượng không PSLL: ',
                                              data:
                                                  "${snapshot1.data!.mytvKopsll} (Xếp hạng ${snapshot1.data!.myTvXepHangsoLuongKhongPsll})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: true,
                                              title: '- Tỉ lệ không PSLL: ',
                                              data:
                                                  "${snapshot1.data!.mytvTyleKhongPsll} (Xếp hạng ${snapshot1.data!.myTvXepHangtyLeKhongPsll})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: false,
                                              title: '- Tỉ lệ gia hạn ĐTC: ',
                                              data:
                                                  "${snapshot1.data!.mytvTyleGiahanDtc} (Xếp hạng ${snapshot1.data!.myTvXepHangTyleGiaHanDtc})"),

                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: true,
                                              title: '- Số lượng báo hỏng: ',
                                              data:
                                                  "${snapshot1.data!.mytvSoluongBaohong} (Xếp hạng ${snapshot1.data!.myTvXepHangSoLuongBaoHong})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: false,
                                              title: '- Tỷ lệ báo hỏng: ',
                                              data:
                                                  "${snapshot1.data!.mytvTyleBaohong} (Xếp hạng ${snapshot1.data!.myTvXepHangTyLeBaoHong})"),
                                          Custom_Data_Rows_Color_TongHop(
                                              indexCount: true,
                                              title: '- Ngày lấy dữ liệu: ',
                                              data:
                                                  "${snapshot1.data!.ngaycapnhatMytvc3} "),
                                        ],
                                      ),
                                    ),
                                  )
                                : Text("lỗi khi xác thực"));
                      });
                } else {
                  return LoadingScreen(
                      nameOfLoadingScreen: "Đang kiểm tra mạng...");
                }
              }))),
    );
  }
}

class DividerCusTom extends StatelessWidget {
  DividerCusTom({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class Custom_Data_Rows_Color_TongHop extends StatelessWidget {
  Custom_Data_Rows_Color_TongHop(
      {required this.indexCount, required this.title, required this.data});
  String title;
  dynamic data;
  bool indexCount;
  @override
  Widget build(BuildContext context) {
    Color color_temp_light;
    Color color_temp_dark;
    indexCount == true
        ? color_temp_light = Card_colors_1
        : color_temp_light = Card_colors_2;
    indexCount == true
        ? color_temp_dark = Card_colors_dark_1
        : color_temp_dark = Card_colors_dark_2;
    return Container(
        color: isDarkMode ? color_temp_dark : color_temp_light,
        // alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 20,
              child: SizedBox(
                child: Text(title),
              ),
            ),
            Expanded(
              flex: 20,
              child: SizedBox(
                child: Text(data.toString()),
              ),
            ),
          ],
        ));
  }
}
