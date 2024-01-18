// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors, use_build_context_synchronously

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vnptapp/Components/Custom_CopyRight_Bottom.dart';
import 'package:vnptapp/Components/Custom_LoadingButton.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_SizedBox.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/Custom_ShowDialog.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Models/SubModel/subModel_DemDangNhap.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/ODPScreen/ODPScreen_MainPage.dart';
import 'package:vnptapp/screen/homepage/HomePage_MainPage.dart';
import 'package:vnptapp/screen/login/LoginScreen_Logic.dart';

// ignore: must_be_immutable, camel_case_types
class LoginScreen_MainPage extends StatefulWidget {
  LoginScreen_MainPage({super.key, required this.thongBao
      //  , required this.prefs
      });
  String thongBao;
  // SharedPreferences prefs;
  @override
  State<LoginScreen_MainPage> createState() => _LoginScreen_MainPageState();
}

// ignore: camel_case_types
class _LoginScreen_MainPageState extends State<LoginScreen_MainPage> {
  TextEditingController taiKhoanController = TextEditingController();
  TextEditingController matKhauController = TextEditingController();

  Future<subModel_DemDangNhap?> _getInfor() async {
    var deviceInfo = DeviceInfoPlugin();
    PackageInfo _packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown',
      buildSignature: 'Unknown',
      installerStore: 'Unknown',
    );
    final info = await PackageInfo.fromPlatform();
    _packageInfo = info;
    subModel_DemDangNhap subddn = subModel_DemDangNhap();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      subddn.idThietBi = iosDeviceInfo.identifierForVendor;
      subddn.appPhienBan =
          '${_packageInfo.version}.${_packageInfo.buildNumber}';
      subddn.tenThietBi = iosDeviceInfo.model;
      subddn.tenHangThietBi = iosDeviceInfo.name;
      subddn.heDieuHanh = iosDeviceInfo.systemName;
      subddn.phienBanHeDieuHanh = iosDeviceInfo.systemVersion;
      return subddn; // unique ID on iOS
    } else if (Platform.isAndroid) {
      // var androidId = AndroidId();
      // return await androidId.getId();
      var androidDeviceInfo = await deviceInfo.androidInfo;
      subddn.idThietBi = androidDeviceInfo.id;
      subddn.appPhienBan =
          '${_packageInfo.version}.${_packageInfo.buildNumber}';
      subddn.tenThietBi = androidDeviceInfo.model;
      subddn.tenHangThietBi = androidDeviceInfo.brand;
      subddn.heDieuHanh = 'Android';
      subddn.phienBanHeDieuHanh = androidDeviceInfo.version.release;
      return subddn; // unique ID on Android
      //model = tên
      //brand = hãng
      //id = id thiết bị
    } else {
      subddn.idThietBi = null;
      subddn.appPhienBan = null;
      subddn.tenThietBi = 'unknow';
      subddn.tenHangThietBi = 'unknow';
      subddn.heDieuHanh = 'unknow';
      subddn.phienBanHeDieuHanh = 'unknow';
    }
  }

