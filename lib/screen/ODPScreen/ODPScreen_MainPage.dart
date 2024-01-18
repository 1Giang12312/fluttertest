// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors, use_build_context_synchronously

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vnptapp/Components/Custom_ShowDialog.dart';
import 'package:vnptapp/Components/Custom_SizedBox.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/Models/SubModel/subModel_DemDangNhap.dart';
import 'package:vnptapp/Variable/Constant.dart';
import 'package:vnptapp/screen/ODPScreen/ODPScreen_Logic.dart';
import 'package:vnptapp/screen/homepage/HomePage_MainPage.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_LoadingButton.dart';
import 'package:vnptapp/screen/login/LoginScreen_MainPage.dart';

// ignore: camel_case_types
class OTPScreen_MainPage extends StatefulWidget {
  const OTPScreen_MainPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OTPScreen_MainPageState createState() => _OTPScreen_MainPageState();
}

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
    subddn.appPhienBan = '${_packageInfo.version}.${_packageInfo.buildNumber}';
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
    subddn.appPhienBan = '${_packageInfo.version}.${_packageInfo.buildNumber}';
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

// ignore: camel_case_types
class _OTPScreen_MainPageState extends State<OTPScreen_MainPage> {
  OtpFieldController otpController = OtpFieldController();
  bool isLoading = true;
  ODPloginAuto() async {
    print(shared_preferences.getString('odp'));
    subModel_DemDangNhap? getinfo = await _getInfor();
    print(getinfo!.appPhienBan);
    print(getinfo!.heDieuHanh);
    print(getinfo!.phienBanHeDieuHanh);
    print(getinfo!.idThietBi);
    print(getinfo!.tenThietBi);
    print(getinfo!.tenHangThietBi);

    if (mounted) {
      setState(() {
        isLoading = true;
      });
      String url = await checkLocalConnectionApi();
      try {
        String login =
            await Future.delayed(const Duration(seconds: 2), () async {
          return await loginODPAuto(url);
        });
        // if (login == "Tài khoản đã bị khóa!" ||
        //     login != "Mật khẩu + ODP hoặc tài khoản đã nhập chưa đúng!") {
        if (login == 'Success') {
          String login_infor_checker =
              await Future.delayed(const Duration(seconds: 2), () async {
            return await loginKiemTraInfor(
                localNhanVien.nhanvien_id!, getinfo, url);
          });
          if (login_infor_checker == 'Success') {
            String login_Counter =
                await Future.delayed(const Duration(seconds: 2), () async {
              return await loginCounter(localNhanVien.nhanvien_id!, url);
            });
            if (login_Counter == 'Success') {
              pageTransitionRemoveAll(context, HomePage_MainPage());
            } else {
              ShowDialog('Lỗi', 'Lỗi login Counter', context);
            }
          } else {
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
                        thongBao: login_infor_checker,
                        //prefs: shared_preferences,
                      )),
              (route) => false, // Xóa hết các trang khỏi ngăn xếp
            );
          }
        } else {
          shared_preferences.remove('odp');
          ShowDialog("Lỗi", login, context);
          // print(shared_preferences.remove('odp'));
        }
      } catch (e) {
        // print(e);
        ShowDialog(
            'Lỗi',
            'Vui lòng kiểm tra lại đường truyền hoặc liện hệ nhà phát triển',
            context);
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  getODP() async {
    String url = await checkLocalConnectionApi();
    if (shared_preferences.getString('taikhoan') == null) {
      ShowDialog('Lỗi', 'Vui lòng đăng nhập lại', context);
    } else {
      try {
        String message =
            await Future.delayed(const Duration(seconds: 3), () async {
          return await getODPWithTaiKhoanNV(
              shared_preferences.getString('taikhoan'), url);
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

  ODPLogin(String odp) async {
    setState(() {
      isLoading = true;
    });
    subModel_DemDangNhap? getinfo = await _getInfor();

    String url = await checkLocalConnectionApi();
    try {
      String login = await Future.delayed(const Duration(seconds: 2), () async {
        return await loginODP(odp);
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
            pageTransitionRemoveAll(context, HomePage_MainPage());
          } else {
            ShowDialog('Lỗi', 'Lỗi login Counter', context);
          }
        } else {
          ShowDialog('Lỗi', login_infor_checker, context);
        }
      } else {
        ShowDialog('Lỗi', login, context);
        shared_preferences.remove('odp');
        // print(shared_preferences.remove('odp'));
      }
      // else {
      //   ShowDialog('Lỗi', 'Vui lòng kiểm tra lại mạng hoặc liên hệ phòng DHNV', context);
      //   shared_preferences.remove('odp');
      // }
    } catch (e) {
      //print(e);
      ShowDialog(
          'Lỗi', 'Vui lòng kiểm tra lại mạng hoặc liện hệ phòng DHNV', context);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    if (shared_preferences.getString('matkhau') != null &&
        shared_preferences.getString('taikhoan') != null) {
      ODPloginAuto();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme:
    //       ThemeData(colorSchemeSeed:  const Color(0x00005aab), useMaterial3: true),
    //   home:
    // if (shared_preferences.getString('odp') != null) {
    if (isLoading == true) {
      return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/vnptangiang.jpg',
            width: widthOfDevice(context) / 2,
            height: heightOfDevice(context) / 3,
          ),
          LoadingScreen(nameOfLoadingScreen: 'Đang xác thực'),
        ],
      ));
    }
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  shared_preferences.remove('taikhoan');
                  shared_preferences.remove('matkhau');
                  if (shared_preferences.getString('odp') != null) {
                    shared_preferences.remove('odp');
                  }
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen_MainPage(
                              thongBao: '',
                            )),
                    (route) => false,
                  );
                },
                icon: const Icon(
                  Icons.arrow_back,
                )),
            title: const Text('Xác thực ODP')),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.cleaning_services),
          onPressed: () {
            otpController.clear();
          },
        ),
        body: Center(
            child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OTPTextField(
                controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 30,
                fieldStyle: FieldStyle.underline,
                outlineBorderRadius: 15,
                style: const TextStyle(fontSize: 17),
                // onChanged: (pin) {
                //   print("Changed: " + pin);
                // },
                onChanged: (pin) {},
                onCompleted: (pin) async {
                  try {
                    ODPLogin(pin);
                    shared_preferences.setString('odp', pin);
                  } catch (e) {
                    ShowDialog('Lỗi', 'Không có kết nối!', context);
                  }
                  // }
                }),
            const LargeHeightSizedBox(),
            Custom_LoadingTextButton(
              nameOfLoadingButton: 'Lấy mã ODP',
              func: getODP,
            ),
          ],
        )));
  }
}
