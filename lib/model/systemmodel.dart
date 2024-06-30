class SystemAdminModel {
  bool? success;
  List<UserList>? userList;

  SystemAdminModel({this.success, this.userList});

  SystemAdminModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['userList'] != null) {
      userList = <UserList>[];
      json['userList'].forEach((v) {
        userList!.add(new UserList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.userList != null) {
      data['userList'] = this.userList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserList {
  String? id;
  String? email;
  String? name;
  String? refId;
  String? positionName;
  String? username;
  String? usernameRef;
  String? roleCode;
  String? roleName;
  int? role;
  String? createDatetime;
  bool? isAccept;

  UserList(
      {this.id,
        this.email,
        this.name,
        this.refId,
        this.positionName,
        this.username,
        this.usernameRef,
        this.roleCode,
        this.roleName,
        this.role,
        this.createDatetime,
        this.isAccept});

  UserList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    refId = json['refId'];
    positionName = json['positionName'];
    username = json['username'];
    usernameRef = json['usernameRef'];
    roleCode = json['roleCode'];
    roleName = json['roleName'];
    role = json['role'];
    createDatetime = json['createDatetime'];
    isAccept = json['isAccept'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['refId'] = this.refId;
    data['positionName'] = this.positionName;
    data['username'] = this.username;
    data['usernameRef'] = this.usernameRef;
    data['roleCode'] = this.roleCode;
    data['roleName'] = this.roleName;
    data['role'] = this.role;
    data['createDatetime'] = this.createDatetime;
    data['isAccept'] = this.isAccept;
    return data;
  }
}
