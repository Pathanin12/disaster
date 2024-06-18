class SearchMapModel {
  int? placeId;
  String? licence;
  String? osmType;
  int? osmId;
  String? lat;
  String? lon;
  String? type;
  int? placeRank;
  double? importance;
  String? addresstype;
  String? name;
  String? displayName;
  Address? address;
  List<String>? boundingbox;

  SearchMapModel(
      {this.placeId,
        this.licence,
        this.osmType,
        this.osmId,
        this.lat,
        this.lon,
        this.type,
        this.placeRank,
        this.importance,
        this.addresstype,
        this.name,
        this.displayName,
        this.address,
        this.boundingbox});

  SearchMapModel.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    licence = json['licence'];
    osmType = json['osm_type'];
    osmId = json['osm_id'];
    lat = json['lat'];
    lon = json['lon'];
    type = json['type'];
    placeRank = json['place_rank'];
    importance = json['importance'];
    addresstype = json['addresstype'];
    name = json['name'];
    displayName = json['display_name'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    boundingbox = json['boundingbox'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['licence'] = this.licence;
    data['osm_type'] = this.osmType;
    data['osm_id'] = this.osmId;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['type'] = this.type;
    data['place_rank'] = this.placeRank;
    data['importance'] = this.importance;
    data['addresstype'] = this.addresstype;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['boundingbox'] = this.boundingbox;
    return data;
  }
}

class Address {
  String? village;
  String? municipality;
  String? district;
  String? province;
  String? iSO31662Lvl4;
  String? postcode;
  String? country;
  String? countryCode;

  Address(
      {this.village,
        this.municipality,
        this.district,
        this.province,
        this.iSO31662Lvl4,
        this.postcode,
        this.country,
        this.countryCode});

  Address.fromJson(Map<String, dynamic> json) {
    village = json['village'];
    municipality = json['municipality'];
    district = json['district'];
    province = json['province'];
    iSO31662Lvl4 = json['ISO3166-2-lvl4'];
    postcode = json['postcode'];
    country = json['country'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['village'] = this.village;
    data['municipality'] = this.municipality;
    data['district'] = this.district;
    data['province'] = this.province;
    data['ISO3166-2-lvl4'] = this.iSO31662Lvl4;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    return data;
  }
}
