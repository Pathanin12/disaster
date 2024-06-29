// import 'dart:convert';
// //for web
// import 'dart:html' as html;
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:disaster/service/config.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
//
// import '../../../model/allfreeformmodel.dart';
//
//
// // for web
// void downloadFile(List<int> bytes, String downloadName) {
//   final blob = html.Blob([bytes]);
//   final url = html.Url.createObjectUrlFromBlob(blob);
//   html.AnchorElement(href: url)
//     ..setAttribute('download', downloadName)
//     ..click();
// }
//
//
// pw.Row _buildHeader(pw.Font ttf, pw.MemoryImage imageProvider,DateTime startDate,DateTime endDate,String type,String level,String province) {
//   return pw.Row(
//     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//     children: [
//       pw.Container(
//         height: 40,
//         width: 40,
//         child:   pw.Image(imageProvider),
//       ),
//       pw.SizedBox(
//         width: 5,
//       ),
//       pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.start,
//         children: [
//           pw.Text('กระทรวงมหาดไทย',
//               style: pw.TextStyle(font: ttf, fontSize: 18, lineSpacing: 0.2)),
//           pw.Text('Ministry of Interior. Thailand',
//               style: pw.TextStyle(font: ttf, fontSize: 12, lineSpacing: 0.2)),
//         ],
//       ),
//       pw.Expanded(
//         child: pw.Align(
//           alignment: pw.Alignment.centerRight,
//           child: pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.end,
//             children: [
//               pw.Text('รายงานสาธารณภัย',
//                   style: pw.TextStyle(font: ttf, fontSize: 14)),
//               pw.Text('ประเภท : ${type} ${(level!='จังหวัด')?'ระดับ : ประเทศ':'จังหวัด : ${province}'}',
//                   style: pw.TextStyle(font: ttf, fontSize: 12)),
//               pw.Text((startDate==endDate)?'${startDate.day} ${mountList[startDate.month-1]} ${startDate.year+543}':'${startDate.day} ${mountList[startDate.month-1]} ${startDate.year+543} - ${endDate.day} ${mountList[endDate.month-1]} ${endDate.year+543} ',
//                   style: pw.TextStyle(font: ttf, fontSize: 12)),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }
//
// pw.Widget _buildTableCell(String value, pw.Font ttf) {
//   return pw.Container(
//     padding: const pw.EdgeInsets.only(top: 5), // ปรับค่านี้ตามต้องการ
//     child: pw.Center(
//       child: pw.Text(value,
//           softWrap: true,
//           style: pw.TextStyle(
//             font: ttf,
//             fontSize: 10,
//           )),
//     ),
//   );
// }
//
// Future<void> createPDF(EventAllFreeFormModel? allEven,DateTime startDate,DateTime endDate,String type,String level,String province) async {
//   final pdf = pw.Document();
//   final ByteData fontData = await rootBundle.load('assets/fonts/THSarabunNew.ttf');
//   final ttf = pw.Font.ttf(fontData.buffer.asByteData());
//   final ByteData imageData = await rootBundle.load('assets/logo/logo.png');
//   final pw.MemoryImage imageProvider =
//   pw.MemoryImage(imageData.buffer.asUint8List());
//
//   List<String> status=[
//     "รับเรื่อง",
//     "กำลังดำเนินการ",
//     "เสร็จสิ้น"
//   ];
//
//   pdf.addPage(
//     pw.MultiPage(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) => [
//         _buildHeader(ttf, imageProvider,startDate,endDate,type,level,province),
//         pw.SizedBox(height: 10),
//         pw.Table(
//           columnWidths: {
//             0: const pw.FlexColumnWidth(1),
//             1: const pw.FlexColumnWidth(3),
//             2: const pw.FlexColumnWidth(2),
//             3: const pw.FlexColumnWidth(2),
//             4: const pw.FlexColumnWidth(2),
//             5: const pw.FlexColumnWidth(2),
//             7: const pw.FlexColumnWidth(2),
//             8: const pw.FlexColumnWidth(2),
//             9: const pw.FlexColumnWidth(2),
//           },
//           children: [
//             pw.TableRow(
//               decoration: const pw.BoxDecoration(
//                 border: pw.Border(
//                   bottom: pw.BorderSide(color: PdfColors.grey300, width: 0.5),
//                 ),
//               ),
//               verticalAlignment: pw.TableCellVerticalAlignment.middle,
//               children: [
//                 _buildTableCell('ลำดับที่', ttf),
//                 _buildTableCell('ชื่อรายการ', ttf),
//                 _buildTableCell('วันที่รับเรื่อง', ttf),
//                 _buildTableCell('หน่วยงาน\nรับผิดชอบ', ttf),
//                 _buildTableCell('พิกัด', ttf),
//                 _buildTableCell('สถานะหน่วยงาน', ttf),
//                 _buildTableCell('สถานะรายการ', ttf),
//               ],
//             ),
//             for (var row in allEven!.eventList!)
//               pw.TableRow(
//                 children: [
//                   _buildTableCell(row.seq!.toString(), ttf),
//                   _buildTableCell(row.eventName!, ttf),
//                   _buildTableCell('${DateTime.parse(row.datetime!).day} ${mountAbbreviation[DateTime.parse(row.datetime!).month-1]} ${DateTime.parse(row.datetime!).year+543}', ttf),
//                   _buildTableCell(row.responsibleAgency!, ttf),
//                   _buildTableCell('${row.latitude},${row.longitude}', ttf),
//                   _buildTableCell(status[row.statusAgency!], ttf),
//                   _buildTableCell(status[row.statusItem!], ttf),
//                 ],
//               ),
//           ],
//         ),
//       ],
//     ),
//   );
//   // for web
//   final bytes = await pdf.save();
//   downloadFile(bytes, 'รายงานภัยพิบัติ.pdf');
//
//   // for mobile
//   // List<int> bytes = await pdf.save();
//   // String? directory = await FilePicker.platform.getDirectoryPath();
//   // if (directory != null) {
//   //   final File file = File('$directory/output.pdf');
//   //   if (file.existsSync()) {
//   //     await file.delete();
//   //   }
//   //   await file.writeAsBytes(bytes);
//   // }
// }