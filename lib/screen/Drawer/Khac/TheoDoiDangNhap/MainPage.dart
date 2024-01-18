import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pager/pager.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Card.dart';
import 'package:vnptapp/Components/Custom_Data_Rows.dart';
import 'package:vnptapp/Components/Custom_DropdownDonVi.dart';
import 'package:vnptapp/Components/Custom_FutureBuilder.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Riverpod_Instance.dart';
import 'package:vnptapp/screen/Drawer/Khac/TheoDoiDangNhap/Detail.dart';
import 'package:vnptapp/screen/Drawer/Khac/TheoDoiDangNhap/Logic.dart';
import 'package:vnptapp/screen/Drawer/Khac/TheoDoiDangNhap/Variable.dart';

class TheoDoiDaangNhap_MainPage extends StatefulWidget {
  const TheoDoiDaangNhap_MainPage({super.key});

  @override
  State<TheoDoiDaangNhap_MainPage> createState() =>
      _TheoDoiDaangNhap_MainPageState();
}

class _TheoDoiDaangNhap_MainPageState extends State<TheoDoiDaangNhap_MainPage> {
  Future<void> refresh() async {
    setState(() {});
  }

  var searchkey = '';
  int pageNumber = 1;
  int pageSize = 10;
  @override
  void initState() {
    // TODO: implement initState
    searchkey = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(
        title: "Theo dõi đăng nhập",
      ),
      body: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(right: 8, left: 8, top: 8),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Tìm kiếm...',
                      label: Text('Tìm kiếm'),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(19.0)),
                      ),
                    ),
                    onChanged: (text1) {
                      setState(() {
                        searchkey = text1;
                      });
                    },
                  ),
                ),
                Custom_DropdownDonViTheoIdTatCa(
                  nhanvienDonVi: localNhanVien.nhanvien_donvi!,
                ),
                Consumer(builder: (context, ref, child) {
                  var selectedDV =
                      ref.watch(riverpod_instance.selectedIdDonViTatCa);
                  return FutureBuilder(
                      future: checkLocalConnectionApi(),
                      builder: ((context, snapshot) {
                        if (snapshot.data != null &&
                            snapshot.connectionState !=
                                ConnectionState.waiting) {
                          return FutureBuilder(
                              future: listTheoDoiDangNhap(
                                  snapshot.data!,
                                  pageNumber,
                                  pageSize,
                                  localNhanVien.nhanvien_donvi.toString(),
                                  selectedDV,
                                  searchkey,
                                  localNhanVien.nhanvien_chucdanh.toString()),
                              builder: (context, snapshot1) {
                                return Custom_FutureBuilder(
                                    snapshot: snapshot1,
                                    contextParam: context,
                                    widgetParam: snapshot1.hasData
                                        ? SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                for (var item
                                                    in snapshot1.data!)
                                                  Custom_Card(
                                                      item: item,
                                                      list: snapshot1.data,
                                                      widget: Column(
                                                        children: [
                                                          Detail_Rows(
                                                              title:
                                                                  'Tên đơn vị :',
                                                              data: item
                                                                  .donviTen),
                                                          Detail_Rows(
                                                              title:
                                                                  'Tên nhân viên :',
                                                              data: item
                                                                  .nhanvienHoten),
                                                          Detail_Rows(
                                                              title:
                                                                  'Số lần đăng nhập trong tháng :',
                                                              data: item
                                                                  .soLanLogin),
                                                          Detail_Rows(
                                                              title:
                                                                  'Lần đăng nhập gần nhất :',
                                                              data: item
                                                                  .ngayLoginCuoiCung),
                                                          // chi tiết
                                                          MaterialButton(
                                                            onPressed: () {
                                                              {
                                                                pageTrasition(
                                                                  context,
                                                                  TheoDoiDangNhap_Detail(tddn: item,),
                                                                );
                                                              }
                                                            },
                                                            child: Text_medium_dark(
                                                                title:
                                                                    'Xem chi tiết'),
                                                          )
                                                        ],
                                                      )),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                      '$pageNumber/${TheoDoiDangNhap_Variable.totalPages} trang, ${TheoDoiDangNhap_Variable.totalRecords} mục'),
                                                ),
                                                TheoDoiDangNhap_Variable
                                                            .totalPages !=
                                                        0
                                                    ? SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Pager(
                                                          currentPage:
                                                              pageNumber,
                                                          totalPages:
                                                              TheoDoiDangNhap_Variable
                                                                  .totalPages,
                                                          onPageChanged:
                                                              (page) {
                                                            setState(() {
                                                              pageNumber = page;
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    : const Text(''),
                                              ],
                                            ),
                                          )
                                        : const Text(
                                            "Lỗi xác thực vui lòng đăng nhập lại hoặc liên hệ phòng DHNV"));
                              });
                        } else {
                          return LoadingScreen(
                              nameOfLoadingScreen: 'Đang kiểm tra mạng...');
                        }
                      }));
                })
              ],
            ),
          ))),
    );
  }
}
