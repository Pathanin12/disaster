class ProfileModel {
  String? code;
  String? message;
  Profile? profile;

  ProfileModel({this.code, this.message, this.profile});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
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
        this.roleName});

  Profile.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    email = json['email'];
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
  OrganizationDirectParent? organizationDirectParent;
  List<OrganizationDirectParent>? organizationsParent;

  Organization(
      {this.code,
        this.refCode,
        this.refLevelCode,
        this.name,
        this.fullName,
        this.nameEn,
        this.fullNameEn,
        this.level,
        this.organizationDirectParent,
        this.organizationsParent});

  Organization.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    refCode = json['refCode'];
    refLevelCode = json['refLevelCode'];
    name = json['name'];
    fullName = json['fullName'];
    nameEn = json['nameEn'];
    fullNameEn = json['fullNameEn'];
    level = json['level'];
    organizationDirectParent = json['organizationDirectParent'] != null
        ? new OrganizationDirectParent.fromJson(
        json['organizationDirectParent'])
        : null;
    if (json['organizationsParent'] != null) {
      organizationsParent = <OrganizationDirectParent>[];
      json['organizationsParent'].forEach((v) {
        organizationsParent!.add(new OrganizationDirectParent.fromJson(v));
      });
    }
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
    if (this.organizationDirectParent != null) {
      data['organizationDirectParent'] =
          this.organizationDirectParent!.toJson();
    }
    if (this.organizationsParent != null) {
      data['organizationsParent'] =
          this.organizationsParent!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrganizationDirectParent {
  String? code;
  String? refCode;
  String? refLevelCode;
  String? name;
  String? fullName;
  String? nameEn;
  String? fullNameEn;
  String? level;

  OrganizationDirectParent(
      {this.code,
        this.refCode,
        this.refLevelCode,
        this.name,
        this.fullName,
        this.nameEn,
        this.fullNameEn,
        this.level});

  OrganizationDirectParent.fromJson(Map<String, dynamic> json) {
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
