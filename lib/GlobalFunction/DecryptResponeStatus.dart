// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vnptapp/Components/Custom_ShowDialog.dart';
// ignore: non_constant_identifier_names
 DecryptResponse(BuildContext context, statusCode) {
  if (statusCode == 404) {
    ShowDialog('Lỗi', 'Không tìm thấy thông tin', context);
  } else if (statusCode == 503) {
    ShowDialog('Lỗi', 'Lỗi kết nối mạng(503)', context);
  } else if (statusCode == 0) {
    ShowDialog('Lỗi', 'Lỗi kết nối mạng', context);
  } else if (statusCode == 400) {
    ShowDialog('Lỗi', 'Sai thông tin', context);
  } else if(statusCode==-2){
    ShowDialog('Lỗi', 'Tài khoản đã bị khóa', context);
  } 
   else {
    ShowDialog('Lỗi', 'Kiểm tra lại internet và thông tin', context);
  }
}

