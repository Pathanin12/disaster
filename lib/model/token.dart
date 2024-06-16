class LoginToKen {
  String? accessToken;
  String? tokenType;
  String? expires;


  LoginToKen({this.accessToken, this.tokenType, this.expires});

  LoginToKen.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    tokenType = json['tokenType'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['tokenType'] = this.tokenType;
    data['expires'] = this.expires;
    return data;
  }
}
