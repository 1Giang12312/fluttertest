// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_Data_Rows_Color.dart';
import 'package:vnptapp/Components/Custom_RichText.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/AutoHoTroNghiepVu/Logic.dart';

class AutoHoTroNghiepVu_Detail extends StatelessWidget {
  String getGoiDangDung(String goiCuocDangKy, String thoiGianHetHanCK,
      String loaiCK, String package_name) {
    DateTime now = DateTime.now();
    if (goiCuocDangKy == '' && package_name == '') {
      return '';
    } else {
      if (goiCuocDangKy != '' && thoiGianHetHanCK != '') {
        String formattedDateString = thoiGianHetHanCK.replaceAll("/", "-");
        if (now.isBefore(DateTime.parse(formattedDateString))) {
          //now đứng trước là còn hạn
          return '$goiCuocDangKy $loaiCK';
        } else {
          return '$goiCuocDangKy (Đã hết gói)';
        }
      } else {
        return package_name;
      }
    }
  }

  AutoHoTroNghiepVu_Detail({super.key, required this.id});
  int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(title: 'Kết quả xử lý'),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: FutureBuilder(
              future: checkLocalConnectionApi(),
              builder: (context, snapshot1) {
                if (snapshot1.data == null) {
                  return LoadingScreen(
                    nameOfLoadingScreen: 'Đang tải dữ liệu',
                  );
                } else {
                  return FutureBuilder(
                    future: getHoTroNghiepVuByID(id, snapshot1.data!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.none) {
                        return const Text('Không có kết nối mạng!');
                      } else if (snapshot.hasError) {
                        return Text('Có lỗi xảy ra: ${snapshot.error}');
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return LoadingScreen(
                          nameOfLoadingScreen: 'Đang tải dữ liệu',
                        );
                      } else {
                        return snapshot.data?.loaiYc == 'TRACUU-TTTB'
                            ?
                            //bảng bự
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Custom_Data_Rows_Color(
                                    indexCount: true,
                                    widget: Detail_Rows(
                                        title: 'Số điện thoại',
                                        data: '0${snapshot.data!.sdt}'),
                                  ),
                                  Custom_Data_Rows_Color(
                                    indexCount: false,
                                    widget: Detail_Rows(
                                        title: 'Loại TB:',
                                        data: '${snapshot.data!.loaiTb}'),
                                  ),
                                  Custom_Data_Rows_Color(
                                    indexCount: true,
                                    widget: Detail_Rows(
                                        title: 'Ngày KH: ',
                                        data: '${snapshot.data!.ngayKh}'),
                                  ),
                                  Custom_Data_Rows_Color(
                                    indexCount: false,
                                    widget: Detail_Rows(
                                        title: 'Gọi đi ',
                                        data: snapshot.data!.goiDi == 'true'
                                            ? 'Có'
                                            : 'Không'),
                                  ),
                                  Custom_Data_Rows_Color(
                                    indexCount: true,
                                    widget: Detail_Rows(
                                        title: 'Số dư TKC: ',
                                        data: '${snapshot.data!.soDu}'),
                                  ),
                                  Custom_Data_Rows_Color(
                                    indexCount: false,
                                    widget: Detail_Rows(
                                        title: 'Gói đang dùng : ',
                                        data: snapshot.data!.goiCuocDk != '' &&
                                                snapshot.data!.packageName != ''
                                            ? getGoiDangDung(
                                                snapshot.data!.goiCuocDk!,
                                                snapshot
                                                    .data!.thoiGianHetHanCk!,
                                                snapshot.data!.loaiChuKy!,
                                                snapshot.data!.packageName!)
                                            : 'Không có'),
                                  ),
                                  Custom_Data_Rows_Color(
                                    indexCount: true,
                                    widget: Detail_Rows(
                                        title: 'Seri: ',
                                        data: '${snapshot.data!.seri}'),
                                  ),
                                  Custom_Data_Rows_Color(
                                    indexCount: false,
                                    widget: Detail_Rows(
                                        title: 'Loại sim: ',
                                        data: '${snapshot.data!.loaiSim}'),
                                  ),
                                  Custom_Data_Rows_Color(
                                    indexCount: true,
                                    widget:  Detail_Rows(
                                      title: 'Ngày hết hạn: ',
                                      data: '${snapshot.data!.hanSuDung}'),
                                 
                                  ),
                                  Custom_Data_Rows_Color(
                                    indexCount: false,
                                    widget:    Detail_Rows(
                                      title: 'Gọi đến: ',
                                      data: snapshot.data!.goiDen == 'true'
                                          ? 'Có'
                                          : ' Không'),
                               
                                  ),
                                  Custom_Data_Rows_Color(
                                    indexCount: true,
                                    widget:  Detail_Rows(
                                      title: 'Thời gian bắt đầu dk gói: ',
                                      data: snapshot.data!.dangKyLanDau
                                                  .toString() !=
                                              ''
                                          ? '${snapshot.data?.dangKyLanDau.toString()}'
                                          : ' Không'),
                                
                                  ),
                                  Custom_Data_Rows_Color(
                                    indexCount: false,
                                    widget: Detail_Rows(
                                      title: 'Chu kì gia hạn: ',
                                      data: ' ${snapshot.data!.longNumCycle}'),
                                  ),
                                  // Detail_Rows(
                                  //     title: 'Số điện thoại',
                                  //     data: '0${snapshot.data!.sdt}'),
                                  // const Divider(),
                                  // Detail_Rows(
                                  //     title: 'Loại TB:',
                                  //     data: '${snapshot.data!.loaiTb}'),
                                  // const Divider(),
                                  // Detail_Rows(
                                  //     title: 'Ngày KH: ',
                                  //     data: '${snapshot.data!.ngayKh}'),
                                  // const Divider(),
                                  // Detail_Rows(
                                  //     title: 'Gọi đi ',
                                  //     data: snapshot.data!.goiDi == 'true'
                                  //         ? 'Có'
                                  //         : 'Không'),
                                  // const Divider(),
                                  // Detail_Rows(
                                  //     title: 'Số dư TKC: ',
                                  //     data: '${snapshot.data!.soDu}'),
                                  // const Divider(),
                                  // Detail_Rows(
                                  //     title: 'Gói đang dùng : ',
                                  //     data: snapshot.data!.goiCuocDk != '' &&
                                  //             snapshot.data!.packageName != ''
                                  //         ? getGoiDangDung(
                                  //             snapshot.data!.goiCuocDk!,
                                  //             snapshot.data!.thoiGianHetHanCk!,
                                  //             snapshot.data!.loaiChuKy!,
                                  //             snapshot.data!.packageName!)
                                  //         : 'Không có'),
                                  // const Divider(),
                                  // Detail_Rows(
                                  //     title: 'Seri: ',
                                  //     data: '${snapshot.data!.seri}'),
                                  // const Divider(),
                                  // Detail_Rows(
                                  //     title: 'Loại sim: ',
                                  //     data: '${snapshot.data!.loaiSim}'),
                                  // const Divider(),
                                  // Detail_Rows(
                                  //     title: 'Ngày hết hạn: ',
                                  //     data: '${snapshot.data!.hanSuDung}'),
                                  // const Divider(),
                                  // Detail_Rows(
                                  //     title: 'Gọi đến: ',
                                  //     data: snapshot.data!.goiDen == 'true'
                                  //         ? 'Có'
                                  //         : ' Không'),
                                  // const Divider(),
                                  // Detail_Rows(
                                  //     title: 'Thời gian bắt đầu dk gói: ',
                                  //     data: snapshot.data!.dangKyLanDau
                                  //                 .toString() !=
                                  //             ''
                                  //         ? '${snapshot.data?.dangKyLanDau.toString()}'
                                  //         : ' Không'),
                                  // const Divider(),
                                  // Detail_Rows(
                                  //     title: 'Chu kì gia hạn: ',
                                  //     data: ' ${snapshot.data!.longNumCycle}'),
                                  Text_medium_dark(
                                      title:
                                          'Là số lần gia hạn lại gói cước, ví dụ thuê bao đăng ký VD1496T vào tháng 01/2022, tháng 07/2022 gia hạn lại thì chu kỳ gia hạn là 2.'),
                                  SizedBox(
                                    width: widthOfDevice(context),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        snapshot.data?.thoiGianHetHanCk
                                                    .toString() ==
                                                ''
                                            ? Custom_HugeRichText(
                                                colorText: 'Chu kỳ sử dụng: ',
                                                normaText:
                                                    ' ${snapshot.data!.currentUsingCycle}')
                                            : Custom_HugeRichText(
                                                colorText: 'Chu kỳ sử dụng: ',
                                                normaText:
                                                    ' ${snapshot.data!.currentUsingCycle} (thời gian hết hạn chu kì ${snapshot.data!.thoiGianHetHanCk.toString()})'),
                                        Text_medium_dark(
                                            title:
                                                'Là chu kỳ sử dụng gói cước, ví dụ thuê bao đăng ký VD1496T vào tháng 01/2022, tháng 03/2022 anh/chị kiểm tra thì chu kỳ sử dụng là 3.'),
                                        Text_medium_dark(
                                            title:
                                                'Gói cước đề xuất: ${snapshot.data!.goiCuocKmcbDeXuat}'),
                                        snapshot.data!.trangthaiDahuongluong ==
                                                1
                                            ? Custom_HugeRichText(
                                                colorText:
                                                    'Trạng thái hưởng lương: ',
                                                normaText:
                                                    ' Đã hưởng lương năm 2023')
                                            : Custom_HugeRichText(
                                                colorText:
                                                    'Trạng thái hưởng lương: ',
                                                normaText:
                                                    ' Chưa hưởng lương năm 2023'),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            :
                            //bảng nhỏ
                            Column(
                                children: [
                                  // Row(
                                  //   children: [
                                  //     Column(
                                  //       crossAxisAlignment: CrossAxisAlignment.start,
                                  //       children: [
                                  //         snapshot.data!.trangthai == 1
                                  //             ? Custom_HugeRichText(
                                  //                 colorText: 'Trạng thái xử lý: ',
                                  //                 normaText: ' Đã xử lý')
                                  //             : Custom_HugeRichText(
                                  //                 colorText: 'Trạng thái xử lý: ',
                                  //                 normaText: ' Chưa xử lý'),
                                  //         Custom_HugeRichText(
                                  //             colorText: 'Số điện thoại: ',
                                  //             normaText: ' 0${snapshot.data!.sdt}'),
                                  //       ],
                                  //     ),
                                  //     const SizedBox(
                                  //       width: 5,
                                  //     ),
                                  //     Column(
                                  //       children: [
                                  //         const SizedBox(
                                  //           height: 10,
                                  //         ),
                                  //         SizedBox(
                                  //           width: widthOfDevice(context) / 2,
                                  //           child: Custom_HugeRichText(
                                  //               colorText: 'Kết quả xử lý: ',
                                  //               normaText:
                                  //                   ' ${snapshot.data!.ketquaXuly}'),
                                  //         )
                                  //       ],
                                  //     )
                                  //   ],
                                  // )
                                  Row(
                                    children: <Widget>[
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Expanded(
                                        flex: 5,
                                        child: SizedBox(
                                            child: Text(
                                          'Trạng thái xử lý:',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                          ),
                                        )),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: SizedBox(
                                          child: Text_medium_dark(
                                              title:
                                                  snapshot.data!.trangthai == 1
                                                      ? 'Đã xử lí'
                                                      : 'Chưa xử lí'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      const Expanded(
                                        flex: 5,
                                        child: SizedBox(
                                            child: Text(
                                          'Số điện thoại:',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                          ),
                                        )),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: SizedBox(
                                          child: Text_medium_dark(
                                            title: '0${snapshot.data!.sdt}',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Expanded(
                                        flex: 5,
                                        child: SizedBox(
                                            child: Text(
                                          'Kết quả xử lý: ',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                          ),
                                        )),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: SizedBox(
                                          child: Text_medium_dark(
                                            title:
                                                '${snapshot.data!.ketquaXuly}',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                      }
                    },
                  );
                }
              },
            ),
          ),
        ));
  }
}
