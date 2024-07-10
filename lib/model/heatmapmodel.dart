class HeatMapModel {
  bool? success;
  List<ProvincesList>? provincesList;

  HeatMapModel({this.success, this.provincesList});

  HeatMapModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['provincesList'] != null) {
      provincesList = <ProvincesList>[];
      json['provincesList'].forEach((v) {
        provincesList!.add(new ProvincesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.provincesList != null) {
      data['provincesList'] =
          this.provincesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProvincesList {
  String? provinceName;
  int? amount;
  String? lat;
  String? lng;

  ProvincesList({this.provinceName, this.amount, this.lat, this.lng});

  ProvincesList.fromJson(Map<String, dynamic> json) {
    provinceName = json['provinceName'];
    amount = json['amount'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provinceName'] = this.provinceName;
    data['amount'] = this.amount;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
