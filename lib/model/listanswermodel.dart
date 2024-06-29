
import 'package:flutter/cupertino.dart';

class ListAnswerModel {
  Dropdown? dropdown;
  Checkbox? checkbox;
  Dropdown? radio;
  Textfield? textfield;
  Image? image;
  Image? file;

  ListAnswerModel(
      {this.dropdown,
        this.checkbox,
        this.radio,
        this.textfield,
        this.image,
        this.file});

  ListAnswerModel.fromJson(Map<String, dynamic> json) {
    dropdown = json['dropdown'] != null
        ? new Dropdown.fromJson(json['dropdown'])
        : null;
    checkbox = json['checkbox'] != null
        ? new Checkbox.fromJson(json['checkbox'])
        : null;
    radio = json['radio'] != null ? new Dropdown.fromJson(json['radio']) : null;
    textfield = json['textfield'] != null
        ? new Textfield.fromJson(json['textfield'])
        : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    file = json['file'] != null ? new Image.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dropdown != null) {
      data['dropdown'] = this.dropdown!.toJson();
    }
    if (this.checkbox != null) {
      data['checkbox'] = this.checkbox!.toJson();
    }
    if (this.radio != null) {
      data['radio'] = this.radio!.toJson();
    }
    if (this.textfield != null) {
      data['textfield'] = this.textfield!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    return data;
  }
}

class Dropdown {
  List<String>? listoption;
  List<String>? listoptionID;
  String? value;
  String? valueID;

  Dropdown({this.listoption, this.listoptionID, this.value, this.valueID});

  Dropdown.fromJson(Map<String, dynamic> json) {
    listoption = json['listoption'].cast<String>();
    listoptionID = json['listoptionID'].cast<String>();
    value = json['value'];
    valueID = json['valueID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listoption'] = this.listoption;
    data['listoptionID'] = this.listoptionID;
    data['value'] = this.value;
    data['valueID'] = this.valueID;
    return data;
  }
}

class Checkbox {
  List<String>? listoption;
  List<bool>? listvalueoption;
  List<String>? listoptionID;
  List<String>? value;
  List<String>? valueID;

  Checkbox(
      {this.listoption,
        this.listvalueoption,
        this.listoptionID,
        this.value,
        this.valueID});

  Checkbox.fromJson(Map<String, dynamic> json) {
    listoption = json['listoption'].cast<String>();
    listvalueoption = json['listvalueoption'].cast<bool>();
    listoptionID = json['listoptionID'].cast<String>();
    value = json['value'].cast<String>();
    valueID = json['valueID'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listoption'] = this.listoption;
    data['listvalueoption'] = this.listvalueoption;
    data['listoptionID'] = this.listoptionID;
    data['value'] = this.value;
    data['valueID'] = this.valueID;
    return data;
  }
}

class Textfield {
  TextEditingController? value;

  Textfield({this.value});

  Textfield.fromJson(Map<String, dynamic> json) {
    value = json['value'].cast<TextEditingController>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class Image {
  String? value;
  String? name;

  Image({this.value,this.name});

  Image.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['name'] = this.name;
    return data;
  }
}