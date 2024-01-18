// ignore_for_file: file_names, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vnptapp/Components/Custom_LoadingButton.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_ShowDialog.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/PDF_Viewer.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/BanHang/PTTB/MainPage.dart';
import 'package:vnptapp/screen/Drawer/BanHang/ShopVNPT/MainPage.dart';
import 'package:vnptapp/screen/Drawer/CamNangSuDung/DanhSachGoiCuocTruoc15_6_2023/MainPage.dart';
import 'package:vnptapp/screen/Drawer/CamNangSuDung/GoiCuocDDTS/MainPage.dart';
import 'package:vnptapp/screen/Drawer/BanHang/DigiShop/MainPage.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/DieuHanhGiamHuy/MainPage.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/ThueBaoKHongPSLL/MainPage.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/TongHop/MainPage.dart';
import 'package:vnptapp/screen/Drawer/DiaBan/TongHopDieuHanhGiamHuy/MainPage.dart';
import 'package:vnptapp/screen/Drawer/Drawer_Logic.dart';
import 'package:vnptapp/screen/Drawer/Khac/BieuMau/MainPage.dart';
import 'package:vnptapp/screen/Drawer/Khac/TheoDoiDangNhap/MainPage.dart';
import 'package:vnptapp/screen/Drawer/Khac/ThongTinUngDung.dart';
import 'package:vnptapp/screen/Drawer/KiemTraGiaoBSC/GiaoBscNhanVien/MainPage.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/AutoHoTroNghiepVu/MainPage.dart';
import 'package:vnptapp/screen/Drawer/NghiepVu/OBThayTheTBDC2023/MainPage.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/ChiTietSanLuongVT_CNTT/MainPage.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/HeSoVT-CNTT/MainPage.dart';
import 'package:vnptapp/screen/Drawer/QuanLySanLuong/ThuLaoPhatTrienChamSocDUQ/MainPage.dart';
import 'package:vnptapp/screen/Drawer/TapKHTiemNang/TapKHSuDungGoiHomeSanhChat/MainPage.dart';
import 'package:vnptapp/screen/Drawer/ThongKeBaoCao/TheoDoiGoiCuocPTM/MainPage.dart';
import 'package:vnptapp/screen/Drawer/ThongKeBaoCao/ThuLaoBanTheNapThe/MainPage.dart';
import 'package:vnptapp/screen/Drawer/VTCI/TheoDoiDuLieuVTCI/MainPage.dart';
import 'package:vnptapp/screen/Drawer/profile/ProfileScreen_MainPage.dart';
import 'package:vnptapp/screen/login/LoginScreen_MainPage.dart';

// ignore: camel_case_types
class Drawer_HomePage extends StatefulWidget {
  const Drawer_HomePage({super.key});
  @override
  State<Drawer_HomePage> createState() => _Drawer_HomePageState();
}

bool loadingWebBsc = false;

