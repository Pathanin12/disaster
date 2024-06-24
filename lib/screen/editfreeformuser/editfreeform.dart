import 'package:disaster/stye/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as cu;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
// import 'package:vph_web_date_picker/vph_web_date_picker.dart';
import '../../../../stye/font.dart';
import '../../model/createeventfreeform.dart';
import '../../model/freeformbyidmodel.dart';
import 'controllereditfreeform.dart';

class EditListFreeFormOthers extends StatefulWidget {
  EditListFreeFormOthers({super.key});

  @override
  State<EditListFreeFormOthers> createState() => _EditListFreeFormOthersState();
}

class _EditListFreeFormOthersState extends State<EditListFreeFormOthers> {
  bool _valueCheck = false;
  @override
  Widget build(BuildContext context) {
    final ContollerEditOthersList contoller =
        Get.put(ContollerEditOthersList(), permanent: false);
    return ListView(
      children: [
        Form(
          // key: contoller.textFieldKey.value,
          child: Column(
            children: [
              Container(
                  color: colorBackground,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 150, top: 20),
                  child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 20,
                              child: Text(
                                  (contoller.dataEditEvent.value.events == null)
                                      ? 'สร้างรายการอื่นๆ'
                                      : 'แก้ไขรายงาน',
                                  style: textStyle(context,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ชื่อรายการ',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 40,
                                        color: colorWhite,
                                        child: TextFormField(
                                          controller: contoller.nameCon.value,
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: colorBlack,
                                              fontWeight: FontWeight.w400),
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "ชื่อรายการ",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
                                                color: colorGrey,
                                                fontWeight: FontWeight.w400),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: colorGrey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(flex: 5, child: Container()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'วันที่รับเรื่อง',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: (contoller
                                                  .dataEditEvent.value.events ==
                                              null)
                                          ? const SizedBox()
                                          : Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'สถานะของรายการ',
                                                style: textStyle(context,
                                                    color: colorBlack,
                                                    fontSize: 13),
                                              )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: InkWell(
                                        onTap: () async {
                                          DateTime? newDateTime =
                                              await showRoundedDatePicker(
                                            theme: ThemeData(
                                              primaryColor: Colors.amberAccent,
                                            ),
                                            styleDatePicker:
                                                MaterialRoundedDatePickerStyle(
                                              textStyleCurrentDayOnCalendar:
                                                  const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textStyleDayOnCalendar:
                                                  const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                              textStyleDayOnCalendarSelected:
                                                  const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textStyleDayOnCalendarDisabled:
                                                  TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black
                                                          .withOpacity(0.1)),
                                              textStyleMonthYearHeader:
                                                  const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              sizeArrow: 50,
                                              colorArrowNext: Colors.black,
                                              colorArrowPrevious: Colors.black,
                                              marginLeftArrowPrevious: 16,
                                              marginTopArrowPrevious: 16,
                                              marginTopArrowNext: 16,
                                              marginRightArrowNext: 32,
                                              textStyleButtonAction:
                                                  const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                              textStyleButtonPositive:
                                                  const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.amber,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textStyleButtonNegative:
                                                  TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black45
                                                          .withOpacity(0.5)),
                                              decorationDateSelected:
                                                  const BoxDecoration(
                                                      color: Colors.amber,
                                                      shape: BoxShape.circle),
                                            ),
                                            styleYearPicker:
                                                MaterialRoundedYearPickerStyle(
                                              textStyleYear: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.black),
                                              textStyleYearSelected:
                                                  const TextStyle(
                                                      fontSize: 40,
                                                      color: Colors.black45,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              heightYearRow: 100,
                                            ),
                                            context: context,
                                            locale: const Locale("th", "TH"),
                                          );
                                          if (newDateTime != null) {
                                            contoller.date.value = newDateTime
                                                .toString()
                                                .split(" ")[0];
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 5),
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: colorWhite,
                                              border: Border.all(
                                                color: Colors.black26,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  contoller.date.value,
                                                  style: textStyle(context,
                                                      fontSize: 13,
                                                      color: colorBlack),
                                                ),
                                                const Icon(
                                                  Icons.date_range,
                                                  size: 20,
                                                  color: Colors.grey,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: (contoller
                                                  .dataEditEvent.value.events ==
                                              null)
                                          ? const SizedBox()
                                          : Container(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 5),
                                              width: double.infinity,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: colorWhite,
                                                  border: Border.all(
                                                    color: Colors.black26,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: double.infinity,
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child:
                                                      DropdownButton2<String>(
                                                    dropdownStyleData:
                                                        DropdownStyleData(
                                                      maxHeight: 300,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      scrollbarTheme:
                                                          ScrollbarThemeData(
                                                        radius: const Radius
                                                            .circular(5),
                                                        thickness:
                                                            MaterialStateProperty
                                                                .all<double>(6),
                                                        thumbVisibility:
                                                            MaterialStateProperty
                                                                .all<bool>(
                                                                    true),
                                                      ),
                                                    ),
                                                    autofocus: true,
                                                    isExpanded: true,
                                                    value: contoller
                                                        .selectStatusList!
                                                        .value,
                                                    hint: Text(
                                                      'เลือกทั้งหมด',
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    items: contoller
                                                        .StatusList.map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String? value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value!,
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                              fontSize: 13.0,
                                                              color: colorBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    iconStyleData:
                                                        const IconStyleData(
                                                            icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 24,
                                                    )),
                                                    onChanged: (valueSelect) {
                                                      contoller
                                                          .selectStatusList!
                                                          .value = valueSelect!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // วันที่รับเรื่อง
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'หน่วยงานที่รับผิดชอบ',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: (contoller
                                                  .dataEditEvent.value.events ==
                                              null)
                                          ? const SizedBox()
                                          : Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'สถานะหน่วยงานที่รับผิดชอบ',
                                                style: textStyle(context,
                                                    color: colorBlack,
                                                    fontSize: 13),
                                              )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 40,
                                        color: colorWhite,
                                        child: TextFormField(
                                          controller:
                                              contoller.responsible.value,
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: colorBlack,
                                              fontWeight: FontWeight.w400),
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "หน่วยงานที่รับผิดชอบ",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
                                                color: colorGrey,
                                                fontWeight: FontWeight.w400),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: colorGrey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: (contoller
                                                  .dataEditEvent.value.events ==
                                              null)
                                          ? const SizedBox()
                                          : Container(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 5),
                                              width: double.infinity,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: colorWhite,
                                                  border: Border.all(
                                                    color: Colors.black26,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                width: double.infinity,
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child:
                                                      DropdownButton2<String>(
                                                    dropdownStyleData:
                                                        DropdownStyleData(
                                                      maxHeight: 300,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      scrollbarTheme:
                                                          ScrollbarThemeData(
                                                        radius: const Radius
                                                            .circular(5),
                                                        thickness:
                                                            MaterialStateProperty
                                                                .all<double>(6),
                                                        thumbVisibility:
                                                            MaterialStateProperty
                                                                .all<bool>(
                                                                    true),
                                                      ),
                                                    ),
                                                    autofocus: true,
                                                    isExpanded: true,
                                                    value: contoller
                                                        .selectStatusResponsible!
                                                        .value,
                                                    hint: Text(
                                                      'เลือกทั้งหมด',
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          color: colorGrey,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    items: contoller
                                                        .StatusResponsible.map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String? value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value!,
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                              fontSize: 13.0,
                                                              color: colorBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    iconStyleData:
                                                        const IconStyleData(
                                                            icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 24,
                                                    )),
                                                    onChanged: (valueSelect) {
                                                      contoller
                                                          .selectStatusResponsible!
                                                          .value = valueSelect!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (contoller.dataEditEvent.value.events != null)
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: contoller.dataEditEvent.value.events!
                                  .freeFormDetailList!.length,
                              itemBuilder: (context, index) {
                                return (contoller.dataEditEvent.value.events!
                                            .freeFormDetailList![index].types ==
                                        0)
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              contoller
                                                  .dataEditEvent
                                                  .value
                                                  .events!
                                                  .freeFormDetailList![index]
                                                  .section!,
                                              style: textStyle(context,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20, right: 5),
                                                    width: double.infinity,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        color: colorWhite,
                                                        border: Border.all(
                                                          color: Colors.black26,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    alignment: Alignment.center,
                                                    child: SizedBox(
                                                        width: double.infinity,
                                                        child: Obx(
                                                          () =>
                                                              DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton2<
                                                                    String>(
                                                              dropdownStyleData:
                                                                  DropdownStyleData(
                                                                maxHeight: 300,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                scrollbarTheme:
                                                                    ScrollbarThemeData(
                                                                  radius: const Radius
                                                                      .circular(
                                                                      5),
                                                                  thickness:
                                                                      MaterialStateProperty
                                                                          .all<double>(
                                                                              6),
                                                                  thumbVisibility:
                                                                      MaterialStateProperty.all<
                                                                              bool>(
                                                                          true),
                                                                ),
                                                              ),
                                                              autofocus: true,
                                                              isExpanded: true,
                                                              value: contoller
                                                                  .listAnswer[
                                                                      index]
                                                                  .dropdown!
                                                                  .value,
                                                              hint: Text(
                                                                'ตัวเลือก',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.0,
                                                                    color:
                                                                        colorGrey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              items: contoller
                                                                  .listAnswer[
                                                                      index]
                                                                  .dropdown!
                                                                  .listoption!
                                                                  .map<
                                                                      DropdownMenuItem<
                                                                          String>>((String?
                                                                      value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value!,
                                                                  child: Text(
                                                                    value,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        color:
                                                                            colorBlack,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                );
                                                              }).toList(),
                                                              iconStyleData:
                                                                  const IconStyleData(
                                                                      icon:
                                                                          Icon(
                                                                Icons
                                                                    .keyboard_arrow_down,
                                                                size: 24,
                                                              )),
                                                              onChanged:
                                                                  (valueSelect) {
                                                                contoller
                                                                        .listAnswer[
                                                                            index]
                                                                        .dropdown!
                                                                        .value =
                                                                    valueSelect!;
                                                                contoller
                                                                    .listAnswer[
                                                                        index]
                                                                    .dropdown!
                                                                    .valueID = contoller
                                                                        .listAnswer[
                                                                            index]
                                                                        .dropdown!
                                                                        .listoptionID![
                                                                    contoller
                                                                        .listAnswer[
                                                                            index]
                                                                        .dropdown!
                                                                        .listoption!
                                                                        .indexOf(
                                                                            valueSelect)];
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 5,
                                                  child: SizedBox(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            cu.Divider(
                                              height: 1,
                                              color: Colors.grey.shade200,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      )
                                    : (contoller
                                                .dataEditEvent
                                                .value
                                                .events!
                                                .freeFormDetailList![index]
                                                .types ==
                                            1)
                                        ? Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  contoller
                                                      .dataEditEvent
                                                      .value
                                                      .events!
                                                      .freeFormDetailList![
                                                          index]
                                                      .section!,
                                                  style: textStyle(context,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  children: listCheckBox(
                                                      context,
                                                      index,
                                                      contoller
                                                          .dataEditEvent
                                                          .value
                                                          .events!
                                                          .freeFormDetailList![
                                                              index]
                                                          .freeFormSubDetailList!
                                                          .length),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                cu.Divider(
                                                  height: 1,
                                                  color: Colors.grey.shade200,
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                              ],
                                            ),
                                          )
                                        : (contoller
                                                    .dataEditEvent
                                                    .value
                                                    .events!
                                                    .freeFormDetailList![index]
                                                    .types ==
                                                2)
                                            ? Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      contoller
                                                          .dataEditEvent
                                                          .value
                                                          .events!
                                                          .freeFormDetailList![
                                                              index]
                                                          .section!,
                                                      style: textStyle(context,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: contoller
                                                          .dataEditEvent
                                                          .value
                                                          .events!
                                                          .freeFormDetailList![
                                                              index]
                                                          .freeFormSubDetailList!
                                                          .length,
                                                      itemBuilder: (context,
                                                          indexRadio) {
                                                        return Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                cu.Radio(
                                                                    value: contoller
                                                                            .listAnswer[
                                                                                index]
                                                                            .radio!
                                                                            .listoptionID![
                                                                        indexRadio],
                                                                    groupValue: contoller
                                                                        .listAnswer[
                                                                            index]
                                                                        .radio!
                                                                        .valueID,
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                        contoller
                                                                            .listAnswer[index]
                                                                            .radio!
                                                                            .valueID = value!;
                                                                      });
                                                                    }),
                                                                const SizedBox(
                                                                  width: 15,
                                                                ),
                                                                Text(
                                                                  contoller
                                                                      .listAnswer[
                                                                          index]
                                                                      .radio!
                                                                      .listoption![indexRadio],
                                                                  style: textStyle(
                                                                      context,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          13),
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    cu.Divider(
                                                      height: 1,
                                                      color:
                                                          Colors.grey.shade200,
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : (contoller
                                                        .dataEditEvent
                                                        .value
                                                        .events!
                                                        .freeFormDetailList![
                                                            index]
                                                        .types ==
                                                    3)
                                                ? Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          contoller
                                                              .dataEditEvent
                                                              .value
                                                              .events!
                                                              .freeFormDetailList![
                                                                  index]
                                                              .section!,
                                                          style: textStyle(
                                                              context,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 5,
                                                              child: Container(
                                                                height: 120,
                                                                color:
                                                                    colorWhite,
                                                                child:
                                                                    TextFormField(
                                                                  maxLines: 30,
                                                                  controller: contoller
                                                                      .listAnswer[
                                                                          index]
                                                                      .textfield!
                                                                      .value,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      color:
                                                                          colorBlack,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                  decoration:
                                                                      InputDecoration(
                                                                    fillColor:
                                                                        colorWhite,
                                                                    hintText: contoller
                                                                        .dataEditEvent
                                                                        .value
                                                                        .events!
                                                                        .freeFormDetailList![
                                                                            index]
                                                                        .section!,
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                            13.0,
                                                                        color:
                                                                            colorGrey,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                    filled:
                                                                        true,
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color:
                                                                            colorGrey,
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            const Expanded(
                                                              flex: 5,
                                                              child: SizedBox(),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        cu.Divider(
                                                          height: 1,
                                                          color: Colors
                                                              .grey.shade200,
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : (contoller
                                                            .dataEditEvent
                                                            .value
                                                            .events!
                                                            .freeFormDetailList![
                                                                index]
                                                            .types ==
                                                        4)
                                                    ? Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              contoller
                                                                  .dataEditEvent
                                                                  .value
                                                                  .events!
                                                                  .freeFormDetailList![
                                                                      index]
                                                                  .section!,
                                                              style: textStyle(
                                                                  context,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            if (contoller
                                                                        .listAnswer[
                                                                            index]
                                                                        .image!
                                                                        .value !=
                                                                    null &&
                                                                contoller
                                                                        .listAnswer[
                                                                            index]
                                                                        .image!
                                                                        .value !=
                                                                    '')
                                                              Container(
                                                                height: 250,
                                                                width: 300,
                                                                decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: NetworkImage(
                                                                          contoller
                                                                              .listAnswer[index]
                                                                              .image!
                                                                              .value!,
                                                                        ),
                                                                        fit: BoxFit.cover)),
                                                              ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            DottedBorder(
                                                              color: Colors.grey
                                                                  .shade300,
                                                              dashPattern: [
                                                                8,
                                                                4
                                                              ],
                                                              strokeWidth: 2,
                                                              radius:
                                                                  const Radius
                                                                      .circular(
                                                                      5),
                                                              borderType:
                                                                  BorderType
                                                                      .RRect,
                                                              strokeCap:
                                                                  StrokeCap
                                                                      .round,
                                                              child: cu.InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await contoller
                                                                      .selectedFileSingle(
                                                                          context,
                                                                          type:
                                                                              4,
                                                                          index:
                                                                              index);
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          colorWhite,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  width: 220,
                                                                  height: 80,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: 50,
                                                                    width: 180,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade200),
                                                                    ),
                                                                    child: Text(
                                                                      'เลือกรูป',
                                                                      style: textStyle(
                                                                          context,
                                                                          color:
                                                                              colorBlue,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                            cu.Divider(
                                                              height: 1,
                                                              color: Colors.grey
                                                                  .shade200,
                                                            ),
                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    :  (contoller
                                    .dataEditEvent
                                    .value
                                    .events!
                                    .freeFormDetailList![
                                index]
                                    .types ==
                                    5)?Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              contoller
                                                                  .dataEditEvent
                                                                  .value
                                                                  .events!
                                                                  .freeFormDetailList![
                                                                      index]
                                                                  .section!,
                                                              style: textStyle(
                                                                  context,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            if (contoller
                                                                        .listAnswer[
                                                                            index]
                                                                        .file!
                                                                        .value !=
                                                                    null &&
                                                                contoller
                                                                        .listAnswer[
                                                                            index]
                                                                        .file!
                                                                        .value !=
                                                                    '')
                                                              Container(
                                                                height: 150,
                                                                width: 250,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  color: Colors.grey.shade200
                                                                ),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Icon(CupertinoIcons.doc_text_fill,size: 40,color: colorGrey,),
                                                                    SizedBox(height: 20,),
                                                                    Text(
                                                                     contoller.listAnswer[index].file!.name!,
                                                                      style: textStyle(
                                                                          context,
                                                                          color:
                                                                          colorGrey,
                                                                          fontSize:
                                                                          14),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            DottedBorder(
                                                              color: Colors.grey
                                                                  .shade300,
                                                              dashPattern: [
                                                                8,
                                                                4
                                                              ],
                                                              strokeWidth: 2,
                                                              radius:
                                                                  const Radius
                                                                      .circular(
                                                                      5),
                                                              borderType:
                                                                  BorderType
                                                                      .RRect,
                                                              strokeCap:
                                                                  StrokeCap
                                                                      .round,
                                                              child: cu.InkWell(
                                                                onTap:
                                                                    () async {
                                                                  await contoller
                                                                      .selectedFileSingle(
                                                                          context,
                                                                          type:
                                                                              5,
                                                                          index:
                                                                              index);
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          colorWhite,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  width: 220,
                                                                  height: 80,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: 50,
                                                                    width: 180,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .grey
                                                                              .shade200),
                                                                    ),
                                                                    child: Text(
                                                                      'เลือกไฟล์',
                                                                      style: textStyle(
                                                                          context,
                                                                          color:
                                                                              colorBlue,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                            cu.Divider(
                                                              height: 1,
                                                              color: Colors.grey
                                                                  .shade200,
                                                            ),
                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                          ],
                                                        ),
                                                      ):SizedBox();
                              },
                            ),

                          Container(
                              height: 40,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'พิกัดที่เกิดภัยพิบัติ',
                                style: textStyle(context,
                                    color: colorBlack, fontSize: 13),
                              )),
                          Stack(
                            children: [
                              Container(
                                color: Colors.blue,
                                height: 400,
                                child: Center(
                                    child: FlutterMap(
                                  mapController: contoller.mapController.value,
                                  options: MapOptions(
                                      initialCenter: LatLng(
                                          double.parse(
                                              contoller.lat.value.text),
                                          double.parse(
                                              contoller.lng.value.text)),
                                      initialZoom: 14,
                                      interactionOptions:
                                          const InteractionOptions(
                                        flags:
                                            InteractiveFlag.doubleTapDragZoom |
                                                InteractiveFlag.drag,
                                      ),
                                      onPositionChanged: (v, c) {
                                        contoller.lat.value.text =
                                            v.center!.latitude.toString();
                                        contoller.lng.value.text =
                                            v.center!.longitude.toString();
                                      }

                                      // maxZoom: 17,
                                      // minZoom: 10
                                      ),
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName: 'com.example.app',
                                    ),
                                  ],
                                )),
                              ),
                              Positioned(
                                  top: 20,
                                  left: 20,
                                  child: Container(
                                    height: 350,
                                    width: 300,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          color: colorWhite,
                                          child: TextFormField(
                                            controller: contoller.search.value,
                                            autofocus: false,
                                            onChanged: (value) {
                                              // if (value.isNotEmpty) {
                                              //   contoller.searchMap(value);
                                              // }
                                              if (value.isEmpty) {
                                                contoller.listSearchMap.clear();
                                              }
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon: InkWell(
                                                  onTap: () async {
                                                    contoller.searchMap(
                                                        contoller
                                                            .search.value.text);
                                                  },
                                                  child:
                                                      const Icon(Icons.search)),
                                              fillColor: colorWhite,
                                              hintText: "ค้นหา",
                                              hintStyle: TextStyle(
                                                  fontSize: 13.0,
                                                  color: colorGrey,
                                                  fontWeight: FontWeight.w400),
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: colorGrey,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 310,
                                          child: ListView.builder(
                                            itemCount: contoller
                                                .listSearchMap.value.length,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () {
                                                contoller.mapController.value.move(
                                                    LatLng(
                                                        double.parse(contoller
                                                            .listSearchMap
                                                            .value[index]
                                                            .lat!),
                                                        double.parse(contoller
                                                            .listSearchMap
                                                            .value[index]
                                                            .lon!)),
                                                    16);
                                                contoller.listSearchMap.clear();
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                    top: 2,
                                                    bottom: 2),
                                                height: 45,
                                                color: (index % 2 == 1)
                                                    ? Colors.grey.shade300
                                                    : Colors.white,
                                                child: Text(contoller
                                                    .listSearchMap
                                                    .value[index]
                                                    .displayName
                                                    .toString()),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              Container(
                                height: 400,
                                child: Center(
                                  child: Container(
                                    height: 60,
                                    child: const Column(
                                      children: [
                                        SizedBox(
                                          height: 30,
                                          child: Icon(
                                            Icons.location_pin,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 180,
                            child: Column(
                              children: [
                                Row(children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'ที่อยู่',
                                          style: textStyle(context,
                                              color: colorBlack, fontSize: 13),
                                        )),
                                  ),
                                ]),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: colorWhite,
                                        ),
                                        height: 150,
                                        child: TextFormField(
                                          maxLines: 300,
                                          controller: contoller.address.value,
                                          decoration: InputDecoration.collapsed(
                                            fillColor: colorWhite,
                                            hintText: "ที่อยู่",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
                                                color: colorGrey,
                                                fontWeight: FontWeight.w400),
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ละติจูด',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'ลองจิจูด',
                                            style: textStyle(context,
                                                color: colorBlack,
                                                fontSize: 13),
                                          )),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 40,
                                        color: colorWhite,
                                        child: TextFormField(
                                          controller: contoller.lat.value,
                                          autofocus: false,
                                          onChanged: (value) {
                                            contoller.mapController.value.move(
                                                LatLng(
                                                    double.parse(contoller
                                                        .lat.value.text),
                                                    double.parse(contoller
                                                        .lng.value.text)),
                                                16);
                                          },
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "ละติจูด",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
                                                color: colorGrey,
                                                fontWeight: FontWeight.w400),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: colorGrey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: 40,
                                        color: colorWhite,
                                        child: TextFormField(
                                          controller: contoller.lng.value,
                                          onChanged: (value) {
                                            contoller.mapController.value.move(
                                                LatLng(
                                                    double.parse(contoller
                                                        .lat.value.text),
                                                    double.parse(contoller
                                                        .lng.value.text)),
                                                16);
                                          },
                                          decoration: InputDecoration(
                                            fillColor: colorWhite,
                                            hintText: "ลองจิจูด",
                                            hintStyle: TextStyle(
                                                fontSize: 13.0,
                                                color: colorGrey,
                                                fontWeight: FontWeight.w400),
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: colorGrey,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'อัพเดทสถานะการณ์รายงาน',
                            style: textStyle(context,
                                color: colorBlack, fontSize: 16,fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(

                            child: Column(
                              children: [
                                DottedBorder(
                                  color: Colors.grey.shade300,
                                  dashPattern: [8, 4],
                                  strokeWidth: 2,
                                  radius: const Radius.circular(5),
                                  borderType: BorderType.RRect,
                                  strokeCap: StrokeCap.round,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: colorWhite,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: (contoller.listConvertImageLog.value.isEmpty)
                                        ? Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                contoller
                                                    .selectedImage(context,2);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 80, bottom: 80),
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
                                                    border: Border.all(
                                                        color: colorGrey)),
                                                child: Text(
                                                  'เลือกรูป',
                                                  style: textStyle(context,
                                                      color: colorBlue,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                        : GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 150,
                                        crossAxisSpacing: 3.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 0.8,
                                      ),
                                      itemCount: contoller
                                          .listConvertImageLog.value.length +
                                          1,
                                      itemBuilder: (context, index) {
                                        if (index ==
                                            contoller.listConvertImageLog.value
                                                .length) {
                                          return InkWell(
                                            onTap: () {
                                              contoller
                                                  .selectedImage(context,2);
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
                                                    border: Border.all(
                                                        color: colorGrey)),
                                                child: Text(
                                                  'เลือกรูป',
                                                  style: textStyle(context,
                                                      color: colorBlue,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Stack(
                                            children: [
                                              Container(
                                                height: 200,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            contoller
                                                                .listConvertImageLog
                                                                .value[index]
                                                                .pathImage!),
                                                        fit: BoxFit.cover)),
                                              ),
                                              Positioned(
                                                child: InkWell(
                                                  onTap: () {
                                                    contoller.listConvertImageLog
                                                        .removeAt(index);
                                                  },
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.clear,
                                                      size: 15,
                                                      color: colorBlack,
                                                    ),
                                                    alignment: Alignment.center,
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(100),
                                                        color: colorGrey),
                                                  ),
                                                ),
                                                right: 0,
                                                top: 0,
                                              )
                                            ],
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                DottedBorder(
                                  color: Colors.grey.shade300,
                                  dashPattern: [8, 4],
                                  strokeWidth: 2,
                                  radius: const Radius.circular(5),
                                  borderType: BorderType.RRect,
                                  strokeCap: StrokeCap.round,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: colorWhite,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: (contoller.listConvertFileLog.value.isEmpty)
                                        ? Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                contoller
                                                    .selectedFile(context);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 80, bottom: 80),
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
                                                    border: Border.all(
                                                        color: colorGrey)),
                                                child: Text(
                                                  'เลือกไฟล์',
                                                  style: textStyle(context,
                                                      color: colorBlue,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                        : GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 150,
                                        crossAxisSpacing: 3.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 0.8,
                                      ),
                                      itemCount: contoller
                                          .listConvertFileLog.value.length +
                                          1,
                                      itemBuilder: (context, index) {
                                        if (index ==
                                            contoller.listConvertFileLog.value
                                                .length) {
                                          return InkWell(
                                            onTap: () {
                                              contoller
                                                  .selectedFile(context);
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
                                                    border: Border.all(
                                                        color: colorGrey)),
                                                child: Text(
                                                  'เลือกไฟล์',
                                                  style: textStyle(context,
                                                      color: colorBlue,
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Stack(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 200,
                                                width: 200,
                                                color: Colors.grey.shade100,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(CupertinoIcons.arrow_down_doc,size: 20,),
                                                    SizedBox(width: 5,),
                                                    Text(
                                                      contoller.listConvertFileLog[index].imageName!,
                                                      style: textStyle(context,
                                                          color: colorBlue,
                                                          fontSize: 13),
                                                    ),
                                                    SizedBox(width: 5,),

                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                child: InkWell(
                                                  onTap: () {

                                                    contoller.listConvertFileLog
                                                        .removeAt(index);
                                                  },
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.clear,
                                                      size: 15,
                                                      color: colorBlack,
                                                    ),
                                                    alignment: Alignment.center,
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(100),
                                                        color: colorGrey),
                                                  ),
                                                ),
                                                right: 0,
                                                top: 0,
                                              )
                                            ],
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 180,
                                  child: Column(
                                    children: [
                                      Row(children: [
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'รายละเอียดรายงาน',
                                                style: textStyle(context,
                                                    color: colorBlack, fontSize: 13),
                                              )),
                                        ),
                                      ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                border:
                                                Border.all(color: Colors.grey),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                color: colorWhite,
                                              ),
                                              height: 150,
                                              child: TextFormField(
                                                maxLines: 300,
                                                controller: contoller.remarkReport.value,
                                                decoration: InputDecoration.collapsed(
                                                  fillColor: colorWhite,
                                                  hintText: "รายละเอียดรายงาน",
                                                  hintStyle: TextStyle(
                                                      fontSize: 13.0,
                                                      color: colorGrey,
                                                      fontWeight: FontWeight.w400),
                                                  filled: true,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Divider(
                            height: 2,
                            color: colorGrey,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: () async {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'คำเตือน',
                                            style: textStyle(context,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      content:
                                          const Text('คุณต้องการยกเลิกหรือไม่'),
                                      actions: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'ยกเลิก',
                                              style: textStyle(context,
                                                  fontSize: 14),
                                            )),
                                        InkWell(
                                            onTap: () async {
                                              await contoller.clearData();
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'ตกลง',
                                              style: textStyle(context,
                                                  fontSize: 14),
                                            )),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: colorGrey),
                                  child: Text(
                                    'ยกเลิก',
                                    style: textStyle(context,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: colorWhite),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () async {
                                  await contoller.submit(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: colorAmber),
                                  child: Text(
                                    'บันทึก1',
                                    style: textStyle(context,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: colorWhite),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          )
                        ],
                      ))),
            ],
          ),
        )
      ],
    );
  }

  List<Widget> listCheckBox(BuildContext context, int index, int length) {
    final ContollerEditOthersList contoller =
        Get.put(ContollerEditOthersList(), permanent: false);

    List<Widget> wi = [];
    for (int i = 0; i < length; i++) {
      wi.add(Container(
        child: Row(
          children: [
            cu.Checkbox(
              value: contoller.listAnswer[index].checkbox!.listvalueoption![i],
              onChanged: (value) {
                setState(() {
                  if (contoller
                          .listAnswer[index].checkbox!.listvalueoption![i] ==
                      true) {
                    contoller.listAnswer[index].checkbox!.listvalueoption![i] =
                        false;
                    contoller.listAnswer[index].checkbox!.listvalueoption![i] =
                        false;

                    contoller.listAnswer[index].checkbox!.valueID!.removeAt(
                        contoller.listAnswer[index].checkbox!.valueID!.indexOf(
                            contoller
                                .listAnswer[index].checkbox!.listoptionID![i]));
                  } else {
                    contoller.listAnswer[index].checkbox!.listvalueoption![i] =
                        true;
                    contoller.listAnswer[index].checkbox!.listvalueoption![i] =
                        true;
                    contoller.listAnswer[index].checkbox!.valueID!.add(contoller
                        .listAnswer[index].checkbox!.listoptionID![i]
                        .toString());
                  }
                });
                // setState(() {
                //   _valueCheck=value!;
                // });
              },
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              contoller.listAnswer[index].checkbox!.listoption![i],
              style: textStyle(context, color: Colors.black, fontSize: 13),
            )
          ],
        ),
      ));
      wi.add(const SizedBox(
        height: 10,
      ));
    }
    return wi;
  }
}
