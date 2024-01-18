// ignore_for_file: file_names, non_constant_identifier_names

import 'package:intl/intl.dart';

// String dateTimeFormatDHGH(DateTime datetime){
//   String formattedDateTime = DateFormat('HH:mm dd/MM/yyyy').format(datetime);
//   return formattedDateTime // In ra: "HH:mm dd/MM/yyyy" format của ngày và giờ hiện tại
// }



// double chia2SoInt(int? dividend, int? divisor) {
//   if (dividend == null || divisor == null || divisor == 0) {
//     return 0; // hoặc trả về một giá trị mặc định khác tùy thuộc vào yêu cầu của bạn
//   }

//   return dividend / divisor.toDouble() *100; // Chuyển divisor thành double và thực hiện phép chia
// }

// DateTime soSanh3DateTime(DateTime dateTime1, DateTime dateTime2, DateTime dateTime3) {
//   List<DateTime> dateTimes = [dateTime1, dateTime2, dateTime3];
//   dateTimes.sort((a, b) => b.compareTo(a));
//   return dateTimes.first;
// }
// DateTime soSanh2DateTime(DateTime dateTime1, DateTime dateTime2) {
//   return dateTime1.isAfter(dateTime2) ? dateTime1 : dateTime2;
// }
String timeKeyToMonthYear(String inputString) {
  // Chia chuỗi thành năm và tháng
  try {
    String yearPart = inputString.substring(0, 4);
    String monthPart = inputString.substring(4, 6);
    // Tạo chuỗi mới theo định dạng "MM/YYYY"
    String resultString = "$monthPart/$yearPart";
    return resultString;
  } catch (e) {
    return inputString;
  }
}

// String minusOneYear(String thisYear, String thisMonth) {
//   int? number = int.tryParse(thisMonth);
//   if (number == null) {
//     return thisMonth;
//   }
//   number--;
//   if (number == 0) {
//     int? year = int.tryParse(thisYear);
//     if (year == null) {
//       return thisYear;
//     } else {
//       year--;
//     }
//     return year.toString();
//   } else {
//     return thisYear;
//   }
// }

// String minusOneMonth(String thisMonth) {
//   int? number = int.tryParse(thisMonth);
//   if (number == null) {
//     return thisMonth;
//   }
//   number--;
//   if (number == 0) {
//     number = 12;
//   }
//   String resultString = convertMonth(number);
//   return resultString;
// }

String convertMonth(int month) {
  if (month < 10) {
    return '0${month.toString()}';
  } else {
    return month.toString();
  }
}

String convertMonthString(String month) {
  month == "null" ? month = DateTime.now().month.toString() : month = month;
  if (int.parse(month) < 10) {
    return '0${month.toString()}';
  } else {
    return month.toString();
  }
}

String covertDatetime(String datetime) {
  DateTime date = DateTime.parse(datetime);
  return DateFormat("dd/MM/yyyy").format(date);
}

String convertYearMonth(String dateTime) {
  return dateTime.replaceRange(4, 4, "/");
}

String formatNumber(var number) {
  return NumberFormat('#,###').format(number);
}

String formatString(var stringValue) {
  if (stringValue == '') {
    return 'Không có';
  }
  return stringValue.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},');
}

String DateTimeFormated(String inputDate) {
  try {
    DateTime convertToDate = DateTime.parse(inputDate);
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(convertToDate);
  } catch (e) {
    // print("Lỗi: $e");
    throw Exception('Date format error');
  }
}
