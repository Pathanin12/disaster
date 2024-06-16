import 'dart:convert';
import 'dart:html';
import 'dart:io' as io;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as exel;

Future<void> createExcel() async {
  final exel.Workbook workbook = exel.Workbook(1);
  final exel.Worksheet sheetTransaction = workbook.worksheets[0];
  sheetTransaction.name = "รายงานภัยพิบัติ";
  final List<int> imageBytes = io.File('assets/logo/logo.png').readAsBytesSync();
  sheetTransaction.pictures.addStream(1, 1, imageBytes);
  sheetTransaction.tableCollection.create('Table1',  sheetTransaction.getRangeByName('A1:C4'))  ;
  sheetTransaction.getRangeByName('A1:A2').merge();

  sheetTransaction.getRangeByName('A1:A2').setText('no'.toUpperCase());
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  //Download the output file
  AnchorElement(
      href: "data:application/octet-stream;charset=utf-8;base64,${base64.encode(bytes)}")
    ..setAttribute("download", "userstopup.xlsx")
    ..click();
  // List<CellValue> dataList = [
  //   const TextCellValue('ลำดับที่'),
  //   const TextCellValue('ชื่อรายการ'),
  //   const TextCellValue('ประเภท'),
  //   const TextCellValue('วันที่รับเรื่อง'),
  //   const TextCellValue('หน่วยงานรับผิดชอบ'),
  //   const TextCellValue('พิกัด'),
  //   const TextCellValue('สถานะหน่วยงาน'),
  //   const TextCellValue('หน่วยงานที่เกี่ยวข้อง'),
  //   const TextCellValue('สถานะของหน่วยงานที่เกี่ยวข้อง'),
  //   const TextCellValue('สถานะของรายการ'),
  // ];

  // sheet.insertRowIterables(dataList, 0);
  //
  // for (Map<String, dynamic> row in jsonResponse) {
  //   sheet.appendRow([
  //     TextCellValue(row['ลำดับที่'].toString()),
  //     TextCellValue(row['ชื่อรายการ'].toString()),
  //     TextCellValue(row['ประเภท'].toString()),
  //     TextCellValue(row['วันที่รับเรื่อง'].toString()),
  //     TextCellValue(row['หน่วยงานรับผิดชอบ'].toString()),
  //     TextCellValue(row['พิกัด'].toString()),
  //     TextCellValue(row['สถานะหน่วยงาน'].toString()),
  //     TextCellValue(row['หน่วยงานที่เกี่ยวข้อง'].toString()),
  //     TextCellValue(row['สถานะของหน่วยงานที่เกี่ยวข้อง'].toString()),
  //     TextCellValue(row['สถานะของรายการ'].toString()),
  //   ]);
  // }
  //
  // // for web
  // var fileBytes = excel.save(fileName: 'output.xlsx');

  // for mobile
  // var fileBytes = excel.save();
  // String? directory = await FilePicker.platform.getDirectoryPath();
  // if (directory != null && fileBytes != null) {
  //   final File file = File('$directory/output.xlsx');
  //   if (file.existsSync()) {
  //     await file.delete();
  //   }
  //   await file.writeAsBytes(fileBytes);
  // }
}