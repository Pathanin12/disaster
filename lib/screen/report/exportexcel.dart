import 'dart:convert';
import 'dart:io';
import 'package:excel/excel.dart';

import '../../model/getalleventmodel.dart';

Future<void> createExcel(GetAllEventModel allEven, DateTime startDate,
    DateTime endDate, String type, String level, String province) async {
  var excel = Excel.createExcel();
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
  List<String> category = ["อัคคีภัย", "อุทกภัย", "วาตภัย", "ไฟป่า"];
  List<String> status = ["รับเรื่อง", "กำลังดำเนินการ", "เสร็จสิ้น"];

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

  // sheet.insertRowIterables(
  //   titleSection1,
  //   0,
  // );
  // sheet.insertRowIterables(titleSection2, 1);
  // sheet.insertRowIterables(titleSection3, 2);
  sheet.insertRowIterables(dataList, 0);

  for (EventList row in allEven.eventList!) {
    sheet.appendRow([
      TextCellValue(row.seq.toString()),
      TextCellValue(row.eventName.toString()),
      TextCellValue(category[row.disasterType!].toString()),
      TextCellValue(row.datetime.toString()),
      TextCellValue(row.responsibleAgency.toString() ?? ''),
      TextCellValue('${row.latitude.toString()},${row.longitude.toString()}'),
      TextCellValue(status[row.statusRelatedAgency!].toString()),
      TextCellValue(row.relatedAgency!.toString()),
      TextCellValue(status[row.statusAgency!].toString()),
      TextCellValue(status[row.statusItem!].toString()),
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
