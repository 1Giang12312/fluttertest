// ignore_for_file: must_be_immutable, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vnptapp/Components/Custom_Page_Transition.dart';
import 'package:vnptapp/Components/Custom_ShowDialog.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
import 'package:vnptapp/Models/NhanVien.dart';
import 'package:vnptapp/screen/Drawer/Drawer_Logic.dart';
import 'package:vnptapp/screen/login/LoginScreen_MainPage.dart';

class Custom_FutureBuilder extends StatefulWidget {
  Custom_FutureBuilder(
      {super.key,
      required this.snapshot,
      required this.contextParam,
      required this.widgetParam,
      this.isDropDownButton});
  dynamic snapshot;
  dynamic contextParam;
  dynamic widgetParam;
  dynamic isDropDownButton;
  @override
  State<Custom_FutureBuilder> createState() => _Custom_FutureBuilderState();
}

resetAccount(dynamic contextParam) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //reset tai khoan mat khau
  // prefs.remove('matkhau');
  // prefs.remove('taikhoan');
  //update id thiết bị = null
  try {
    String url = await checkLocalConnectionApi();
    String logout = await Future.delayed(const Duration(seconds: 2), () async {
      return await updateIdThietBiNull(localNhanVien.nhanvien_id!, url);
    });
    if (logout == 'Success') {
      prefs.remove('odp');

     // WidgetsBinding.instance.addPostFrameCallback((_) {
        pageTransitionRemoveAll(
            contextParam,
            LoginScreen_MainPage(
              thongBao: 'Bạn đã hết phiên đăng nhập, vui lòng đăng nhập lại',
              //  prefs: prefs,
            ));
      //});
    } else {
      ShowDialog("Lỗi", "Vui lòng kiểm tra lại mạng hoặc đăng nhập lại", contextParam);
    }
  } catch (e) {
    ShowDialog(
        "Lỗi",
        'Lỗi không xác định vui lòng kiểm tra lại mạng hoặc liên hệ phòng DHNV',
        contextParam);
  }
}

class _Custom_FutureBuilderState extends State<Custom_FutureBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.snapshot.connectionState == ConnectionState.none) {
      return const Text('Không có kết nối mạng!');
    } else if (widget.snapshot.hasError) {
      try {
        throw widget.snapshot.error;
      } on Exception catch (e) {
        if (e.toString() == 'Exception: Unauthorized') {
          resetAccount(widget.contextParam);
          return const Text('Vui lòng đợi trong giây lát....');
        } else {
          return Text_medium_dark(
            title: 'Lỗi ${e.toString().replaceAll('Exception', '')}',
          );
        }
      } catch (e) {
        return Text_medium_dark(
          title: 'Lỗi ${e.toString()}',
        );
      }
    } else if (widget.snapshot.connectionState == ConnectionState.waiting ||
        widget.snapshot.data == null) {
      return widget.isDropDownButton == null
          ? Center(
              child: LoadingScreen(
              nameOfLoadingScreen: 'Đang tải...',
            ))
          : const Text('Đang tải danh sách đơn vị....');
    } else {
      return widget.widgetParam;
    }
  }
}
