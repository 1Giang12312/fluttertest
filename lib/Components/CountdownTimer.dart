// // ignore_for_file: file_names

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:vnptapp/screen/ODPScreen/ODPScreen_MainPage.dart';

// class CountdownTimer extends StatefulWidget {
//   const CountdownTimer({Key? key, this.timeRemain, this.title, this.endTitle})
//       : super(key: key);
//   final int? timeRemain;
//   final String? title;
//   final String? endTitle;
//   @override
//   // ignore: library_private_types_in_public_api
//   _CountdownTimerState createState() => _CountdownTimerState();
// }

// class _CountdownTimerState extends State<CountdownTimer> {
//   late int _secondsRemaining = widget.timeRemain!;
//   late Timer _timer;
//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   void startTimer() {
//     const oneSecond = Duration(seconds: 1);
//     _timer = Timer.periodic(oneSecond, (timer) {
//       if (_secondsRemaining == 0) {
//         timer.cancel(); // Hủy bỏ timer nếu đếm ngược hoàn thành
//         // Gửi lại mã
//       } else {
//         setState(() {
//           _secondsRemaining--;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _secondsRemaining != 0
//         ? Text(
//              '${widget.title!} $_secondsRemaining giây',
//           )
//         : TextButton(
//             onPressed: () {
//               //gửi lại mã OTP
//               //sendAndSaveOTP(localUser.SoDienThoai!);
//               setState(() {
//                 Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(builder: (context) => const OTPScreen_MainPage()),
//                   (route) => false, // Xóa hết các trang khỏi ngăn xếp
//                 );
//               });
//             },
//             child: Text( widget.endTitle!),
//           );
//   }

//   @override
//   void dispose() {
//     _timer.cancel(); // Hủy bỏ timer khi widget bị huỷ
//     super.dispose();
//   }
// }