// ignore: camel_case_types
class _Drawer_HomePageState extends State<Drawer_HomePage> {
  dangXuat() async {
    if (mounted) {
      String url = await checkLocalConnectionApi();
      try {
        String logout =
            await Future.delayed(const Duration(seconds: 2), () async {
          return await updateIdThietBiNull(localNhanVien.nhanvien_id!, url);
        });
        if (logout == 'Success') {
// SharedPreferences prefs =
          //     await SharedPreferences.getInstance();
          //reset tai khoan mat khau
          shared_preferences.remove('matkhau');
          shared_preferences.remove('taikhoan');
          shared_preferences.remove('odp');
          shared_preferences.remove('nhomatkhau');
          shared_preferences.remove('jwt');
          jwt = '';
          localNhanVien = NhanVien();
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => LoginScreen_MainPage(
                      thongBao: '',
                      //prefs: shared_preferences,
                    )),
            (route) => false, // Xóa hết các trang khỏi ngăn xếp
          );
        } else {
          ShowDialog(
              'Lỗi',
              'Lỗi khi đăng xuất vui lòng kiểm tra lại mạng hoặc liên hệ phòng DHNV',
              context);
        }
      } catch (e) {
        ShowDialog('Lỗi', e.toString().replaceAll('Exception:', ''), context);
      }
    }
  }

  // void loginFunction() async {
  //   try {
  //     User user = await getUIByID(localUser.Id.toString())
  //         .timeout(Duration(seconds: waitOfTimeOut()));
  //     setState(() {
  //       isLoading = false;
  //     });
  //     if (user != User()) {
  //       // ignore: use_build_context_synchronously
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //             builder: (context) => ProfileScreen(
  //                   user: user,
  //                 )),
  //       );
  //     } else {
  //       // ignore: use_build_context_synchronously
  //       ShowDialog('Lỗi', 'Không có kết nối!', context);
  //     }
  //   } catch (e) {
  //     // ignore: use_build_context_synchronously
  //     ShowDialog('Lỗi', 'Không có kết nối!', context);
  //   }
  // }
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthOfDevice(context) / 1.5,
      child: Drawer(
        backgroundColor: isDarkMode
            ? const Color(0xFF1C1B1F)
            : const Color.fromARGB(255, 212, 232, 249),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: isLandScape(context)
                  ? heightOfDevice(context) / 5
                  : heightOfDevice(context) / 6,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: isDarkMode ? secondDaryColors : primaryColors,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text_small_light(
                      //   title: 'Thuộc $tenDonVi',
                      // ),
                      Text_small_dark(
                        title: 'Xin chào ${localNhanVien.nhanvien_hoten}',
                      ),
                      //  Text_small_light(
                      //   title: 'Mã THNS ${localNhanVien.nhanvien_manv_thns
                      //   }',
                      // ),
                    ],
                  )),
            ),
            ListTile(
              leading: Image.asset(
                shared_preferences.getBool('darklightmode')
                    ? 'assets/leadingIcon/usercolor.png'
                    : 'assets/leadingIcon/userblack.png',
                height: 24,
                width: 24,
              ),
              title: Text_medium_dark(
                title: 'Thông tin cá nhân',
              ),
              onTap: () async {
                pageTrasition(
                    context, ProfileScreen_MainPage(user: localNhanVien));
              },
            ),
            //quản lý sản lượng
            ExpansionTile(
              leading: Image.asset(
                shared_preferences.getBool('darklightmode')
                    ? 'assets/leadingIcon/quanlysanluong1.png'
                    : 'assets/leadingIcon/quanlysanluongblack.png',
                height: 24,
                width: 24,
              ),
              title: Text_medium_dark(title: 'Quản lý sản lượng'),
              children: <Widget>[
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Hệ số VT-CNTT',
                    ),
                    onTap: () async {
                      pageTrasition(context, const HeSoVT_CNTT_MainPage());
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Chi tiết hệ số VT-CNTT',
                    ),
                    onTap: () async {
                      pageTrasition(context, const ChiTietSanLuongVT_CNTT());
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Thù lao phát triển & chăm sóc ĐUQ',
                    ),
                    onTap: () async {
                      pageTrasition(
                          context, const ThuLaoPhatTrienChamSocDUQ_MainPage());
                    }),
              ],
            ),
            //Kiểm tra giao BSC/KPI
            ExpansionTile(
              leading: Image.asset(
                shared_preferences.getBool('darklightmode')
                    ? 'assets/leadingIcon/kpi1.png'
                    : 'assets/leadingIcon/kpiblack32.png',
                height: 24,
                width: 24,
              ),
              title: Text_medium_dark(title: 'Kiểm tra giao BSC/KPI'),
              children: <Widget>[
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Nhân viên nhận BSC',
                    ),
                    onTap: () async {
                      pageTrasition(context, const NhanVienNhanBsc_MainPage());
                    }),
              ],
            ),
            //Thống kê báo cáo
            ExpansionTile(
              leading: Image.asset(
                shared_preferences.getBool('darklightmode')
                    ? 'assets/leadingIcon/report1.png'
                    : 'assets/leadingIcon/report32black.png',
                height: 24,
                width: 24,
              ),
              title: Text_medium_dark(title: 'Thống kê báo cáo'),
              children: <Widget>[
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Theo dõi gói cước PTM',
                    ),
                    onTap: () async {
                      pageTrasition(context, TheoDoiGoiCuocPTM_MainPage());
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Thù lao bán thẻ/ nạp thẻ',
                    ),
                    onTap: () async {
                      pageTrasition(context, ThuLaoBanTheNapThe_MainPage());
                    }),
              ],
            ),
            //Nghiệp vụ
            ExpansionTile(
              leading: Image.asset(
                shared_preferences.getBool('darklightmode')
                    ? 'assets/leadingIcon/help-desk color.png'
                    : 'assets/leadingIcon/help-desk.png',
                height: 24,
                width: 24,
              ),
              title: Text_medium_dark(title: 'Nghiệp vụ'),
              children: <Widget>[
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Hỗ trợ nghiệp vụ',
                    ),
                    onTap: () async {
                      pageTrasition(context, AutoHoTroNghiepVu_MainPage());
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'OB thay thế TBĐC 2023',
                    ),
                    onTap: () async {
                      pageTrasition(context, const OBThayTheTBDC_MaiPage());
                    }),
              ],
            ),
            //bán hàng
            ExpansionTile(
                leading: Image.asset(
                  shared_preferences.getBool('darklightmode')
                      ? 'assets/leadingIcon/commission32.png'
                      : 'assets/leadingIcon/compensation32black.png',
                  height: 24,
                  width: 24,
                ),
                title: Text_medium_dark(title: 'Bán hàng'),
                children: <Widget>[
                  ListTile(
                      leading: const Text(''),
                      title: Text_medium_dark(
                        title: 'Thuê bao DDTT PTM DigiShop',
                      ),
                      onTap: () async {
                        pageTrasition(context, const DigiShop_MainPage());
                      }),
                  ListTile(
                      leading: const Text(''),
                      title: Text_medium_dark(
                        title: 'Thuê bao DDTT PTM qua User CCBS',
                      ),
                      onTap: () async {
                        pageTrasition(context, const PTTB_MainPage());
                      }),
                  ListTile(
                      leading: const Text(''),
                      title: Text_medium_dark(
                        title: 'Thuê bao DDTT PTM ShopVNPT',
                      ),
                      onTap: () async {
                        pageTrasition(context, const ShopVNPT_MainPage());
                      }),
                  // localNhanVien.nhanvien_donvi == 13 || localNhanVien.nhanvien_donvi == 2
                  //     ? ListTile(
                  //         leading: const Text(''),
                  //         title: Text_medium_dark(
                  //           title: 'Quản lý phân quyền',
                  //         ),
                  //         onTap: () async {
                  //           pageTrasition(context, QuanLyPhanQuyen_MainPage());
                  //         })
                  //     : SizedBox()
                ]),
            //VTCI
            ExpansionTile(
              leading: Image.asset(
                shared_preferences.getBool('darklightmode')
                    ? 'assets/leadingIcon/VTCI.png'
                    : 'assets/leadingIcon/VTCIblack.png',
                height: 24,
                width: 24,
              ),
              children: [
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Theo dõi dữ liệu VTCI',
                    ),
                    onTap: () async {
                      pageTrasition(
                          context, const TheoDoiDuLieuVTCI_MainPage());
                    })
              ],
              title: Text_medium_dark(title: 'VTCI'),
            ),
            //tập kh tiềm năng
            ExpansionTile(
              leading: Image.asset(
                shared_preferences.getBool('darklightmode')
                    ? 'assets/leadingIcon/tapKHTiemNangColor.png'
                    : 'assets/leadingIcon/tapKHTiemNang.png',
                height: 24,
                width: 24,
              ),
              title: Text_medium_dark(title: 'Tập KH tiềm năng'),
              children: [
                ListTile(
                  leading: Text(''),
                  title: Text_medium_dark(
                      title: 'Tập KH sử dụng gói home Sành - Chất'),
                  onTap: () {
                    pageTrasition(
                        context, TapKHSuDungGoiHomeSanhChat_MainPage());
                  },
                )
              ],
            ),
            //địa bàn
            ExpansionTile(
              leading: Image.asset(
                shared_preferences.getBool('darklightmode')
                    ? 'assets/leadingIcon/areacolor.png'
                    : 'assets/leadingIcon/area.png',
                height: 24,
                width: 24,
              ),
              title: Text_medium_dark(title: 'Địa bàn'),
              children: [
                ListTile(
                  leading: const Text(''),
                  title: Text_medium_dark(title: 'Điều hành giảm hủy'),
                  onTap: () {
                    pageTrasition(context, DieuHanhGiamHuy_MainPage());
                  },
                ),
                ListTile(
                  leading: const Text(''),
                  title: Text_medium_dark(title: 'Tổng hợp'),
                  onTap: () {
                    pageTrasition(context, TongHop_MainPage());
                  },
                ),
                localNhanVien.nhanvien_donvi == 13 ||
                        localNhanVien.nhanvien_donvi == 2
                    ? ListTile(
                        leading: const Text(''),
                        title: Text_medium_dark(
                            title: 'Tổng hợp điều hành giảm hủy'),
                        onTap: () {
                          pageTrasition(
                              context, TongHopDieuHanhGiamHuy_MainPage());
                        },
                      )
                    : const SizedBox(),
                ListTile(
                  leading: const Text(''),
                  title: Text_medium_dark(title: 'Thuê bao không PSLL'),
                  onTap: () {
                    pageTrasition(context, ThueBaoKHongPSLL_MainPage());
                  },
                ),
                // ListTile(
                //   leading: const Text(''),
                //   title: Text_medium_dark(title: 'B2A'),
                //   onTap: () {
                //     // pageTrasition(
                //     //     context, TapKHSuDungGoiHomeSanhChat_MainPage());
                //   },
                // ),
                // ListTile(
                //   leading: const Text(''),
                //   title: Text_medium_dark(title: 'Thị phần dịch vụ'),
                //   onTap: () {
                //     // pageTrasition(
                //     //     context, TapKHSuDungGoiHomeSanhChat_MainPage());
                //   },
                // )
              ],
            ),
            //Cẩm nang sử dụng
            ExpansionTile(
              leading: Image.asset(
                shared_preferences.getBool('darklightmode')
                    ? 'assets/leadingIcon/book.png'
                    : 'assets/leadingIcon/inform.png',
                height: 24,
                width: 24,
              ),
              title: Text_medium_dark(title: 'Cẩm nang sử dụng'),
              children: <Widget>[
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Gói cước đăng ký mới từ 15/06/2023',
                    ),
                    onTap: () async {
                      pageTrasition(
                          context,
                          PDF_Viewer_WithURL(
                            urlString:
                                '/HoTroNghiepVu/TaiLieu/GoiCuocTu_15_06.pdf',
                            title: 'Gói cước đăng ký mới từ 15/06/2023',
                          ));
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Danh sách gói cước trước 15/06/2023',
                    ),
                    onTap: () async {
                      pageTrasition(context,
                          const DanhSachGoiCuocTruoc15_6_2023_MainPage());
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Cú pháp di động dịch vụ',
                    ),
                    onTap: () async {
                      pageTrasition(
                          context,
                          PDF_Viewer_WithURL(
                            urlString:
                                '/HoTroNghiepVu/TaiLieu/CuPhapDichVuDiDong.pdf',
                            title: 'Cú pháp di động dịch vụ',
                          ));
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Gói cước DĐTS',
                    ),
                    onTap: () async {
                      pageTrasition(context, const GoiCuocDDTS_MainPage());
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Gói cước BRCĐ',
                    ),
                    onTap: () async {
                      pageTrasition(
                          context,
                          PDF_Viewer_WithURL(
                            urlString: '/HoTroNghiepVu/TaiLieu/GoiCuocBRCD.pdf',
                            title: 'Gói cước BRCĐ',
                          ));
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Gói cước MyTV',
                    ),
                    onTap: () async {
                      pageTrasition(
                          context,
                          PDF_Viewer_WithURL(
                            urlString: '/HoTroNghiepVu/TaiLieu/GoiCuocMyTV.pdf',
                            title: 'Gói cước MyTV',
                          ));
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Hướng dẫn tiền xử lý BRCĐ cho NVKD',
                    ),
                    onTap: () async {
                      pageTrasition(
                          context,
                          PDF_Viewer_WithURL(
                            urlString:
                                '/HoTroNghiepVu/TaiLieu/TienXuLyBRCD.pdf',
                            title: 'Hướng dẫn tiền xử lý BRCĐ cho NVKD',
                          ));
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Xử lý lỗi trên ĐHSXKD,CCBS, DĐTT,VNPT Money',
                    ),
                    onTap: () async {
                      pageTrasition(
                          context,
                          PDF_Viewer_WithURL(
                            urlString:
                                '/HoTroNghiepVu/TaiLieu/Xy_ly_loi_di_dong_ccbs_money.pdf',
                            title:
                                'Xử lý lỗi trên ĐHSXKD,CCBS, DĐTT,VNPT Money',
                          ));
                    }),
                ListTile(
                    leading: const Text(''),
                    title: Text_medium_dark(
                      title: 'Xử lý lỗi SIM bị khóa',
                    ),
                    onTap: () async {
                      pageTrasition(
                          context,
                          PDF_Viewer_WithURL(
                            urlString:
                                '/HoTroNghiepVu/TaiLieu/XuLyLoiSIMKhoa.pdf',
                            title: 'Xử lý lỗi SIM bị khóa',
                          ));
                    }),
              ],
            ),
            //khác
            ExpansionTile(
                leading: Image.asset(
                  shared_preferences.getBool('darklightmode')
                      ? 'assets/leadingIcon/more32.png'
                      : 'assets/leadingIcon/more32black.png',
                  height: 24,
                  width: 24,
                ),
                title: Text_medium_dark(title: 'Khác'),
                children: <Widget>[
                  ListTile(
                      leading: const Text(''),
                      title: Text_medium_dark(
                        title: 'Hướng dẫn sử dụng',
                      ),
                      onTap: () async {
                        pageTrasition(
                            context,
                            PDF_Viewer_WithURL(
                              urlString:
                                  '/HoTroNghiepVu/TaiLieu/BSC_App_HSD.pdf',
                              title: 'Hướng dẫn sử dụng',
                            ));
                      }),
                  ListTile(
                      leading: const Text(''),
                      title: Text_medium_dark(
                        title: 'Thông báo',
                      ),
                      onTap: () async {
                        pageTrasition(
                            context,
                            PDF_Viewer_WithURL(
                              urlString:
                                  '/HoTroNghiepVu/TaiLieu/BSC_App_ThongBao.pdf',
                              title: 'Thông báo',
                            ));
                      }),
                  ListTile(
                      leading: const Text(''),
                      title: Text_medium_dark(
                        title: 'Thông tin ứng dụng',
                      ),
                      onTap: () async {
                        pageTrasition(context, const ThongTinUngDungPage());
                      }),
                  localNhanVien.nhanvien_donvi == 13 ||
                          localNhanVien.nhanvien_donvi == 2 ||
                          localNhanVien.nhanvien_chucdanh == 1 ||
                          localNhanVien.nhanvien_chucdanh == 2 ||
                          localNhanVien.nhanvien_chucdanh == 3 ||
                          localNhanVien.nhanvien_chucdanh == 4
                      ? ListTile(
                          leading: const Text(''),
                          title: Text_medium_dark(
                            title: 'Theo dõi đăng nhập',
                          ),
                          onTap: () async {
                            pageTrasition(
                                context, const TheoDoiDaangNhap_MainPage());
                          })
                      : const SizedBox(),
                  // localNhanVien.nhanvien_donvi == 13
                  //     ? ListTile(
                  //         leading: const Text(''),
                  //         title: Text_medium_dark(
                  //           title: 'Biểu mẫu',
                  //         ),
                  //         onTap: () async {
                  //           pageTrasition(context, const BieuMau_MainPage());
                  //         })
                  //     : SizedBox(),
                  // localNhanVien.nhanvien_donvi == 13 ||
                  //         localNhanVien.nhanvien_donvi == 2
                  //     ? ListTile(
                  //         leading: const Text(''),
                  //         title: Text_medium_dark(
                  //           title: 'Quản lý phân quyền',
                  //         ),
                  //         onTap: () async {
                  //           pageTrasition(context, const QuanLyPhanQuyen_MainPage());
                  //         })
                  //     : const SizedBox()
                ]),
            // ListTile(
            //     leading:
            //         loadingWebBsc ? CircularProgressIndicator() : Icon(Icons.web),
            //     title: Text_medium_dark(
            //       title: 'Web BSC-KPI',
            //     ),
            //     onTap: () async {
            //       setState(() {
            //         loadingWebBsc = true;
            //       });
            //       String url = await checkWeburl();
            //       try {
            //         launchUrlString(url);
            //       } catch (e) {
            //         throw Exception(e);
            //       }
            //       setState(() {
            //         loadingWebBsc = false;
            //       });
            //     }),
            // ListTile(
            //   // leading: Icon(isDarkMode ? Icons.brightness_3 : Icons.sunny),
            //   // title: Text(
            //   //   isDarkMode ? "Chế độ tối" : "Chế độ sáng",
            //   //   style: Theme.of(context).textTheme.titleSmall,
            //   // ),
            //   leading: Icon(isDarkMode ? Icons.brightness_3 : Icons.sunny),
            //   title: Text(
            //     isDarkMode ? "Chế độ tối" : "Chế độ sáng",
            //     style: Theme.of(context).textTheme.titleSmall,
            //   ),
            //   trailing: Consumer(builder: (context, ref, child) {
            //     return Transform.scale(
            //       scale: 0.7,
            //       child: Switch(
            //         activeColor: Colors.black,
            //         onChanged: (value) async {
            //            ref.read(appThemeProvider.notifier).state = value;
            //           // SharedPreferences prefs =
            //           //     await SharedPreferences.getInstance();
            //           shared_preferences.setBool('darklightmode', value);
            //         },
            //         value: isDarkMode,
            //       ),
            //     );
            //   }),
            // ),
            ElevatedButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Đăng xuất'),
                        content: const Text(
                            'Bạn thật sự muốn đăng xuất khỏi hệ thống?'),
                        actions: [
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Hủy')),
                              Flexible(
                                  child: SizedBox(
                                width: widthOfDevice(context),
                              )),
                              Custom_LoadingTextButton(
                                nameOfLoadingButton: 'Đồng ý',
                                func: dangXuat,
                              ),
                            ],
                          )

