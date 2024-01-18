// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:vnptapp/Components/Custom_AppBar.dart';
import 'package:vnptapp/Components/Custom_Text.dart';
import 'package:vnptapp/GlobalFunction/InternetChecker.dart';
// class PDFViwer extends StatefulWidget {
//   final String url;
//   final String title;
//   const PDFViwer({Key? key, required this.url, required this.title})
//       : super(key: key);
//   @override
//   // ignore: library_private_types_in_public_api
//   _PDFViwerState createState() => _PDFViwerState();
// }
// class _PDFViwerState extends State<PDFViwer> {
//   String? pdfPath;
//   String path = '';
//   var docUrl = '';
//   Future<File> loadPDF() async {
//     try {
//       docUrl = await FirebaseStorage.instance
//           .ref()
//           .child('/camnang')
//           .child(widget.url)
//           .getDownloadURL();
//     } catch (e) {
//       return File(pdfPath!);
//     }
//     return await DefaultCacheManager().getSingleFile(docUrl);
//   }
//   Future<String> getFilePath() async {
//     final file = await loadPDF();
//     path = file.path;
//     return path;
//   }
//   @override
//   void initState() {
//     super.initState();
//     loadPDF();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(
//                 Icons.arrow_back,
//               )),
//         ),
//         body: //kiểm tra kết nối internet
//             FutureBuilder(
//           future: InternetChecker(),
//           builder: (context, snapshot) {
//             if (snapshot.data == true) {
//               return FutureBuilder<File>(
//                 future: loadPDF(),
//                 builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done &&
//                       snapshot.hasData) {
//                     return PdfView(
//                       path: snapshot.data!.path,
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   } else {
//                     return LoadingSreen(
//                       nameOfLoadingScreen: 'Đang tải PDF',
//                     );
//                   }
//                 },
//               );
//             } else {
//               return const Text('Không có kết nối internet!');
//             }
//           },
//         ));
//   }
// }
// ignore: must_be_immutable
class PDF_Viewer_WithURL extends StatefulWidget {
  PDF_Viewer_WithURL({super.key, required this.urlString, required this.title});
  String urlString;
  String title;

  @override
  State<PDF_Viewer_WithURL> createState() => _PDF_Viewer_WithURLState();
}

class _PDF_Viewer_WithURLState extends State<PDF_Viewer_WithURL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Custom_AppBar(title: widget.title),
        body: FutureBuilder(
          future: checkLocalConnection(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Text_huge_dark(title: 'Đang tải....');
            } else {
             // print(snapshot.data! + widget.urlString);
              return SfPdfViewer.network(
                snapshot.data! + widget.urlString,
              );
            }
          },
        ));
  }
}