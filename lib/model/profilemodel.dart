class ProfileModel {
  bool? success;
  User? user;

  ProfileModel({this.success, this.user});
  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  Profile? profile;

  User({this.profile});

  User.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? code;
  String? email;
  String? name;
  String? refId;
  String? positionName;
  String? username;
  String? usernameRef;
  Organization? organization;
  String? roleCode;
  String? roleName;
  int? role;
  String? provinceName;

  Profile(
      {this.code,
        this.email,
        this.name,
        this.refId,
        this.positionName,
        this.username,
        this.usernameRef,
        this.organization,
        this.roleCode,
        this.roleName,this.role,this.provinceName});

  Profile.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    role = json['role'];
    email = json['email'];
    provinceName = json['provinceName'];
    name = json['name'];
    refId = json['refId'];
    positionName = json['positionName'];
    username = json['username'];
    usernameRef = json['usernameRef'];
    organization = json['organization'] != null
        ? new Organization.fromJson(json['organization'])
        : null;
    roleCode = json['roleCode'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['role'] = this.role;
    data['provinceName'] = this.provinceName;
    data['email'] = this.email;
    data['name'] = this.name;
    data['refId'] = this.refId;
    data['positionName'] = this.positionName;
    data['username'] = this.username;
    data['usernameRef'] = this.usernameRef;
    if (this.organization != null) {
      data['organization'] = this.organization!.toJson();
    }
    data['roleCode'] = this.roleCode;
    data['roleName'] = this.roleName;
    return data;
  }
}

class Organization {
  String? code;
  String? refCode;
  String? refLevelCode;
  String? name;
  String? fullName;
  String? nameEn;
  String? fullNameEn;
  String? level;

  Organization(
      {this.code,
        this.refCode,
        this.refLevelCode,
        this.name,
        this.fullName,
        this.nameEn,
        this.fullNameEn,
        this.level});

  Organization.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    refCode = json['refCode'];
    refLevelCode = json['refLevelCode'];
    name = json['name'];
    fullName = json['fullName'];
    nameEn = json['nameEn'];
    fullNameEn = json['fullNameEn'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['refCode'] = this.refCode;
    data['refLevelCode'] = this.refLevelCode;
    data['name'] = this.name;
    data['fullName'] = this.fullName;
    data['nameEn'] = this.nameEn;
    data['fullNameEn'] = this.fullNameEn;
    data['level'] = this.level;
    return data;
  }
}
