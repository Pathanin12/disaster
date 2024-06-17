import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';

Future<void> createExcel() async {
  var excel = Excel.createExcel();
  // var sheet1rtl = excel['Sheet1'].isRTL;

  String jsonString = await rootBundle.loadString('data/data.json');
  final jsonResponse = jsonDecode(jsonString);

  Sheet sheet = excel['Output'];
  excel.delete('Sheet1');
  List<CellValue> dataList = [
    const TextCellValue('ลำดับที่'),
    const TextCellValue('ชื่อรายการ'),
    const TextCellValue('ประเภท'),
    const TextCellValue('วันที่รับเรื่อง'),
    const TextCellValue('หน่วยงานรับผิดชอบ'),
    const TextCellValue('พิกัด'),
    const TextCellValue('สถานะหน่วยงาน'),
    const TextCellValue('หน่วยงานที่เกี่ยวข้อง'),
    const TextCellValue('สถานะของหน่วยงานที่เกี่ยวข้อง'),
    const TextCellValue('สถานะของรายการ'),
  ];

  sheet.insertRowIterables(dataList, 0);

  for (Map<String, dynamic> row in jsonResponse) {
    sheet.appendRow([
      TextCellValue(row['ลำดับที่'].toString()),
      TextCellValue(row['ชื่อรายการ'].toString()),
      TextCellValue(row['ประเภท'].toString()),
      TextCellValue(row['วันที่รับเรื่อง'].toString()),
      TextCellValue(row['หน่วยงานรับผิดชอบ'].toString()),
      TextCellValue(row['พิกัด'].toString()),
      TextCellValue(row['สถานะหน่วยงาน'].toString()),
      TextCellValue(row['หน่วยงานที่เกี่ยวข้อง'].toString()),
      TextCellValue(row['สถานะของหน่วยงานที่เกี่ยวข้อง'].toString()),
      TextCellValue(row['สถานะของรายการ'].toString()),
    ]);
  }

  // for web
  // var fileBytes = excel.save(fileName: 'output.xlsx');

  // for mobile
  var fileBytes = excel.save();
  String? directory = await FilePicker.platform.getDirectoryPath();
  if (directory != null && fileBytes != null) {
    final File file = File('$directory/output.xlsx');
    if (file.existsSync()) {
      await file.delete();
    }
    await file.writeAsBytes(fileBytes);
  }
}