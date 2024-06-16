class LatLongModel {
  LatLongModel({
    this.reversegeocode,
  });

  Reversegeocode? reversegeocode;
}

class Reversegeocode {
  Reversegeocode({
    this.result,
    this.addressparts,
    this.timestamp,
    this.attribution,
    this.querystring,
  });

  Result? result;
  Addressparts? addressparts;
  String? timestamp;
  String? attribution;
  String? querystring;
}

class Addressparts {
  Addressparts({
    this.cityDistrict,
    this.city,
    this.county,
    this.province,
    this.iso31662Lvl4,
    this.postcode,
    this.country,
    this.countryCode,
  });

  String? cityDistrict;
  String? city;
  String? county;
  String? province;
  String? iso31662Lvl4;
  String? postcode;
  String? country;
  String? countryCode;
}

class Result {
  Result({
    this.placeId,
    this.osmType,
    this.osmId,
    this.lat,
    this.lon,
    this.boundingbox,
    this.placeRank,
    this.addressRank,
    this.text,
  });

  String? placeId;
  String? osmType;
  String? osmId;
  String? lat;
  String? lon;
  String? boundingbox;
  String? placeRank;
  String? addressRank;
  String? text;
}
