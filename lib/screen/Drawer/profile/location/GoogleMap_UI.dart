// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vnptapp/Components/Custom_SizedBox.dart';
import 'package:vnptapp/Components/LoadingScreen.dart';
import 'package:vnptapp/Models/LongLatPosition.dart';
import 'GoogleMap_Logic.dart';

// ignore: camel_case_types
class GoogleMap_UI extends StatefulWidget {
  const GoogleMap_UI({super.key});

  @override
  State<GoogleMap_UI> createState() => _GoogleMap_UIState();
}

bool isLoading = false;
String currentAddress = "";
String long = "";
String lat = "";
late LocationPermission permission;

// ignore: camel_case_types
class _GoogleMap_UIState extends State<GoogleMap_UI> {
  @override
  void initState() {
    super.initState();
  }

  void getAddressAndOpenGoogleMap() async {
    setState(() {
      isLoading = true;
    });
    LongLatPosition position = await determinePosition();
    setState(() {
      isLoading = false;
    });
    openGoogleMap(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bản đồ', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey[100],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: isLoading
          ? LoadingScreen(
              nameOfLoadingScreen: "Đang tải",
            )
          : Center(
              child: SingleChildScrollView(
                  child: Column(
              children: [
                FutureBuilder(
                  future: determinePosition(),
                  builder: (context1, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingScreen(
                        nameOfLoadingScreen: 'Đang lấy vị trí',
                      );
                    } else if (snapshot.hasError) {
                      return Text('Có lỗi xảy ra: ${snapshot.error}');
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Vị trí của bạn là'),
                            const MediumHeightSizedBox(),
                            Text('Long:${snapshot.data!.long} '),
                            const MediumHeightSizedBox(),
                            Text('Lat:${snapshot.data!.lat}'),
                            const MediumHeightSizedBox(),
                            Text('Địa chỉ : ${snapshot.data!.diaDiem} '),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Flexible(
                                //     child: ElevatedButton(
                                //   onPressed: () async {
                                //     if (mounted) {
                                //       setState(() {
                                //         isLoading = true;
                                //       });
                                //       // try {
                                //       //   int isSaveLongLat = await updateLongLat(
                                //       //           localUser,
                                //       //           snapshot.data!.long,
                                //       //           snapshot.data!.lat,
                                //       //           snapshot.data!.diaDiem)
                                //       //       .timeout(Duration(
                                //       //           seconds: waitOfTimeOut()));
                                //       //   setState(() {
                                //       //     isLoading = false;
                                //       //   });
                                //       //   if (isSaveLongLat == 200) {
                                //       //     // ignore: use_build_context_synchronously
                                //       //     ScaffoldMessenger.of(context)
                                //       //         .showSnackBar(Custom_snackBar(
                                //       //             'Lưu thành công'));
                                //       //   } else {
                                //       //     // ignore: use_build_context_synchronously
                                //       //     DecryptResponse(context, isSaveLongLat);
                                //       //   }
                                //       // } catch (e) {
                                //       //   // ignore: use_build_context_synchronously
                                //       //   ShowDialog(
                                //       //       'Lỗi', 'Không có kết nối!', context);
                                //       // }
                                //       setState(() {
                                //         isLoading = false;
                                //       });
                                //     }
                                //   },
                                //   child: const Text( 'Lưu vị trí'),
                                // )),
                                const MediumHeightSizedBox(),
                                ElevatedButton(
                                  onPressed: () {
                                    openGoogleMap(snapshot.data!);
                                  },
                                  child: const Text('Xem bằng Google Map'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ))),
    );
  }
}