//                           TextButton(
//                               onPressed: () async {
//                                 if (mounted) {
//                                   String url = await checkLocalConnectionApi();
//                                   String logout = await Future.delayed(
//                                       const Duration(seconds: 2), () async {
//                                     return await updateIdThietBiNull(
//                                         localNhanVien.nhanvien_id!, url);
//                                   });
//                                   if (logout == 'Success') {
// // SharedPreferences prefs =
//                                     //     await SharedPreferences.getInstance();
//                                     //reset tai khoan mat khau
//                                     shared_preferences.remove('matkhau');
//                                     shared_preferences.remove('taikhoan');
//                                     shared_preferences.remove('odp');
//                                     shared_preferences.remove('nhomatkhau');
//                                     shared_preferences.remove('jwt');
//                                     jwt = '';
//                                     localNhanVien = NhanVien();
//                                     Navigator.of(context).pushAndRemoveUntil(
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               LoginScreen_MainPage(
//                                                 thongBao: '',
//                                                 //prefs: shared_preferences,
//                                               )),
//                                       (route) =>
//                                           false, // Xóa hết các trang khỏi ngăn xếp
//                                     );
//                                   } else {
//                                     ShowDialog(
//                                         'Lỗi',
//                                         'Lỗi khi đăng xuất vui lòng kiểm tra lại mạng hoặc liên hệ phòng DHNV',
//                                         context);
//                                   }
//                                 }
//                               },
//                               child: const Text('Đồng ý'))
                        ],
                      );
                    });
              },
              child: const Text('Đăng xuất'),
            ),
          ],
        ),
      ),
    );
  }
}
