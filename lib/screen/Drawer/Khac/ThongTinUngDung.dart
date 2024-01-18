// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ThongTinUngDungPage extends StatefulWidget {
  const ThongTinUngDungPage({super.key});

  @override
  State<ThongTinUngDungPage> createState() => _ThongTinUngDungPageState();
}

class _ThongTinUngDungPageState extends State<ThongTinUngDungPage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin ứng dụng'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/vnptangiang.jpg',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            Text(
              'Tên ứng dụng: ${_packageInfo.appName}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Phiên bản : ${_packageInfo.version}.${_packageInfo.buildNumber}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ứng dụng được phát triển bởi VNPT An Giang, Phòng Điều Hành - Nghiệp Vụ',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