// Future<String?> _getId() async {
//   var deviceInfo = DeviceInfoPlugin();
//   if (Platform.isIOS) { // import 'dart:io'
//     var iosDeviceInfo = await deviceInfo.iosInfo;
//     return null;
//   } else if(Platform.isAndroid) {
//     // var androidId = AndroidId();
//     // return await androidId.getId();
//     var androidDeviceInfo = await deviceInfo.androidInfo;
//     return androidDeviceInfo.version.release.toString(); // unique ID on Android
//     //model = tên
//     //brand = hãng
//     //id = id thiết bị
//   }
// }
  bool isRememberPassword = false;
  login_function() async {
    subModel_DemDangNhap? getinfo = await _getInfor();
    print(getinfo!.appPhienBan);
    print(getinfo!.heDieuHanh);
    print(getinfo!.phienBanHeDieuHanh);
    print(getinfo!.idThietBi);
    print(getinfo!.tenThietBi);
    print(getinfo!.tenHangThietBi);

    if (mounted) {
      String url = await checkLocalConnectionApi();
      if (taiKhoanController.text == '' || taiKhoanController.text.isEmpty) {
        ShowDialog('Lỗi', 'Hãy nhập thông tin tài khoản!', context);
      } else if (matKhauController.text == '' ||
          matKhauController.text.isEmpty) {
        ShowDialog('Lỗi', 'Hãy nhập thông tin mật khẩu!', context);
      } else {
        try {
          String login =
              await Future.delayed(const Duration(seconds: 2), () async {
            return await loginWithODP(
                taiKhoanController.text, matKhauController.text, url);
          });
          if (login == 'Success') {
            String login_infor_checker =
                await Future.delayed(const Duration(seconds: 2), () async {
              return await loginKiemTraInfor(
                  localNhanVien.nhanvien_id!, getinfo!, url);
            });
            if (login_infor_checker == 'Success') {
              String login_Counter =
                  await Future.delayed(const Duration(seconds: 2), () async {
                return await loginCounter(localNhanVien.nhanvien_id!, url);
              });
              if (login_Counter == 'Success') {
                if (isRememberPassword == true) {
                  // await widget.prefs.setString('matkhau', matKhauController.text);
                  // await widget.prefs
                  //     .setString('taikhoan', taiKhoanController.text);
                  await shared_preferences.setString(
                      'matkhau',
                      matKhauController.text
                          .replaceAll(shared_preferences.getString('odp'), ''));
                  await shared_preferences.setString(
                      'taikhoan', taiKhoanController.text);
                  //set string odp bên phần logic
                  // print(shared_preferences.getString('matkhau'));
                }
                shared_preferences.setBool('nhomatkhau', isRememberPassword);
                //  print(shared_preferences.getBool('nhomatkhau'));
                pageTransitionRemoveAll(context, HomePage_MainPage());
              } else {
                ShowDialog('Lỗi', 'Login counter lỗi', context);
              }
            } else {
              ShowDialog('Lỗi', login_infor_checker, context);
            }
          } else {
            ShowDialog('Lỗi', login, context);
          }
        } catch (e) {
          //  print(e);
          ShowDialog('Lỗi', 'Không có kết nối!', context);
        }
      }
    }
  }

  login_auto(String taikhoan, matkhau) async {
    try {
      String url = await checkLocalConnectionApi();
      String login = await Future.delayed(const Duration(seconds: 3), () async {
        return await rememberLogin(taikhoan, matkhau, url);
      });
      // String login = await loginWithODP(
      //       taiKhoanController.text, matKhauController.text, url);

      if (login != "Không tìm thấy tài khoản" ||
          login != "Tài khoản đã bị khóa") {
        pageTransitionRemoveAll(context, OTPScreen_MainPage());
      } else {
        // widget.prefs.remove('matkhau');
        // widget.prefs.remove('taikhoan');
        shared_preferences.remove('taikhoan');
        shared_preferences.remove('matkhau');
      }
    } catch (e) {
      //print(e);
      ShowDialog('Lỗi', 'Không có kết nối!', context);
    }
  }

  getODP() async {
    String url = await checkLocalConnectionApi();
    if (taiKhoanController.text.isEmpty) {
      ShowDialog('Lỗi', 'Hãy nhập tài khoản!', context);
    } else {
      try {
        String message =
            await Future.delayed(const Duration(seconds: 3), () async {
          return await getODPWithTaiKhoanNV(
              taiKhoanController.text.toString(), url);
        });
        // String message =
        //     await getODPWithTaiKhoanNV(taiKhoanController.text.toString(), url)
        //         .timeout(const Duration(seconds: 6));
        ShowDialog('Thông báo', message, context);
      } catch (e) {
        ShowDialog('Lỗi', 'Không có kết nối!', context);
      }
    }
  }

  forgetPassWord() async {
    String url = await checkLocalConnectionApi();
    if (taiKhoanController.text.isEmpty) {
      ShowDialog('Lỗi', 'Hãy nhập tài khoản!', context);
    } else {
      try {
        String message =
            await Future.delayed(const Duration(seconds: 3), () async {
          return await forgetPasswordWithTaiKhoanNv(
              taiKhoanController.text.toString(), url);
        });
        // String message = await forgetPasswordWithTaiKhoanNv(
        //         taiKhoanController.text.toString(), url)
        //     .timeout(const Duration(seconds: 6));
        ShowDialog('Thông báo', message, context);
      } catch (e) {
        ShowDialog('Lỗi', 'Không có kết nối!', context);
      }
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    //  LoadingSreen(nameOfLoadingScreen: 'nameOfLoadingScreen');
    // if (widget.prefs.getString('matkhau') != null &&
    //     widget.prefs.getString('taikhoan') != null) {
    //   login_auto(widget.prefs.getString('taikhoan')!,
    //       widget.prefs.getString('matkhau'));
    // }
    //print(shared_preferences.getString('matkhau'));
    // if (shared_preferences.getString('odp'))
    if (shared_preferences.getString('matkhau') != null &&
        shared_preferences.getString('taikhoan') != null &&
        shared_preferences.getBool('nhomatkhau') == true) {
      login_auto(shared_preferences.getString('taikhoan'),
          shared_preferences.getString('matkhau'));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.prefs.getString('matkhau') != null &&
    //     widget.prefs.getString('taikhoan') != null) {
    if (shared_preferences.getString('matkhau') != null &&
        shared_preferences.getString('taikhoan') != null) {
      return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/vnptangiang.jpg',
            width: widthOfDevice(context) / 2,
            height: heightOfDevice(context) / 3,
          ),
          LoadingScreen(nameOfLoadingScreen: 'Đang đăng nhập'),
        ],
      ));
    }
    return Scaffold(
        // appBar: AppBar(
        //     backgroundColor: primaryColors,
        //     title: Text_huge_light(title: 'HỆ THỐNG BSC/KPI')),
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Stack(
        children: [
          SizedBox(
            // width: widthOfDevice(context),
            // height: isLandScape(context)
            //     ? heightOfDevice(context) < 290
            //         ? heightOfDevice(context) * 1.5
            //         : heightOfDevice(context)
            //     : widget.thongBao == ''
            //         ? heightOfDevice(context) - heightOfAppBar(context)
            //         : heightOfDevice(context),
            height: heightOfDevice(context),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  isLandScape(context)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/VNPT-Logo-PNG-3.png',
                              width: widthOfDevice(context) / 6,
                              height: heightOfDevice(context) / 6,
                            ),
                            Image.asset(
                              'assets/loginlogo.jpg',
                              width: 50,
                              height: heightOfDevice(context) / 10,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  height: heightOfDevice(context) / 10,
                                  width: widthOfDevice(context),
                                  color: isDarkMode
                                      ? secondDaryColors
                                      : primaryColors,
                                  child:
                                      //  Row(
                                      //   mainAxisAlignment: MainAxisAlignment.end,
                                      //   children: [
                                      //     Text_large_light(
                                      //       title: "HỆ THỐNG BSC/KPI",
                                      //     ),
                                      //   ],
                                      // )
                                      Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text_large_dark(
                                        title: "HỆ THỐNG BSC/KPI",
                                      ),
                                    ],
                                  )),
                            ),
                            // isSmallHeight() == true
                            //     ? Image.asset(
                            //         'assets/vnptangiang.jpg',
                            //         width: 100,
                            //         height: 100,
                            //       )
                            //     :
                            Image.asset(
                              'assets/vnptangiang.jpg',
                              width: widthOfDevice(context) / 4,
                              height: heightOfDevice(context) / 6,
                            ),
                            // isSmallHeight() == true
                            //     ? Image.asset(
                            //         'assets/loginlogo.jpg',
                            //         width: 50,
                            //         height: 50,
                            //       )
                            //     :
                            Image.asset(
                              'assets/loginlogo.jpg',
                              width: widthOfDevice(context) / 6,
                              height: heightOfDevice(context) / 10,
                            ),
                          ],
                        ),
                  widget.thongBao != ''
                      ? Text_medium_dark(title: 'Thông báo: ${widget.thongBao}')
                      : const Text(''),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: widthOfDevice(context) / 1.1,
                    height: heightOfDevice(context) / 12,
                    child: TextFormField(
                      controller: taiKhoanController,
                      decoration: const InputDecoration(
                        labelText: "Tài khoản",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Tài khoản không được để trống";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SmallHeightSizedBox(),
                  SizedBox(
                    width: widthOfDevice(context) / 1.1,
                    height: heightOfDevice(context) / 12,
                    child: TextFormField(
                      obscureText: _obscureText,
                      controller: matKhauController,
                      decoration: InputDecoration(
                        labelText: "Mật khẩu + ODP",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mật khẩu + ODP không được để trống";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Switch(
                        value: isRememberPassword,
                        activeColor: Color.fromRGBO(0, 90, 171, 0),
                        onChanged: (bool value) {
                          setState(() {
                            isRememberPassword = value;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isRememberPassword = !isRememberPassword;
                          });
                        },
                        child: Text(
                          'Ghi nhớ đăng nhập',
                          style: TextStyle(
                              color: isRememberPassword == true
                                  ? Colors.blue
                                  : Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Custom_LoadingTextButton(
                        nameOfLoadingButton: 'Lấy mã ODP',
                        func: getODP,
                      ),
                      Custom_LoadingButtonLight(
                        nameOfLoadingButton: 'Đăng nhập',
                        func: login_function,
                      )
                    ],
                  ),
                  const SmallHeightSizedBox(),
                  Custom_LoadingButtonLight(
                      nameOfLoadingButton: 'Quên Mật Khẩu',
                      func: forgetPassWord)
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Custom_CopyRight_Bottom(),
          ),
        ],
      ),
    ));
  }
}
