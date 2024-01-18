// ignore_for_file: file_names, camel_case_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_LoadingButton.dart';
import 'package:vnptapp/Components/Custom_ShowDialog.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/Drawer/profile/ProfileScreen_Logic.dart';
import 'package:vnptapp/screen/Drawer/profile/location/GoogleMap_UI.dart';
import 'package:vnptapp/screen/login/LoginScreen_MainPage.dart';
import '../../../Components/Custom_AppBar.dart';

// ignore: must_be_immutable
class ProfileScreen_MainPage extends StatefulWidget {
  ProfileScreen_MainPage({super.key, required this.user});
  @override
  State<ProfileScreen_MainPage> createState() => _ProfileScreen_MainPageState();
  NhanVien user;
}

class _ProfileScreen_MainPageState extends State<ProfileScreen_MainPage> {
  // void logoutFunction() async {
  //   try {
  //     int isLogout = await logout().timeout(Duration(seconds: waitOfTimeOut()));
  //     setState(() {
  //       isLoading = false;
  //     });
  //     if (isLogout == 200) {
  //       localNhanVien = NhanVien();
  //       // ignore: use_build_context_synchronously
  //       Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context) => const LoginScreen_MainPage()),
  //         (route) => false, // Xóa hết các trang khỏi ngăn xếp
  //       );
  //     } else {
  //       // ignore: use_build_context_synchronously
  //       DecryptResponse(context, isLogout);
  //     }
  //   } catch (e) {
  //     // ignore: use_build_context_synchronously
  //     ShowDialog('Lỗi', 'Không có kết nối!', context);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: Custom_AppBar(title: 'Thông Tin Cá Nhân'),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 16),
                Text(
                  'Họ và Tên: ${localNhanVien.nhanvien_hoten}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 16),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text('Địa chỉ: ${localNhanVien.diachi}'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.description),
                    title: Text('Tài khoản : ${localNhanVien.nhanvien_manv}'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                        'Mã nhân viên : ${localNhanVien.nhanvien_manv_thns}'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(
                        'Số điện thoại : ${localNhanVien.nhanvien_didong}'),
                  ),
                ),
                const SizedBox(height: 16),
                // ElevatedButton(
                //   onPressed: () {
                //     // Thêm xử lý khi nhấn nút chỉnh sửa thông tin cá nhân
                //   },
                //   child: const Text('Chỉnh Sửa Thông Tin'),
                // ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const GoogleMap_UI()),
                          );
                        },
                        child: const Text('Google map'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
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
                    )
                    //    ElevatedButton(
                    //     onPressed: () async {
                    //       if (mounted) {
                    //         // SharedPreferences prefs =
                    //         //     await SharedPreferences.getInstance();
                    //         //reset tai khoan mat khau
                    //         shared_preferences.remove('matkhau');
                    //         shared_preferences.remove('taikhoan');
                    //         shared_preferences.remove('odp');
                    //         shared_preferences.remove('jwt');
                    //         shared_preferences.remove('nhomatkhau');
                    //         jwt = '';
                    //         localNhanVien = NhanVien();
                    //         Navigator.of(context).pushAndRemoveUntil(
                    //           MaterialPageRoute(
                    //               builder: (context) => LoginScreen_MainPage(
                    //                     thongBao: '',
                    //                     //  prefs: prefs,
                    //                   )),
                    //           (route) =>
                    //               false, // Xóa hết các trang khỏi ngăn xếp
                    //         );
                    //       }
                    //     },
                    //     child: const Text('Đăng xuất'),
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
