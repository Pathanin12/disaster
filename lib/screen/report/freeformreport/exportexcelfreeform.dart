import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';

import '../../../model/allfreeformmodel.dart';

Future<void> createExcel(EventAllFreeFormModel? allEven,DateTime startDate,DateTime endDate,String type,String level,String province) async {
  var excel = Excel.createExcel();


  String jsonString = await rootBundle.loadString('data/data.json');
  final jsonResponse = jsonDecode(jsonString);

  Sheet sheet = excel['Output'];
  excel.delete('Sheet1');
  for (int i = 1; i <= 9; i++) {
    sheet.setColumnAutoFit(i);
  }

  List<CellValue> titleSection1 = [
    const TextCellValue('กระทรวงมหาดไทย'),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue('รายงานสาธารณะภัย'),
  ];
  List<CellValue> titleSection2 = [
    const TextCellValue('Ministry of Interior. Thailand'),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue('ประเภท : อัคคีภัย ระดับ : ประเทศ'),
  ];

  List<CellValue> titleSection3 = [
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue(''),
    const TextCellValue('12 พฤษภาคม 2567 - 13 พฤษภาคม 2567'),
  ];
  List<String> category = [
    "อัคคีภัย",
    "อุทกภัย",
    "วาตภัย",
    "ไฟป่า"
  ];
  List<String> status=[
    "รับเรื่อง",
    "กำลังดำเนินการ",
    "เสร็จสิ้น"
  ];

  List<CellValue> dataList = [
    const TextCellValue('ลำดับที่'),
    const TextCellValue('ชื่อรายการ'),
    const TextCellValue('วันที่รับเรื่อง'),
    const TextCellValue('หน่วยงานรับผิดชอบ'),
    const TextCellValue('พิกัด'),
    const TextCellValue('สถานะหน่วยงาน'),
    const TextCellValue('สถานะของรายการ'),
  ];

  // sheet.insertRowIterables(
  //   titleSection1,
  //   0,
  // );
  // sheet.insertRowIterables(titleSection2, 1);
  // sheet.insertRowIterables(titleSection3, 2);
  sheet.insertRowIterables(dataList, 0);

  for (EventList row in allEven!.eventList!) {
    sheet.appendRow([
      TextCellValue(row.seq.toString()),
      TextCellValue(row.eventName.toString()),
      TextCellValue(row.datetime.toString()),
      TextCellValue(row.responsibleAgency.toString()??''),
      TextCellValue('${row.latitude},${row.longitude}'),
      TextCellValue(status[row.statusAgency!]),
      TextCellValue(status[row.statusItem!]),
    ]);
  }

  sheet.setColumnWidth(0, 25);

  // for web
  var fileBytes = excel.save(fileName: 'output.xlsx');

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